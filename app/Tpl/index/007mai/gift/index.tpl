<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/good.css,
__STATIC__/assets/pc/css/gift.css
"/>
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />

<div class="jiu-nav-main">
	<div class="jiu-nav container group">
		<div class="nav-item fl">
			<div class="item-list">
				<ul>
					<!-- <li><a href="{:U('gift/index')}" <if condition="$cid eq ''">class="active"</if>>热门兑换</a></li> -->
					<volist name="cate_list" id="cate">
					<li><a href="{:U('gift/cate',array('cid'=>$cate['id']))}" title="{$cate.name}" <if condition="$cid eq $cate['id']">class="active"</if>>{$cate.name}</a></li>
					</volist>
				</ul>
			</div>
		</div>
	</div>
</div>

<include file="public:sidenav"/>

<div class="main container group">
	
	<div class="huan-list group">
		<ul class="goods-list group">
		<volist name="item_list" id="item" mod="3">
			<li   <eq name="mod" value="2"> class="last"</eq>>
				<div class="list-good buy">
					<div class="good-pic huan">
						<a target="_blank" href="{:U('gift/detail', array('id'=>$item['id']))}"><img src="{:attach(str_replace('_s.'.array_pop(explode('.', $item['img'])), '_b.'.array_pop(explode('.', $item['img'])), $item['img']), 'score_item')}" alt="{$item.title}" class="lazy"   /></a>
					</div>
					<h5 class="good-title"><a target="_blank" href="{:U('gift/detail', array('id'=>$item['id']))}">{$item.title}</a></h5>
					<div class="title-tips">
						<span class="fl">开始时间：<em class="old-price">{$item.start_time|date="Y-m-d",###}</em></span>
						<span class="fr">库存：<em class="org_2">{$item.stock}</em>份</span>
					</div>
						<div class="good-price group">
						<span class="price-current">{$item.score}<em class="unit">情报</em></span>
						<div class="btn-new buy">
							<a target="_blank" href="{:U('gift/detail', array('id'=>$item['id']))}"><span>我要兑换</span></a>
						</div>
					</div>
				</div>
			</li>
		</volist>
		</ul>
	</div>
	<div class="page">
		<div class="pageNav">{$page_bar}</div>
	</div>
</div>


 
 
<include file="public:footer" />
</body>
</html>
