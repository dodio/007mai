<?php

class cacheAction extends BackendAction
{
    public function _initialize() {
        parent::_initialize();
    }

    public function index() {
        $this->assign("combile_css_dirs",F("combile_css_dirs",'',RUNTIME_PATH));
        $this->display();
    }

    public function clear() {
        $type = $this->_get('type','trim');
        $obj_dir = new Dir;
        switch ($type) {
            case 'field':
                is_dir(DATA_PATH . '_fields/') && $obj_dir->del(DATA_PATH . '_fields/');
                break;
            case 'tpl':
                is_dir(CACHE_PATH) && $obj_dir->delDir(CACHE_PATH);
                break;
            case 'data':
                is_dir(DATA_PATH) && $obj_dir->del(DATA_PATH);
                is_dir(TEMP_PATH) && $obj_dir->delDir(TEMP_PATH);
                break;
            case 'shop':
                is_dir(DATA_PATH . '/shop/') && $obj_dir->del(DATA_PATH . '/shop/');
                break;
            case 'runtime':
                @unlink(RUNTIME_FILE);
                break;
            case 'logs':
                is_dir(LOG_PATH) && $obj_dir->delDir(LOG_PATH);
                break;
            case 'js':
                is_dir(ROOT_PATH . '/static/dist_js/') && $obj_dir->del(ROOT_PATH . '/static/dist_js/');
                F("clear_time_js",time(),RUNTIME_PATH);
                break;
            case 'css':
                F("clear_time_css",time(),RUNTIME_PATH);
                $this->_clear_dist_css($obj_dir);
                break;
			case 'api':
                is_dir(RUNTIME_PATH . '/FtxiaAPI/') && $obj_dir->delDir(RUNTIME_PATH . '/FtxiaAPI/');
                break;
			case 'taobao':
                is_dir(RUNTIME_PATH . '/TaobaoAPI/') && $obj_dir->delDir(RUNTIME_PATH . '/TaobaoAPI/');
                break;
        }
        $this->ajaxReturn(1);
    }

    public function qclear() {
        $obj_dir = new Dir;
        is_dir(DATA_PATH . '_fields/') && $obj_dir->del(DATA_PATH . '_fields/');
        is_dir(CACHE_PATH) && $obj_dir->delDir(CACHE_PATH);
        is_dir(DATA_PATH) && $obj_dir->del(DATA_PATH);
        is_dir(DATA_PATH . '/shop/') && $obj_dir->del(DATA_PATH . '/shop/');
        is_dir(TEMP_PATH) && $obj_dir->delDir(TEMP_PATH);
		is_dir(RUNTIME_PATH . '/FtxiaAPI/') && $obj_dir->delDir(RUNTIME_PATH . '/FtxiaAPI/');
		is_dir(RUNTIME_PATH . '/TaobaoAPI/') && $obj_dir->delDir(RUNTIME_PATH . '/TaobaoAPI/');
        is_dir(LOG_PATH) && $obj_dir->delDir(LOG_PATH);
        is_dir(ROOT_PATH . '/static/dist_js/') && $obj_dir->del(ROOT_PATH . '/static/dist_js/');
        F("clear_time_js",time(),RUNTIME_PATH);
        $this->_clear_dist_css($obj_dir);
        F("clear_time_css",time(),RUNTIME_PATH);
        @unlink(RUNTIME_FILE);
        $this->ajaxReturn(1, L('clear_success'));
    }

    private function _clear_dist_css($obj_dir){
        $css_dirs = F("combile_css_dirs",'',RUNTIME_PATH);
        if($css_dirs === false){
            return;
        }
        foreach ($css_dirs as $dir) {
            is_dir(ROOT_PATH.$dir) && $obj_dir->del(ROOT_PATH.$dir."/dist_css");
        }
    }
}