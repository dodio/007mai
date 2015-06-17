<!doctype html>
<html>
<head>
<include file="public:head" />
<style>
.line {
background: url(http://s.juancdn.com/juanpi/images/act/act-tit.png) no-repeat;
_background: url(http://s.juancdn.com/juanpi/images/act/act-tit.gif) no-repeat;
width: 280px;
height: 40px;
margin: 0 auto;
text-align: center;
}
.line em {
font-size: 20px;
font-family: "微软雅黑";
color: #fff;
line-height: 40px;
}

</style>
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />

<notempty name="zc.banner_pic">
	<div style="width:100%; height:300px; background:url('{:attach(get_thumb($zc['banner_pic'], ''),'zc')}') no-repeat top center;"></div>
</notempty>
<div style="width:100%; background:url('{:attach(get_thumb($zc['body_pic'], ''),'zc')}');margin-top: 0px;padding-top: 20px;">
<div class="container mt20">
	<div class="dtit" style="height: 40px;  border-bottom: 1px solid #00ba85;  margin-bottom: 20px;  font-weight: normal;">
		<div class="line"><em>{$zc.name}</em></div>
	</div>
</div>
<include file="public:list" />


<div class="main container group">
	<div class="dtit"><span>更多精彩</span></div>

	<ul class="goods-list group">

	<present name="mzc_cate">
	<volist name="mzc_cate" id="vol" mod="3">
		<li  class="<eq name="mod" value="2"> last </eq>  zc">
			<div class=" list-good">
				<div class="good-pic">
					<a href="/zc/{$vol['ename']}" target="_blank"><img src="{:attach(get_thumb($vol['pic_url'], ''),'zc')}" alt="{$vol.name}"    /></a>
				</div>
				<h5 class="good-title">
					<a target="_blank" href="/zc/{$vol['ename']}" class="title">{$vol.intro}</a>
				</h5>
				<div class="good-price">
					<span class="price-current"><a target="_blank" href="/zc/{$vol['ename']}">{$vol.name}</a></span> 
					<div class="btn-new   buy">
						<a href="/zc/{$vol['ename']}" target="_blank" rel="nofollow"><span>去看看</span></a>
					</div>
				</div>
			</div>
		</li>
	</volist>
	</present>


	</ul>

</div>

</div>

<include file="public:footer" />
</body>
</html>