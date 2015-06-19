<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/qingbao.css,
__STATIC__/assets/pc/css/brand.css
"/>
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />

<div style="<notempty name="lists.shop.big_img">background:url({$lists['shop']['big_img']}) no-repeat;<else/>background-color:rgb(240, 240, 240);border:1px solid #CBCBCB;</notempty>" class="brand-banner">
	<div class="center">
		<div class="brand-open">
			<div class="brand-ceng"></div>
			<div class="brand-bg">
				<div class="logo"><img src="{$lists['shop']['logo']}"></div>
				<div class="line"></div>
				<div class="txt">{$lists['shop']['txt']}</div>
			</div>
		</div>
	</div>
</div>

<include file="public:sidenav"/>
<div class="itemlist mt20 container">
	<ul class="group">
		<volist name="lists['items']" id="item" key="i" mod="4">
		<li  class="<eq name="mod" value="3">mr0</eq>">
			<include file="brand-item"/>
		</li>
		</volist>
	</ul>
  <style>
    .itemlist ul li{
      height: 320px;
    }
  </style>
</div>

<include file="brand-list-ui"/>

<include file="public:footer" />
</body>
</html>