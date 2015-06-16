<?php 
return array (
  'URL_MODEL' => 2,
  'URL_HTML_SUFFIX' => '.html',
  'URL_PATHINFO_DEPR' => '/',
  'URL_ROUTER_ON' => true,
  'URL_ROUTE_RULES' => 
  array (
    '/^index$/' => 'index/index',
    '/^index\/index\/status\/(\d+)\/sort\/(\d+)\/p\/(\d+)$/' => 'index/index?status=:1&sort=:2&p=:3',
    '/^index\/index\/sort\/(\d+)\/p\/(\d+)$/' => 'index/index?sort=:1&p=:2',
    '/^index\/index\/sort\/new$/' => 'index/index?sort=new',
    '/^index\/index\/sort\/hot$/' => 'index/index?sort=hot',
    '/^index\/index\/sort\/(\d+)$/' => 'index/index?sort=:1',
    '/^index\/index\/p\/(\d+)$/' => 'index/index?p=:1',
    '/^index\/cate\/cid\/(\d+)\/p\/(\d+)$/' => 'index/cate?cid=:1&p=:2',
    '/^index\/cate\/cid\/(\d+)$/' => 'index/cate?cid=:1',
    '/^index\/cate\/cid\/(\d+)\/sort\/new$/' => 'index/cate?cid=:1&sort=new',
    '/^index\/cate\/cid\/(\d+)\/sort\/new\/p\/(\d+)$/' => 'index/cate?cid=:1&sort=new&p=:2',
    '/^index\/cate\/cid\/(\d+)\/sort\/hot$/' => 'index/cate?cid=:1&sort=hot',
    '/^index\/cate\/cid\/(\d+)\/sort\/hot\/p\/(\d+)$/' => 'index/cate?cid=:1&sort=hot&p=:2',
    '/^index\/cate\/cid\/(\d+)\/sort\/(\d+)$/' => 'index/cate?cid=:1&sort=:2',
    '/^index\/cate\/cid\/(\d+)\/status\/(\d+)\/sort\/(\d+)\/p\/(\d+)$/' => 'index/cate?cid=:1&status=:2&sort=:3&p=:4',
    '/^index\/cate\/cid\/(\d+)\/sort\/(\d+)\/status\/(\d+)\/p\/(\d+)$/' => 'index/cate?cid=:1&sort=:2&status=:3&p=:4',
    '/^shortcut\/$/' => 'index/shortcut',
    '/^score\/$/' => 'score/index',
    '/^comment\/$/' => 'comment/index',
    '/^comment\/p\/(\d+)$/' => 'comment/index?p=:1',
    '/^goods_add$/' => 'goods/goods_add',
    '/^mygoods$/' => 'goods/mygoods',
    '/^mygoods\/p\/(\d+)$/' => 'goods/mygoods?p=:1',
    '/^inval\/(\d+)$/' => 'inval/index?id=:1',
    '/^help\/(\d+)$/' => 'help/read?id=:1',
    '/^user\/register$/' => 'user/register',
    '/^user\/login$/' => 'user/login',
    '/^user\/logout$/' => 'user/logout',
    '/^union$/' => 'union/index',
    '/^gift$/' => 'gift/index',
    '/^gift\/p\/(\d+)$/' => 'gift/index?p=:1',
    '/^gift\/cid\/(\d+)$/' => 'gift/index?cid=:1',
    '/^gift\/item\/(\d+)$/' => 'gift/detail?id=:1',
    '/^space$/' => 'space/index',
    '/^space\/(\d+)$/' => 'space/index?uid=:1',
    '/^article\/view_(\d+)$/' => 'article/read?id=:1',
    '/^article$/' => 'article/index',
    '/^jump\/item\/(\d+)$/' => 'jump/index?iid=:1',
    '/^jump\/(\d+)$/' => 'jump/index?id=:1',
    '/^jump\/$/' => 'jump/index',
    '/^list\/$/' => 'list/index',
    '/^list\/p\/(\d+)$/' => 'list/index?p=:1',
    '/^item\/id\/(\d+)$/' => 'item/index?id=:1',
    '/^item\/iid\/(\d+)$/' => 'item/index?iid=:1',

    "/^help\/qingbao$/" => 'help/read?id=7' //情报规则
    "/^help\/question$/" => 'help/read?id=6'//常见问题
    "/^help\/aboutus$/" => 'help/read?id=1' //关于我们
    "/^help\/disclaimer$/" => 'help/read?id=5' //免责申明
    "/^help\/exchange$/" => 'help/read?id=8' //兑换流程
    "/^help\/seller$/" => 'help/read?id=2' //商家合作


  ),
);