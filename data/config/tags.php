<?php

// 行为插件
return array(
    /**
     +------------------------------------------------------------------------------
     * 系统标签
     +------------------------------------------------------------------------------
     */
    'app_begin' => array(
        'check_ipban', //禁止IP
        'load_lang', //语言
    ),
    'view_template' => array(
        'basic_template','_overlay'=>1, //自动定位模板文件
    ),
    'view_filter' => array(
        'content_replace', //路径替换
    ),
	'action_begin' => array(
		'OnlineCheck', //在线检测
	),

    /**
     +------------------------------------------------------------------------------
     * 用户行为标签
     +------------------------------------------------------------------------------
     */
    //登陆
    'login_begin' => array(
    ),
    //注册
    'register_begin' => array(
    ),

    
    //登录结束
    'login_end' => array(
        'alter_score', // 积分
    ),
    //注册结束
    'register_end' => array(
        'alter_score', // 积分
    ),
    //下载快捷方式
    'download_shortcut' => array(
        'alter_score', // 积分
    ),
    //用传送门打开网站
    'from_client' => array(
        'alter_score', // 积分
    ),
    //邀请朋友访问
    'union_visit' => array(
        'alter_score', // 积分
    ),
    //邀请朋友注册
    'union_reg' => array(
        'alter_score', // 积分
    ),
    //日常:浏览10个页面
    'read_page10' => array(
        'alter_score', // 积分
    ),
    //日常:浏览50个页面
    'read_page50' => array(
        'alter_score', // 积分
    ),

    //积分数量变更
    'score_change' => array(
        'score_change'
    )
);