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

        $files = explode(',', $options['href']);

        if(NO_MERGE_STATICS){
            foreach ($files as $val) {
                $val = trim( $val );
                echo $this->_tag_js($val)."\n";
            }
            return;
        }
        if (!is_file($path)) {
            //静态资源地址
            $content = '';
            foreach ($files as $val) {
                $val = trim( str_replace('__STATIC__', $statics_url, $val) );
                $content.=file_get_contents($val);
            }
            file_put_contents($path, $jm->minify($content));
        }
        echo $this->_tag_js($combile_name);
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

        if(NO_MERGE_STATICS){
            foreach ($files as $val) {
                $val = trim( $val );
                echo $this->_tag_css($val)."\n";
            }
            return;
        }

        if(is_file($path)){
            echo $this->_tag_css($combile_name);
            return;
        }
        if(!is_dir(dirname($path))){
            mkdir(dirname($path));
        }
        //缓存一下css编译目录，方便通过后台清理
        $css_dirs = F("combile_css_dirs",'',RUNTIME_PATH);
        if($css_dirs === false){
            $css_dirs = array();
        }
        if(!in_array($dir, $css_dirs)){
            $css_dirs[] = $dir;
        }
        F("combile_css_dirs",$css_dirs,RUNTIME_PATH);
        
        $content = '';
        foreach ($files as $value) {
            $content.=file_get_contents(ROOT_PATH ."/" . $value)."\n";
        }
        // $content = $this->minifyCss($content);

        file_put_contents($path, $content);
        echo $this->_tag_css($combile_name);
    }


    private function _tag_css($src){
        $src = str_replace("/static", CDN_ROOT, $src);
        return '<link rel="stylesheet" type="text/css" href="' . __ROOT__ . $src . '?v='.F('clear_time_css','',RUNTIME_PATH).'" />';
    }
    private function _tag_js($src){
        $src = str_replace("/static", CDN_ROOT, $src);
        return ( '<script type="text/javascript" src="' . __ROOT__ . $src . '?v='.F('clear_time_js','',RUNTIME_PATH).'"></script>');
    }

    private function minifyCss($fc){
        $fc = str_replace("\t", "", $fc); //清除tab
        // $fc = str_replace("\r\n", "", $fc); 
        // $fc = str_replace("\n", "", $fc); 
        $fc = preg_replace("/\/\*[^\/]*\*\//s", "", $fc);  //清除注释
        return $fc;
    }
}