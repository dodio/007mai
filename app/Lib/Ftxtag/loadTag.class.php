<?php

/**
 * 合并加载JS和CSS文件
 */
class loadTag {


    function __construct() {
        
    }

    public function js($options) {
        $jm = new JSMin('');
        //网站根目录
        $combile_name = '/static/dist_js/' . md5($options['href']) . '.js';
        $path = ROOT_PATH . $combile_name;
        $statics_url = ROOT_PATH.'/static';
        if (!is_file($path)) {
            //静态资源地址
            $files = explode(',', $options['href']);
            $content = '';
            foreach ($files as $val) {
                $val = trim( str_replace('__STATIC__', $statics_url, $val) );
                $content.=file_get_contents($val);
            }
            file_put_contents($path, $jm->minify($content));
        }
        echo ( '<script type="text/javascript" src="' . __ROOT__ . $combile_name . '?THIS_IS_IT"></script>');
    }



    public function css($options) {
        $files = explode(',', $options['href']);
        $dirs = array();
        $statics_url = '/static';
        foreach ($files as $val) {
            $val = trim( str_replace('__STATIC__', $statics_url, $val) );
            $val_dir = dirname(dirname($val));
            if(!isset($dirs[$val_dir])){
                $dirs[$val_dir] = array();
            }
            $dirs[$val_dir][] = $val;
        }

        foreach ($dirs as $dir => $files) {
            $this->_css($files,$dir);
            
        }

    }

    private function _css($files,$dir){
        $combile_name = $dir."/dist_css/" . md5(implode(",", $files)) . '.css';
        $path = ROOT_PATH . $combile_name ;
        if(is_file($path)){
            echo ( '<link rel="stylesheet" type="text/css" href="' . __ROOT__ . $combile_name . '?THIS_IS_IT" />');
            return;
        }
        if(!is_dir(dirname($path))){
            mkdir(dirname($path));
            //缓存一下css编译目录，方便通过后台清理
            $css_dirs = S("combile_css_dirs");
            if($css_dirs === false){
                $css_dirs = array();
            }
            if(!in_array($dir, $css_dirs)){
                $css_dirs[] = $dir;
            }
            S("combile_css_dirs",$css_dirs);
        }
        $content = '';
        foreach ($files as $value) {
            $content.=file_get_contents(ROOT_PATH ."/" . $value)."\n";
        }
        file_put_contents($path, $content);
        echo ( '<link rel="stylesheet" type="text/css" href="' . __ROOT__ . $combile_name . '?THIS_IS_IT" />');
    }
}