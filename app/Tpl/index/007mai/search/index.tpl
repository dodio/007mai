<!doctype html>
<html>
<head>
<include file="public:head" />

<ftx:load type="css" href="
__STATIC__/ftxia/new/css/md-pagination.css,
__STATIC__/ftxia/new/css/md-nav-good.css,
__STATIC__/ftxia/new/css/md-public.css,
__STATIC__/ftxia/new/css/pg-index.css,
__STATIC__/ftxia/new/css/nav-channel.css
"/>
<load href="__STATIC__/ftxia/css/list.css" />
</head>
<body>
<include file="public:header" />
<div class="jiu-nav widescreen clear">
	 <div class="main page007mai">
    <notempty name="k">
        <ul class="nav-channel type clear">
          <li><a class="all" style="width:auto; padding:0 12px;">您搜索的内容为：<span class="red">{$k}</span></a></li>
          <span class="clear"></span>
        </ul>
    </notempty>
   </div>
</div>

<include file="public:nav-classify" />

<div class="side_nav_fix_pos"></div>
<!--List Start-->
<div class="main clear page007mai">
	<ul class="goods-list container" id="container">
		<volist name="items_list" id="item" key="i" mod="3">
		<li class="item  <eq name="mod" value="3"> last</eq>">
			<div re="11okav" class="list-good goods_box todayDb">
				<h5 class="good-title">
					<if condition="$item.shop_type eq 'C' "><a  target="_blank" class="icon t tao-n" title="淘宝网" style="display: none; "></a></if><if condition="$item.shop_type eq 'B' "><a  target="_blank" class="icon t tao-t" title="天猫商城" style="display: none; "></a></if>
					<a target="_blank" href="{:U('jump/index',array('id'=>$item['id']))}" data-type="0" biz-itemid="{$item.num_iid}" isconvert=1 class="title">{$item.title}</a>
				</h5>
				<div class="good-pic">
					<div class="pic-img">
						<a href="{:U('jump/index',array('id'=>$item['id']))}" biz-itemid="{$item.num_iid}" isconvert=1 target="_blank">
							<img src="{:attach(get_thumb($item['pic_url'], '_b'),'item')}" width="290px" height="270px">
						</a>
					</div>
				</div>
				<div class="good-price">
					<span class="price-current"><em>¥ </em>{$item.coupon_price}</span>
					<span class="price-discount"><em>¥ </em>{$item.price}</span>
					<a class="btn {$item.class}" target="_blank" href="{:U('jump/index',array('id'=>$item['id']))}" biz-itemid="{$item.num_iid}" isconvert=1   rel="nofollow" ></a>
				</div>
				<div class="good-des">
					<a href="#" class="icon tao-du" title="秒杀网独家" target="_blank"></a>
				<notempty name="visitor">
				<if condition="$visitor['username'] eq C('ftx_index_admin')">
				<div class="show" style="top: 0px;right: 50px;position: absolute;width: 30px;" data-id="{$item.id}"><a title="不显示" href="javascript:void(0);" data-id="{$item.id}">取消</a></div>
				</if>
				</notempty>
					 	
					<div class="like-state">
						<div class="like-num">
							<dl class="J_scrollUp" style="top: 0px;">
								<dd class="cur-num">{$item.likes}</dd>
								<dd class="add-num">+1</dd>
							</dl>
						</div>
						<a title="喜欢" data-pid="{$item.id}" class="like" href="javascript:;"><em></em></a>
					</div>
				</div>
			</div>
		</li>
		</volist>
	</ul>
	<div class="clearfix"></div>

	<div class="page">
		<div class="pageNav">{$page}</div>
	</div>
</div>
<!--List End-->
<include file="public:footer" />
</body>
</html>