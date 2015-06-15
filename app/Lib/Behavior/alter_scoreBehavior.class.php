<?php

defined('THINK_PATH') or exit();

class alter_scoreBehavior extends Behavior {

    public function run(&$_data){
        $this->_alter_score($_data);
    }

    /**
     * 改变用户积分
     * 配置操作行为必须和标签名称一致
     */
    private function _alter_score($_data) {
        $score = C('ftx_score_rule.'.$_data['action']); //获取积分变量
        
        if (intval($score) == 0) return false; //积分为0
        $actions = C("score_action");
        //如果在action在 score_action.php 的配置里没有定义，则忽略
        if(!isset($actions[$_data['action']])){
            return $return;
        }
        $act_arr = $actions[$_data['action']];
        //积分限制次数
        $max_num = intval(C('ftx_score_rule.'. $act_arr['action'] .'_nums'));

        $stat_mod = D("user_stat");

        if ( $stat_mod->check_num($_data['uid'],$act_arr,$max_num) ) {

            $score_data = array('score'=>array('exp','score+'.$score), 'score_level'=>array('exp', 'score_level+'.abs($score)));
            M('user')->where(array('id'=>$_data['uid']))->setField($score_data); //改变用户积分
            //积分日志
            $score_log_mod = D('score_log');
            
            $data_log = array(
                'uid' => $_data['uid'],
                'uname' => $_data['uname'],
                'action' => $_data['action'],
                'score' => $score,
            );
            $score_log_mod->create($data_log);
            $score_log_mod->add();

            tag("score_change",$data_log);
        }
    }

}