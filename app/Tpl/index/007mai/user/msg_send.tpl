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
					<li id="in"><a href="{:U('user/msg',array('do'=>'in'))}">收件箱</a></li>
					<li id="out"><a href="{:U('user/msg',array('do'=>'out'))}">发件箱</a></li>
					<li id="send" class="active"><a href="{:U('user/msg',array('do'=>'send'))}">联系客服</a></li>
				</ul>
			</div>
			<form onsubmit="if($('#content').val()==''){alert('内容不能为空');return false;}else{return true;}" method=post action="{:U('user/msg',array('do'=>'savemsg'))}" class="ml30 mt30">
				<div class="address">
					<ul>
						<li>
							<div class="user">
								<label>收件人：</label>
								<input id="ddusername" class="ddinput" type="text" name="username" value="网站客服" readonly="true" disabled="disabled" style="width:100px;">
							</div>
						</li>
						<li>
							<div class="user">
								<label>内　容：</label>
								<textarea type="text" class="ddinput" style="width:350px;height:100px;" name="content" id="content"></textarea>
							</div>
						</li>
						<li>
							<input type="hidden" name="do" id="do" value="savemsg" />
							<input type="submit" class="smt btn smt1" value="立即发送">
						</li>
					</ul>
				</div>
			</form>

		</div>

	</div>
</div>
<script>
$(function(){
    $('.read').jumpBox({  
	    title: '阅读站内信',
		LightBox:'show',
		height:200,
		width:400
    });
});
</script>
<!--主部结束-->
<include file="public:footer" />
</body>
</html>