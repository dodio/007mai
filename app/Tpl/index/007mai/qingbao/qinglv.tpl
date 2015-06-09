<!doctype html>
<html>
<head>
<include file="public:head" />
</head>
<body>
<include file="public:header" />


<div class="cate-nav-wrap">
  <div class="jiu-nav-main jiu-nav-main-2">
      <div class="jiu-nav page007mai  seclevelinner">
        <div class="nav-item  ">
          <div class="item-list">
            <ul>
              <li><a href="/index/cate/cid/287" target="_blank">外套</a></li>
              <li><a href="/index/cate/cid/288" target="_blank">T恤</a></li>
              <li><a href="/index/cate/cid/289" target="_blank">套装</a></li>
              <li><a href="/index/cate/cid/290" target="_blank">卫衣</a></li>
              <li><a href="/index/cate/cid/291" target="_blank">鞋子</a></li>
              <li><a href="/index/cate/cid/352" target="_blank">睡衣</a></li>
              <li><a href="/index/cate/cid/353" target="_blank">内裤</a></li>
              <li><a href="/index/cate/cid/359" target="_blank">泳衣</a></li>
              <li><a href="/index/cate/cid/418" target="_blank">配饰</a></li>
            </ul>
          </div>
          <div class="n_h">
              <a href="{:U('qingbao/qinglv',array('sort'=>'default'))}"  class=" <if condition="$index_info['sort'] eq 'default'"> active </if> ">默认</a>
              <a href="{:U('qingbao/qinglv',array('sort'=>'new'))}" class=" <if condition="$index_info['sort'] eq 'new'"> active </if> ">最新</a>
              <a href="{:U('qingbao/qinglv',array('sort'=>'hot'))}" class=" <if condition="$index_info['sort'] eq 'hot'"> active </if> ">最热</a>
            </div>
        </div>
      </div>
    </div>
</div>


<include file="public:nav-classify" />
<div class="side_nav_fix_pos">
  <div class="qinglv_pic" style="width: 100%;height: 200px;background-color: #fafafa;"></div>
  <include file="public:list" />
</div>
 
<include file="public:footer" />
</body>
</html>