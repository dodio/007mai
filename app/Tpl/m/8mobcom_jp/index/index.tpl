<!DOCTYPE html>
<html lang="en">
<head>
	<include file="public:head" />
<style>
.fixtop .logo{color: #fff;font-weight: bold;font-style: initial;font-size: x-large;font-family: initial;}

</style>
</head>
<body>
    <!-- 主体 -->
	<include file="public:not" />
	<div class="main">
		<div class="app">
			<div id="head">
				<div class="fixtop">
				    <span id="find"><a class="btn btn-left btn-search" href="javascript:;"></a></span>
				    <span id="index"><i class="logo">{:C('ftx_site_name')}</i></span>
				</div>
				<ul class="head-nav">
				    <li class="active"><a href="http://m.juanpi.com">首页</a></li>
				    <li><a href="{:U('jiu/index')}">九块九</a></li>
				    <li><a href="{:U('shijiu/index')}">十九块九</a></li>
				</ul>
				<div id="nav" class="view currents out">
				    <div id="search-box">
					<form id="search-form" action="{:U('search/index')}" method="get" >
					    <div class="box-search">
						<span class="icon-search icon"></span>
						<input id="keyword" name="keyword" x-webkit-speech type="text"  placeholder="请输入商品关键字" autocomplete="off" value="" />
						<span id="delete-search" class="delete-button" style="display: none;"><i class="ico20"><img src="/static/8mobcom_jp/images/X.png"/></i></span>
					    </div>
					    <input type="hidden" id="page"  value="" />
					    <button id="search-submit" type="submit">
						<img style="width:38px;" src="/static/8mobcom_jp/images/search-w.png">
					    </button>
					</form>
				    </div>
				    <ul class="nav-list">
					<volist name="cate_list" id="item" mod="3">
					<a href="{:U('index/index',array('cid'=>$item['id']))}"><li>{$item.name}</li></a>
					</volist>
				    </ul>
				</div>
			</div>
<!-- main end-->

			<div id="goods">
				<div id="cover"></div>
				<div id="dwon"></div>
				<ul class="goods-list clear">
					<volist name="items_list" id="item" key="i">
					<li>
						<a class="goods-a" target="_blank" href="{:U('jump/index',array('id'=>$item['num_iid']))}">
							<img class="lazy" _src="{$item.pic_url}_310x310.jpg" src="/static/jky/images/blank.gif" alt="{$item.title}" height="226px;">
							<img class="new-icon" src="/static/8mobcom_jp/images/new_product.png" />
							<h1>{$item.title}</h1>
						</a>
						<a href="{:U('jump/index',array('id'=>$item['num_iid']))}" target="_blank">
							<div class="list-price buy ">
								<span class="price-new"><i>￥</i>{$item.coupon_price}</span><i class="del">￥{$item.price}</i>
								<span class="good-btn">去抢购 </span>
							</div>
						</a>
					</li>
					</volist>
                         
				</ul>
				<div class="paging">
					<div class="paging-nav">
						{$page}
					</div>
				</div>
			</div>
			<div class="alert_fullbg"></div>
			<a class="back-top" href="#"><img style="width:40px;" src="http://s.juancdn.com/jpwebapp/images/back-top.png"></a>
			<include file="public:footer" />
		</div>
	</div>
</div>
<!-- /主体 -->

    <!-- main js -->
    <include file="public:mainjs" />
</body>
</html>