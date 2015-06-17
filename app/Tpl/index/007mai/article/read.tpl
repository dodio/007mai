<!doctype html>
<html>
<head>
<include file="public:head" />
</head>
<body>
<include file="public:topbar" /> 
<include file="public:header" />
	<div class="about container">
		<div class="about_menu fl">
			<ul>
				<li><a href="{:U('article/cate')}">文章首页</a></li>
				<volist name="acats" id="vol">
					<li><a <if condition="$vol.id eq $article['cate_id']"> class="cur" </if>href="{:U('article/cate',array('id'=>$vol['id']))}">{$vol.name}</a></li>
				</volist>
			</ul>
		</div>
		<div class="about_contain">
			<h2>{$article.title}</h2>
			<p class="meta_info mt10">发布时间：{$article.add_time|date="Y-m-d H:i:s",###}&nbsp;&nbsp;&nbsp;&nbsp;来源：{$article.author}&nbsp;&nbsp;&nbsp;&nbsp;点击：{$article.hits}</p>
			<div class="about_content mt30">
			{$article.info}
			</div>
		</div>
	</div>


<include file="public:footer" />
</body>
</html>