<?php

/**
 * 合并加载JS和CSS文件
 */
class loadTag {

    private $jm;

    function __construct() {
        $this->jm = new JSMin('');
    }

    public function js($options) {
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
            file_put_contents($path, $this->jm->minify($content));
        }
        echo ( '<script type="text/javascript" src="' . __ROOT__ . $combile_name . '?THIS_IS_IT"></script>');
    }



    public function css($options) {
        $combile_name = '/static/dist_css/' . md5($options['href']) . '.css';
        $path = ROOT_PATH . $combile_name ;
        $statics_url = ROOT_PATH .'/static';
        if (!is_file($path)) {
            //静态资源地址
            $files = explode(',', $options['href']);
            $content = '';
            foreach ($files as $val) {
                $val = trim( str_replace('__STATIC__', $statics_url, $val) );
                $content.=file_get_contents($val);
            }
            file_put_contents($path, $this->jm->minify($content));
        }
        echo ( '<link rel="stylesheet" type="text/css" href="' . __ROOT__ . $combile_name . '?THIS_IS_IT" />');
    }
}