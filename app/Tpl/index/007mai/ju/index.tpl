<!doctype html>
<html>
<head>
<include file="public:head" />
<link rel="stylesheet" href="http://g.tbcdn.cn/ju/common/1.3.6/global-min.css"/>
<script src="http://g.tbcdn.cn/??kissy/k/1.4.2/seed-min.js,ju/common/1.3.6/global-min.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://g.tbcdn.cn/ju/home/1.2.3/pages/2014/index.less.css" />
<link rel=stylesheet type=text/css href="/static/assets/css/good.css" />
<style>
.w980 .ju-itemlist {width: 980px;}
.w980 li.item-small-v3 {width: 320px!important;height: 320px!important;}
.w980 li.item-small-v3 .link-box {height: 320px;}
.w980 li.item-small-v3 .item-pic {width: 320px;height: 220px;}
.w980 li.item-small-v3 .multi, .w980 li.item-small-v3 .timetogo{top:180px;}
.page007mai .ju-itemlist {width: 1100px;}
.page007mai li.item-small-v3 {width: 360px!important;height: 330px!important;}
.page007mai li.item-small-v3 .link-box {height: 340px;}
.page007mai li.item-small-v3 .item-pic {width: 360px;height: 240px;}
.page007mai li.item-small-v3 .multi, .page007mai li.item-small-v3 .timetogo{top:200px;}
.page div {position: relative;margin-right: auto;padding-top: 10px;display: inline;}
</style>
</head>
<body>
<script>
with(document)with(body)with(insertBefore(createElement("script"),firstChild))setAttribute("exparams","category=&userid=133419958&at_bucketid=jhs%5fju%5f4&aplus&yunid=&Nm27vw9Ipn&asid=AAEMX1pUnegrxtZyYow=",id="tb-beacon-aplus",src=(location>"https"?"//s":"//a")+".tbcdn.cn/s/aplus_v2.js")
</script>
<script>document.documentElement.className += (window.innerWidth || document.body.clientWidth) > 1240 ? " w1190 " : "";</script>
<include file="public:header" />
<div class="jiu-nav-main">
	<div class="jiu-nav page007mai">
		<div class="nav-item ">
			<div class="item-list">
				<ul>
				<li ><a href="/ju" <if condition="$cid eq 0"> class="active"</if> >全部</a></li>
				<volist name="cats" id="vol"> 
				<li><a href="{:U('ju/index',array('cid'=>$vol['cid']))}"  <if condition="$cid eq $vol['cid']"> class="active"</if> >{$vol.name}</a></li>
				</volist>
				</ul>
			</div>
		</div>
	</div>
</div>

	<div  class="container ju-wrapper w1190  page007mai ju-container ju-home">
		<div class="ju-itemlist">
		{$html}
		</div>
	</div>

	<div class="page page007mai "><em></em><div>{$page}</div></div>
	 
<include file="public:footer" />
</body>
</html>