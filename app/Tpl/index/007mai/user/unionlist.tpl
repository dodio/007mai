<!doctype html>
<html>
<head>
<include file="public:head" />
<link rel=stylesheet type=text/css href="__STATIC__/assets/pc/css/user.css" />
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />
<div class="main mb20 container group">
	<div class="user_main">
		<include file="user/left" />


		<div class="right">
			<div class="menu-tag">
				<ul>
					<li id="url"><a href="{:U('user/union')}">我要邀请</a></li>
					<li class="active"><a href="{:U('user/unionlist')}">我的邀请</a></li>			   
				</ul>
			</div>
			<div class="u-tip">
				<p>通过您的专属邀请链接邀请好友访问{:C('ftx_site_name')}，您将获得{$union.per_visit}{:L('exchange')}，每天最多可以获得{$union.count_visit}{:L('exchange')}！</p>
				<p>如果邀请的好友成功注册{:C('ftx_site_name')}账号，您将获得{$union.per_reg}{:L('exchange')}，您每个月最多可以获得{$union.count_reg}个{:L('exchange')}！</p>
			</div>

			 
			<div class="log-table">
				<table border="0" cellspacing="0">
					<tr class="thead">
						<th>类别</th>
						<th>用户</th>
						<th>奖励</th>
						<th class="last">邀请时间</th>
					</tr>
					<notempty name="union_list">
					<volist name="union_list" id="val" mod="2">
					<tr   <eq name="mod" value="0">class="tr"</eq> <eq name="mod" value="1">class="tr-one"</eq>>
						<td><if condition="$val['ousername']">邀请注册<else/>邀请访问</if></td>
						<td><if condition="$val['ousername']">{$val.ousername}<else/>{$val.ip}</if></td>
						<td>{$val.score}</td>
						<td>{$val.add_time|frienddate}</td>
					</tr>
					</volist>
					<else />
					<tr><td colspan="4">
						<div class="find_gift">
						<p>还没有好友通过您的邀请注册哦！</p>
						<p>邀请好友，得情报！<a target="_blank" href="{:U('user/union')}">赶快行动吧！</a></p>
						</div>
						</td></tr>
					</notempty>
				</table>
				
				<include file="public:pagenav"/>
			</div>

		</div>

	</div>
</div>
<!--主部结束-->
<include file="public:footer" />
</body>
</html>