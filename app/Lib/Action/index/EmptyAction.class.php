<?php
/**
 * 404错误 
 */
class EmptyAction extends Action {
    public function _empty() {
    		$this->redirect('/');
    		exit;
        send_http_status(404);
        $this->display('error/404.tpl');
    }
}