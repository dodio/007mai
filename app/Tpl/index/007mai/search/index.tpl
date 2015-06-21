<!doctype html>
<html>
<head>
<include file="public:head" />

<ftx:load type="css" href="
__STATIC__/assets/pc/css/qingbao.css
"/>
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />

<div class="container group mt20">
	<center>
		<a data-type="6" data-tmpl="573x66" data-tmplid="140" data-style="2" data-border="0" biz-s_logo="1" biz-s_hot="1" href="#">搜索</a>
	</center>
</div>

<notempty name="k">
  <div class="container mt20">
  	<div class="search_word group">
  		<div class="fl">您搜索的内容为：<em>{$k}</em></div>
  		<div class="fr"><a href="/search/index?key={$k}&aitao=1" target="_blank">点击这里看淘宝<em>{$k}</em>搜索结果</a></div>
  	</div>
  </div>
</notempty>

<include file="public:sidenav" />
<!--List Start-->
<div class="container mt20 group">
	<include file="index:item-list"/>
	<script>
	$(function(){
	  $(".item").addClass("show-hover")
	});</script>
	<include file="public:pagenav"/>
</div>
<!--List End-->
<include file="public:footer" />
</body>
</html>