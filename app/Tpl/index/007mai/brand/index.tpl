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

<include file="public:sidenav" />


<include file="brand-list-ui"/>


<div class="bmain container group">

<div class="brand-box">
<volist name="lists" id="val">
<div class="normal-title group">
    <a href="{:U('brand/dlist',array('uid'=>$val['shop']['uid']))}" target="_blank" se_prerender_url="complete">
        <div class="title"><h3>{$val['shop']['txt']}</h3></div><span class="txt fr">{$val['shop']['discount']}</span>
    </a>
</div>

<div class="itemlist mt20 container">
	<ul class="group">
		<volist name="val['items']" offset="0" length="8" id="item" key="i" mod="4">
		<li  class="<eq name="mod" value="3">mr0</eq>">
			<include file="brand-item"/>
			<eq name="i" value="8">
				<div class="brand-more">
					<div class="brand-bd"></div>
					<a href="{:U('brand/dlist',array('uid'=>$val['shop']['uid']))}" target="_blank"><span class="txt">共<b>{$val['shop']['items_total']}</b>款</span></a>
				</div>
			</eq>
		</li>
		</volist>
	</ul>
  <style>
    .itemlist ul li{
      height: 320px;
      position: relative;
    }
  </style>
</div>

</volist>
</div>

</div>

<div class="container group">
	<include file="public:pagenav"/>
</div>

<include file="public:footer" />
</body>
</html>