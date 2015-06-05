<!doctype html>
<html>
<head>
<include file="public:head" />
<link rel=stylesheet type=text/css href="__STATIC__/assets/css/good.css" />
</head>
<body>
<include file="public:header" />
<notempty name="cats"> 
<div class="jiu-nav-main jiu-nav-main-2" id="seclevel">
	<div class="jiu-nav page007mai  seclevelinner">
		<div class="nav-item  ">
			<div class="item-list">
				<ul>
				<li><a href="{:U('meili/index', array('cid'=>$cinfo['pid']))}" <empty name="cid"> class="active"</empty>>全部</a></li>
				<volist name="cats" id="bcate">
					<li><a href="{:U('meili/index',array('cid'=>$bcate['id']))}" class=" <if condition="$cid eq $bcate['id']">active</if>" ><span></span>{$bcate.name}</a></li>

				</volist>
				</ul>
			</div>
		</div>
	</div>
</div>
</notempty>

<include file="public:nav-classify" />
<div class="side_nav_fix_pos"></div>
<div class="main page007mai clear">
<ul class="goods-list {:C('ftx_site_wc')}">
		<volist name="items_list" id="item" key="i" mod="4">
		<li  class="<eq name="mod" value="3"> last</eq>">
			<div class="sid_{$item.sellerId}  list-good   {$item.class} " >
				<div class="good-pic">
					<a href="{$item['click_url']}" target="_blank"><img src='__STATIC__/assets/images/blank.gif' data-original='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}" class="lazy"   /></a>
					<div class="yhq"> </div>
				</div>
				<h3 class="good-title">
					<if condition="$item.ems eq 0">[包邮]</if><a target="_blank" href="{$item['click_url']}" class="title">{$item.title}</a>
				</h3>
				<div class="good-price">
					<span class="price-current"><em>￥</em>{$item.coupon_price}</span>
					<span class="des-other">
						<span class="price-old"><if condition="$item.zk lt 10"><em>¥{$item.price}</em><u>({$item.zk}折)</u> </if></span>
						<span class="discount"><if condition="$item.volume gt 0 "><span class="sold">已售<em>{$item.volume}</em>件</span><else/><span class="sold">新品上架<em></em></span></if></span>
					</span>
					<div class="btn-new buy ">
						<em class="icon_m"></em>
						<a href="{$item['click_url']}" target="_blank" rel="nofollow"><span>美丽说</span></a>
					</div>
				</div>
			</div>
		</li>
		</volist>
	</ul>

	<div class="clear"></div> 
	<div class="page">
		<div class="pageNav">{$page}</div>
	</div>
</div>



<include file="public:footer" />
</body>
</html>