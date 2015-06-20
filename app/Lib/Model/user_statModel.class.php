<?php

class user_statModel extends Model
{
    protected $_auto = array (array('last_time','time',3,'function'));


    /**
     * 检查次数限制 专门模块
     * $uid 用户id
     * $act_arr 操作定义数组 
     *     array(
     *        "action"=>"login",// 操作名字
     *        "cycle" => 86400,// 周期时间 -1 就永久只有一次
     *        "type" => "reset"           //重置型，第一次发生+周期时间只能有 max_num 次数
     *                  "cooldown"        //冷却型，连续发生max_num 后，必须等待 周期时间 结束后有效,且每次操作会延长时间
     *                  "cooldown_no_refesh" //也是冷却型，不同在于，无效操作不刷新时间
     *     )
     *     //如果是 天级以上的周期，则对齐到天。而不是更小的单位
     *     
     * $max_num 周期内最大次数
     */
    public function check_num($uid,$act_arr,$max_num){
        $return = false;
        $action = $act_arr['action'];
        $type = $act_arr['type'];

        //先检查统计信息
        $stat = $this->field('num,last_time')->where(array('uid'=>$uid, 'action'=>$action))->find();
        if (!$stat) {
            $this->create(array('uid'=>$uid, 'action'=>$action));
            $this->add();
        }
        $new_num = $stat['num'] + 1;
        $data_update_stat = array();
        $cycle_time = $act_arr['cycle'];
        //cycle = -1 为永久一次操作
        if( $cycle_time == -1){
            //没有操作过
            if($new_num <= 1){
                $return = true;
            }else{
                $return = false;
            }
        }elseif($cycle_time > 0 ){
            //周期大于0
            
            if ($max_num == 0) {
                $return = true; //为0则不限制 

            }elseif($max_num == -1){
                $return = false; //为-1则全部限制

            }elseif($max_num >=1 ){
                //限制次数大于等于1次

                if($cycle_time < 86400){
                    //操作周期小于一天.则只看上次操作时间 与当前时间的对比
                    $time_function = "time";
                }else{
                    //周期时间大于等于1天情况(只能是整数天)，与今天时间对比
                    $time_function = "todaytime";
                }


                if ( ( $stat['last_time'] + $cycle_time ) <= $time_function()   ) {
                    //周期以外，清空次数
                    $new_num = 1;
                    $return = true;
                    //新周期开始时间
                    $data_update_stat['last_time'] = $time_function();
                }else{
                    //在这个周期内已有过这个操作
                    if($new_num <= $max_num){
                        //此周期的操作还没满
                        $return  = true;
                        //冷却型,冷却不刷新型，在没满的时候，都需要记录最新时间
                        if("cooldown" == $type || "cooldown_no_refesh" == $type){
                            $data_update_stat['last_time'] = $time_function();
                        }

                    }else{
                        //操作已满的情况下，冷却型一样记录该次操作时间，也就是会延长操作时间
                        $return = false;
                        if("cooldown" == $type){
                            $data_update_stat['last_time'] = $time_function();
                        }
                    }
                }
            }
        }
        $data_update_stat['num'] = $new_num;
        //更新统计
        $this->where(array('uid'=>$uid, 'action'=>$action))->save($data_update_stat);

        return $return;
    }
}