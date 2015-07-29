<!DOCTYPE html>
<html lang="en">
<head>
	<include file="public:head" />
</head>
<body>
<!-- 主体 -->
<include file="public:not" />
<div class="main">
<include file="public:left" />
	<div class="app">
		<header id="head" class="head">
		<div class="fixtop">
			<span id="classify" class="classify"><a href="javascript:;" class="btn btn-left btn-type"></a></span>
			<span id="t-index">{:C('ftx_site_name')}</span>
		</div>
		</header>
		{:R('advert/index', array("mobile_banner"), 'Widget')}
		<include file="public:nav_box"/>
		<include file="public:items_list" />
		<include file="public:footer" />
	</div>
</div>
    <!-- main js -->
    <include file="public:mainjs" />
</body>
</html>