<!doctype html>
<html>
<head>
<include file="public:head" />
</head>
<body>
<include file="public:topbar" /> 
<include file="public:header" /> 



<div class="main">
	<div class="about container">
		<div class="about_menu fl">
			<ul>
				<li><a <empty name="cid">class="cur"</empty> href="{:U('article/cate')}">文章首页</a></li>
				<volist name="acats" id="vol">
					<li><a <if condition="$vol.id eq $cid"> class="cur" </if>href="{:U('article/cate',array('id'=>$vol['id']))}">{$vol.name}</a></li>
				</volist>
			</ul>
		</div>
		<div class="about_contain">
			<div class="about_tit"><empty name="cid">文章首页<else />{$acats[$cid]['name']}</empty></div>
			<div class="about_content">
				<ul class="about_notes">
					<volist name="article_list" id="val">
					<li>
						<em>· </em>
						<span class="title">
							<a href="{:U('article/cate',array('id'=>$val['cate_id']))}">[ {$acats[$val['cate_id']]['name']}] </a>
							<a target="_blank" href="{:U('article/read',array('id'=>$val['id']))}">{$val.title}</a>
						</span>
						<span class="gary">{$val.add_time|date="Y-m-d",###}</span>
					</li>
					</volist>
				</ul>
			</div>
			<include file="public:pagenav"/>
		</div>
	</div>
</div>




<include file="public:footer" />
</body>
</html>
