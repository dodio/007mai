<!doctype html>
<html>
<head>
<include file="public:head" />
<link rel=stylesheet type=text/css href="__STATIC__/assets/pc/css/user.css" />
</head>
<body>

<include file="public:header" />
<div class="main mb20 container group">
	<div class="user_main">
		<include file="user/left" />


		<div class="right">
			<div class="menu-tag">
				<ul>
					<li class="active"><a href="{:U('user/mingxi')}">收入明细
					<li><a href="{:U('user/gift')}">兑换明细</a></li>
				</ul>
			</div>
			<div class="u-tip">
				<p>当前：<em>{$score_total}</em> </p>
			</div>

			 
			<div class="log-table">
				<table border="0" cellspacing="0">
					<tr class="thead">
						<th>收入事件</th>
						<th>情报</th>
						<th class="last">发生时间</th>
					</tr>
					<notempty name="logs_list">
           <?php $actions = C("score_action"); ?>
					<volist name="logs_list" id="val" mod="2">
					<tr <eq name="mod" value="0">class="tr"</eq> <eq name="mod" value="1">class="tr-one"</eq>>
						<td><?php echo $actions[$val['action']]['lang']; ?></td>
						<td><if condition="$val['score'] gt 0">{$val.score}<else/>{$val.score}</if></td>
						<td>{$val.add_time|frienddate}</td>
					</tr>
					</volist>
					<else/>
					<tr>
						<td colspan="3">
						<div class="find_gift">
							<p>您还没有<a href="{:U('gift/index')}" target="_blank">兑换礼品</a>哦，赶快兑取你喜欢的礼品吧~</p>
						</div>
						</td>
					</tr>
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