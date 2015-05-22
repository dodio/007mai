<notempty name="visitor">
<if condition="$visitor['username'] eq C('ftx_index_admin')">
<script type="text/javascript">
	function noshow(id){
		if(!$.ftxia.dialog.islogin()) return ;
		$(this).html('<img src="/static/ftxia/images/loading.gif" />');
		$.ajax({
			url: FTXIAER.root + '/?m=item&a=noshow',
				type: 'POST',
				data: {
					id: id
				},
			dataType: 'json',
			success: function(result){
				if(result.status == 1){
					$.ftxia.tip({content:result.msg, icon:'success'});
				}else{
					$.ftxia.tip({content:result.msg, icon:'error'});
				}
			}
		});
	}

	$(".show a").click(function() {
		id = $(this).attr("data-id");
		if(!$.ftxia.dialog.islogin()) return ;
		$(this).html('<img src="/static/ftxia/images/loading.gif" />');
		$.ajax({
			url: FTXIAER.root + '/?m=item&a=noshow',
				type: 'POST',
				data: {
					id: id
				},
			dataType: 'json',
			success: function(result){
				if(result.status == 1){
					$(this).html('成功');
					$.ftxia.tip({content:result.msg, icon:'success'});
				}else{
					$(this).html('已取消');
					$.ftxia.tip({content:result.msg, icon:'error'});
				}
			}
		});
	});  
</script>
</if>
</notempty>
<!-- 页脚 -->
<div class="foot">
	<div class="white_bg {:C('ftx_site_width')}">
		<div class="xd_info {:C('ftx_site_width')}">
			<div class="jky-info fl">
				<if condition="C('ftx_site_flogo') neq ''">
					<h2><img src="{:C('ftx_site_flogo')}" height="38" /></h2>
				<else />
					<h2><img src="/static/8mobcom/images/logo.jpg" height="38" /></h2>
				</if>
				<div class="attentionlist">
					<a class="sina" href="{:C('ftx_sina_url')}" target="_blank" rel="nofollow">新浪微博</a>
					<a class="zone" href="{:C('ftx_qzone_url')}" target="_blank" rel="nofollow">QQ空间</a>
					<a class="tt" href="{:C('ftx_tenxun_url')}" target="_blank" rel="nofollow">腾讯微博</a>
				</div>
			</div>
			<div class="fl">
				<div class="abouts">
					<ul>
				<li class="tit">关于我们</li>
				<li><a href="{:U('help/read',array('id'=>1))}" target="_blank">关于我们</a></li>
				<li><a href="{:U('help/read',array('id'=>3))}" target="_blank">联系我们</a></li>
				<li><a href="{:U('help/read',array('id'=>2))}" target="_blank">广告合作</a></li>
				<li><a href="{:U('/baoming')}" target="_blank">商家报名</a></li>
					</ul>
				</div>
					<div class="help">
					<ul>
						<li class="tit">用户帮助</li>
						<li><a href="{:U('help/read',array('id'=>6))}" target="_blank">常见问题</a></li>
						<li><a href="{:U('help/qianggou')}" target="_blank">抢购小技巧</a></li>
						<li><a href="{:U('article/index')}" target="_blank">文章中心</a></li>
					</ul>
				</div>
				<div class="user">
					<ul>
						<li class="tit">会员服务</li>
						<li><a href="{:U('user/register')}" target="_blank">免费注册</a></li>
						<li><a href="{:U('user/login')}" target="_blank">登录本站</a></li>
						<li><a href="{:U('forget/index')}" target="_blank">找回密码</a></li>
					</ul>
				</div>
			</div>
			<if condition="C('ftx_site_weixin') neq ''">
				<div class="fl">
					<span class="tit">微信服务号</span>
					<br />
					<img src="{:C('ftx_site_weixin')}" width="100" height="100" />
				</div>
			</if>
			<if condition="C('ftx_site_browser') neq ''">
				<div style="float:left;margin: 0px 0 0 44px;">
					<span class="tit">手机版</span>
					<br />
					<img src="{:C('ftx_site_browser')}" width="100" height="100" />
				</div>
			</if>
			  
			<div class="links {:C('ftx_site_width')} group">
				<span>友情链接：</span>
				<div class="links_list_box">
					<ul class="links_list">
					<ftx:link type="lists" >
						<li>
			    			<volist name="data" id="val" mod="10">	
			    				<a href="{$val.url}" target="_blank">{$val.name}</a>
							<eq name="mod" value="9"></li><li></eq>
						</volist>
						</li>
					</ftx:link>
					</ul>
				</div>
			</div>
		</div>
		<p class="f_miibeian {:C('ftx_site_width')}"><a href="http://www.miibeian.gov.cn/" rel="nofollow" target="_blank">{:C('ftx_site_icp')}</a> © 2010-2015 007mai.com all Rights Reserved
		{:C('ftx_statistics_code')}
		</p>
	</div>
</div>

<!-- /页脚 -->
<include file="public:fix-right-layer" />
<!--淘点金开始-->
{:C('ftx_taojindian_html')}
<!--淘点金结束-->
<script type="text/javascript">
var FTXIAER = {
    root: "__ROOT__",
	site: "{:C('ftx_site_url')}",
    uid: "<?php echo $visitor['id'];?>", 
    url: {}
};
var lang = {};
<volist name=":L('js_lang')" id="val">lang.{$key} = "{$val}";</volist>
</script>
<ftx:load type="js" href="
__STATIC__/js/jquery/plugins/jquery.tools.min.js,
__STATIC__/js/jquery/plugins/jquery.masonry.js,
__STATIC__/js/jquery/plugins/formvalidator.js,
__STATIC__/js/fileuploader.js,
__STATIC__/js/ftxia.js,
__STATIC__/js/front.js,
__STATIC__/js/dialog.js,
__STATIC__/js/item.js,
__STATIC__/js/user.js,
__STATIC__/js/comment.js,
__STATIC__/8mobcom/js/comm.js" />