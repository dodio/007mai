<!doctype html>
<html>
<head>
<include file="public:head" />
<load href="__STATIC__/assets/pc/css/help.css" />
</head>
<body>
<include file="topbar"/>
<include file="public:header" />

	
	<div class="container mb20 group">
	<div class="jiu_help group">
		<div id="lr_float fl">
			<div class="left_bg"></div>
			<div class="help_title fl">
				<dl>
					<dt>帮助中心</dt>
					<volist name="helps" id="vol">
						<dd <if condition="$vol.id eq $id"> class="cur" </if>><a href="{:U('help/read',array('id'=>$vol['id']))}">{$vol.title}</a></dd>
					</volist>
				</dl>
			</div>
		</div>
		<div class="help_content fr">
						<div class="help_txt">
				<div class="help_list">
					<h3 class="mb10">{$help.title}</h3>
					 {$help.info}
				</div>
			</div>
					</div>
	</div>

	<script>
		function getRecommendCode(){
    var recommend = '';
		var href = window.location.href.split("#");
		if (href.length==2) {
			if (href[1].substring(0,1)!='_'){
			   recommend = decodeURI(href[1]);
			}
		}
		return recommend;	
	}
	$(function(){
		$(".help_list .title").each( function(){
			$(this).bind('click' , function(){
				if( $(this).parent().attr('class') == 'on' ){
					$(this).parent().attr('class' , '');
				}else{
					$(this).parent().attr('class' , 'on');
				}
				var now = $(this).html();
				$(".help_list .title").each( function(){
					if( now != $(this).html() ){
						$(this).parent().attr('class' , '');
					}
				});
			});
		});
		var code = getRecommendCode();
		if( code  != '' ){
			$('#'+code).attr('class' , 'on') ;
		}
	});

	</script>
</div>
	
<include file="public:footer" />
</body>
</html>