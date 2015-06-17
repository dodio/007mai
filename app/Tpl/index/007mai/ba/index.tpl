<!doctype html>
<html>
<head>
<include file="public:head" />
</head>
<body>
<include file="public:topbar" /> 
<include file="public:header" />
 
<notempty name="tag_list"> 
<div class="jiu-nav-main jiu-nav-main-2" id="seclevel">
	<div class="jiu-nav page007mai  seclevelinner">
		<div class="nav-item  ">
			<div class="item-list">
				<ul>
				<li>
					<a href="{:U('ba/index', array('tag'=>$taginfo['pid']))}">全部</a></li>
				<volist name="tag_list" id="bcate">
					<li><a href="{:U('ba/index',array('tag'=>$bcate['id']))}" class=" <if condition="$tag eq $bcate['id']">active</if>" ><span></span>{$bcate.name}</a></li>
				</volist>
				</ul>
			</div>
		</div>
	</div>
</div>
</notempty>


<include file="public:sidenav" />

<div class="side_nav_fix_pos">
  <include file="public:list" />
</div>

<include file="public:footer" />
</body>
</html>