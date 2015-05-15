<?php
/**
 * 基本控制器
 *
 */
class TopAction extends Ftxia8MobComFuncAction{
    protected function _initialize() {
        //消除所有的magic_quotes_gpc转义
        Input::noGPC();
        //初始化网站配置
        if (false === $setting = F('setting')) {
            $setting = D('setting')->setting_cache();
        }
        C($setting);
        //发送邮件
        $this->assign('async_sendmail', session('async_sendmail'));
		$url		=	get_url();
		$searchbot	=	get_spider();
		$ip			=	get_client_ip();
		if ($searchbot) {
			$showdate=date('Y-m-d');
			$file=FTX_DATA_PATH.'spider/'.$showdate.'.txt';
			$time=time();
			$data=fopen($file,'a');
			fwrite($data,"$searchbot|$url|$ip|$time\n");
			fclose($data);
		}
    }

    public function _empty() {
        $this->_404();
    }
    
    protected function _404($url = '') {
        if ($url) {
            redirect($url);
        } else {
            send_http_status(404);
            $this->display(TMPL_PATH . '404.html');
            exit;
        }
    }
}
?>