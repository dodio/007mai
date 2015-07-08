<?php
/**
 * 前台控制器基类
 */
class FirstendAction extends TopAction {

    protected $visitor = null;
	
    public function _initialize() {
        parent::_initialize();
        //网站状态
        if (!C('ftx_site_status')) {
            header('Content-Type:text/html; charset=utf-8');
            exit(C('ftx_closed_reason'));
        }
        C('DATA_CACHE_TIME',C('ftx_site_cachetime'));
        $this->_init_visitor();
        $this->_assign_oauth();
        $this->assign('nav_curr', '');
        $mod_cate  = D('items_cate');
        $this->assign('cate_data', $mod_cate->cate_data_cache(true));
        $this->assign('cate_list', $mod_cate->cate_cache());

        if(!IS_AJAX){
            //不是ajax 才布置淘点金
            $action = explode("/", __ACTION__);
            $m =  $action[1];
            $a = $action[2];
            $dianjin = C("TAO_DIAN_JIN");
            if(!isset($dianjin[$m])){
                $pid = $dianjin['default'];

            }else{
                if(isset($dianjin[$m][$a])){
                    $pid = $dianjin[$m][$a];
                }elseif(isset($dianjin[$m]['default'])){
                    $pid = $dianjin[$m]['default'];
                }else{
                    $pid = $dianjin['default'];
                }
            }
            $this->assign('taodianjin_pid',$pid);
        }
    }
    
    /**
    * 初始化访问者
    */
    private function _init_visitor() {
        $this->visitor = new user_visitor();
        $this->assign('visitor', $this->visitor->info);
    }

    /**
     * 第三方登陆模块
     */
    private function _assign_oauth() {
        if (false === $oauth_list = F('oauth_list')) {
            $oauth_list = D('oauth')->oauth_cache();
        }
        $this->assign('oauth_list', $oauth_list);
    }

    /**
     * SEO设置
     */
    protected function _config_seo($seo_info = array(), $data = array()) {
        $page_seo = array(
            'title' => C('ftx_site_title'),
            'keywords' => C('ftx_site_keyword'),
            'description' => C('ftx_site_description')
        );
        $page_seo = array_merge($page_seo, $seo_info);
        //开始替换
        $searchs = array('{site_name}', '{site_title}', '{site_keywords}', '{site_description}');
        $replaces = array(C('ftx_site_name'), C('ftx_site_title'), C('ftx_site_keyword'), C('ftx_site_description'));
        preg_match_all("/\{([a-z0-9_-]+?)\}/", implode(' ', array_values($page_seo)), $pageparams);
        if ($pageparams) {
            foreach ($pageparams[1] as $var) {
                $searchs[] = '{' . $var . '}';
                $replaces[] = $data[$var] ? strip_tags($data[$var]) : '';
            }
            //符号
            $searchspace = array('((\s*\-\s*)+)', '((\s*\,\s*)+)', '((\s*\|\s*)+)', '((\s*\t\s*)+)', '((\s*_\s*)+)');
            $replacespace = array('-', ',', '|', ' ', '_');
            foreach ($page_seo as $key => $val) {
                $page_seo[$key] = trim(preg_replace($searchspace, $replacespace, str_replace($searchs, $replaces, $val)), ' ,-|_');
            }
        }
        $this->assign('page_seo', $page_seo);
    }

    /**
    * 连接用户中心
    */
    protected function _user_server() {
        $passport = new passport(C('ftx_integrate_code'));
        return $passport;
    }

    /**
     * 前台分页统一
     */
    protected function _pager($count, $pagesize) {
        $pager = new Page($count, $pagesize);
        $pager->rollPage = 5;
		$pager->setConfig('header','条记录');
        $pager->setConfig('prev', '上一页');
		$pager->setConfig('next', '下一页');
		$pager->setConfig('first', '第一页');
		$pager->setConfig('last', '最后一页');
        $pager->setConfig('theme', '%upPage% %first% %linkPage% %end% %downPage%');
        return $pager;
    }

    //使用自己的404
    protected function _404($url){
        header('HTTP/1.1 404 Not Found');
        header("status: 404 Not Found");
        $this->display("error:404");
        exit();
    }
    protected function visited_page(){
        // 未登录不记录
        if(!$this->visitor->is_login){
            return;
        }
        $delay = 60; //访问页面间隔秒数
        $userinfo = $this->visitor->info;
        $stat_mod = D("user_stat");

        // 用于stat 检测天数的action
        $action_page = array(
            'action' => 'visited_page',
            'type' => 'cooldown_no_refesh',
            'cycle' => 86400
        );


        if($userinfo['visited_page']){
            // session 内有访问次数
            $visited_page = $userinfo['visited_page'];
        }else{
            //获取今天内的访问次数
            $where = array(
                "uid"=>$userinfo[id],
                "action"=>$action_page['action'],
                'lasttime'=>array("GT",todaytime()) 
                );
            
            if( $num = $stat_mod->field('num')->where($where)->find() ){
                // 今天以内，无session前访问过也算
                $visited_page = array(
                    "num"=>$num['num'],
                    "time"=>time() - ($delay+60) //时间提前60秒让这次访问也能被记录
                );
            }else{
                // 今天以内还没有访问过
                $visited_page = array(
                    "num"=>0,
                    "time"=>time() - ($delay+60) //时间提前60秒让这次访问也能被记录
                );
            }
        }


        if( (time() - $visited_page['time']) < $delay ){
            // 访问间隔时间未到，不计算
            return;
        }
        $score_action = array(
            "uid"=>$userinfo['id'],
            'uname'=> $userinfo['username']
            );
        $pgae_10 = 10;
        $pgae_50 = 50;
        if($visited_page['num'] <= $pgae_10 ){
            // 阅读页面小于十页，去检测并记录 10 页的任务
            if(!$stat_mod->check_num($userinfo['id'],$action_page,$pgae_10)){
                // 足够10页面
                $score_action['action'] = 'read_page10';
                tag("read_page10",$score_action);
            }
        }else if($visited_page['num'] <= $pgae_50){
            // 大于10小于50的，就去检测 50 页的任务
            if(!$stat_mod->check_num($userinfo['id'],$action_page,$pgae_50)){
                // 足够10页面
                $score_action['action'] = 'read_page50';
                tag("read_page50",$score_action);
            }
        }
        $visited_page['num']+=1;
        $visited_page['time'] = time();
        $this->visitor->update_info("visited_page",$visited_page);
    }
}
?>