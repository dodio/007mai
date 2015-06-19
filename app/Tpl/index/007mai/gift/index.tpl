<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/qingbao.css,
__STATIC__/assets/pc/css/gift.css
"/>
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />

<include file="jifennav"/>

<include file="public:sidenav"/>

<div class="main container group">
	
		<ul class="itemlist group">
			<volist name="item_list" id="item" mod="4">
				<li <eq name="mod" value="3"> class="mr0"</eq>>
					<include file="score-item"/>
				</li>
			</volist>
		</ul>
	<include file="public:pagenav"/>
</div>
<include file="timerjs"/>
 
<include file="public:footer" />
</body>
</html>
