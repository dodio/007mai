<?php 
  //3600 //一个小时
  //86400 //一天
  //604800 //一周
  //1209600 //两周
  //2592000 //30天
  return array(
    //登录
    'login' => array(
      "action"=>"login",
      "lang"=>"登录",
      "cycle" => 86400,
      "type" => "reset" //从发生第一次开始统计
    ),
    //注册
    'register' => array(
      "action"=>"register",
      "lang"=>"注册",
      "cycle" => -1, //只有一次
      "type" => "reset"
    ),
    //下载传送门
    'download_shortcut' => array(
      "action"=>"download_shortcut",
      "lang"=>"下载传送门",
      "cycle" => 2592000,
      "type" => "cooldown"
    ),
    //从客户端登陆
    'from_client' => array(
      "action"=>"from_client",
      "lang"=>"用传送门打开网站",
      "cycle" => 86400,
      "type" => "cooldown"
    ),
    //其实sign用不住，有单独action来操作
    'sign' => array(
      "action"=>"sign",
      "lang"=>"签到奖励",
      "cycle" => 86400,
      "type" => "reset"
    ),
    'union_visit' => array(
      "action"=>"union_visit",
      "lang"=>"邀请朋友访问",
      "cycle" => 86400,
      "type" => "cooldown" //连续时间统计
    ),
    'union_reg' => array(
      "action"=>"union_reg",
      "lang"=>"邀请朋友注册",
      "cycle" => 86400,
      "type" => "reset"
    ),
    'read_page10' => array(
      "action"=>"read_page10",
      "lang"=>"日常:浏览10个页面",
      "cycle" => 86400,
      "type" => "reset"
    ),
    'read_page50' => array(
      "action"=>"read_page50",
      "lang"=>"日常:浏览50个页面",
      "cycle" => 86400 ,
      "type" => "reset"
    ),
    'advice_007mai' => array(
      'action' =>"advice_007mai",
      "lang"=>"给007买提建议",
      "cycle" =>  1209600,
      "type" => "reset"
    )
  );

 ?>