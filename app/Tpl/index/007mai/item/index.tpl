<!doctype html>
<html>
<head>
<include file="public:head" />
<link rel=stylesheet type=text/css href="__STATIC__/assets/css/view.css" />
<style>

.tb-thumb{margin-left:10px;margin-top:20px;height: 53px;overflow: hidden;}
.tb-thumb li{display:inline;float:left;margin-right:9px;width:50px;height:50px;border:2px solid #fff;-webkit-transition-property:border-color;-moz-transition-property:border-color;-o-transition-property:border-color;transition-property:border-color;-webkit-transition-duration:.2s;-moz-transition-duration:.2s;-o-transition-duration:.2s;transition-duration:.2s;overflow:hidden}
.tb-thumb li img{max-width:50px;max-height:50px}
.tb-thumb .tb-selected{border-color:#f40}
</style>
</head>
<body>
<include file="public:header" />
<!--商品详细-->
<div class="main {:C('ftx_site_width')}">

	<div class="place-explain">
		您的位置：<a target="_blank" href="{:C('ftx_site_url')}">{:C('ftx_site_name')}</a>
		<notempty name="item.cate_id">&nbsp;&gt;&nbsp;
			<if condition="$cate_data[$item['cate_id']]['pid'] gt 0">
				<if condition="$cate_data[$cate_data[$item['cate_id']]['pid']]['pid'] gt 0">
					<a target="_blank" href="{:U('index/cate',array('cid'=>$cate_data[$cate_data[$item['cate_id']]['pid']]['pid']))}">{$cate_data[$cate_data[$cate_data[$item['cate_id']]['pid']]['pid']]['name']}</a>&nbsp;&gt;&nbsp;
				</if>
				<a target="_blank" href="{:U('index/cate',array('cid'=>$cate_data[$item['cate_id']]['pid']))}">{$cate_data[$cate_data[$item['cate_id']]['pid']]['name']}</a>&nbsp;&gt;&nbsp;
			</if>
			<a target="_blank" href="{:U('index/cate',array('cid'=>$item['cate_id']))}">{$cate_data[$item['cate_id']]['name']}</a>
		</notempty>
		
		&nbsp;&gt;&nbsp; 
		<a class="bady-xx-seo" href="{:U('item/'.$item['num_iid'])}">{$item.title}</a>
	</div>
	<div class="container fl">

		<div class="product clear">
			<div class="product-pic fl">
				<a biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}" target="_blank" rel="nofollow" style="width:310px;height:310px;display:table-cell;"><img id="J_ImgBooth"  src='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}"  height="310px"   /></a>
				<ul id="J_UlThumb" class="tb-thumb tb-clearfix">
					<notempty name="item.thumb">
						<volist name="item.thumb" id="tval" k="i">
						<li <eq name="i" value="1">class="tb-selected"</eq>>
							<div class="tb-pic tb-s50">
								<a href="#"><img data-src="{:attach(get_thumb($tval, '_b'),'item')}" src="{:attach(get_thumb($tval, '_s'),'item')}"></a>
							</div>
						</li>
						</volist>
					<else/>
					<li class="tb-selected">
						<div class="tb-pic tb-s50">
							<a href="#"><img data-src="{:attach(get_thumb($item['pic_url'], '_b'),'item')}" src="{:attach(get_thumb($item['pic_url'], '_s'),'item')}"></a>
						</div>
					</li>
					</notempty>
				</ul>
				<span></span>
			</div>
			<div class="product-info fl">
				<h3><a biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}" target="_blank" rel="nofollow">{$item.title}</a></h3>
				<div class="share"><a class="report" znid="{$item.num_iid}" title="{$item.title}" href="javascript:;"><i class="report-icon"></i>举报</a></div>
				<dl class="jp-size">
					<dt>宝贝属性：</dt>
					<dd>
						<ul>
						<volist name="tags" id="tag">
							<li><a class="active" href="{:U('tag/'.$tag)}" target="_blank"><span>{$tag}</span></a></li>  
						</volist>
						</ul>
					</dd>
					<dd class="size-tips" style="display:none;"><i></i>请选择宝贝属性</dd>
				</dl>
				<p class="tips clear">
					<span class="item-pr fl">原价：<em class="old-price ffv">{$item.price}元</em></span>
					<span class="fl">折扣：<em class="org_2 ffv">{$item.zk}折</em></span>
				</p>
				<p class="price">
					<span class="title-tips01">折扣价格</span>
					<em class="org">￥</em>
					<span class="jd-current">{$item.coupon_price}</span> 
					<if condition="$item.ems eq 1">/包邮</if></span>
				</p>
				<notempty name="item.pxhtml">
				<div class="pg">{$item.pxhtml}</div>
				</notempty>
				<div class="item-btn clear">
					<span class="btn-tip fl">
						<if condition="$item.class eq 'wait'">
							<a class="btn fl {$item.class}" href="{:U('jump/'.$item['num_iid'])}" target="_blank" rel="nofollow">
							<span>即将开始</span></a>
						<elseif condition="$item.class eq 'sellout'"/>
							<a class="btn fl {$item.class}" href="{:U('jump/'.$item['num_iid'])}" target="_blank" rel="nofollow">
							<span>已卖光</span></a>
						<elseif condition="$item.class eq 'end'"/>
							<a class="btn fl {$item.class}" href="{:U('jump/'.$item['num_iid'])}" target="_blank" rel="nofollow">
							<span>已结束</span></a>
						<elseif condition="$item.class eq 'buy'"/>
							<if condition="$item.shop_type eq 'C' ">
							<a class="btn fl {$item.class}" biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}" target="_blank" rel="nofollow">
								<span>去淘宝抢购</span>
							</a>
							<elseif condition="$item.shop_type eq 'B' " />
							<a class="btn fl {$item.class}" biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}" target="_blank" rel="nofollow">
								<span>去天猫抢购</span>
							</a><elseif condition="$item.shop_type eq 'D' " />
							<a class="btn fl {$item.class}" href="{$item['click_url']}" target="_blank" rel="nofollow">
								<span>去京东抢购</span>
							</a></if>
						</if> 
					</span>
					<div id="tq_html" class="tq_html"></div>
				</div>
				<p class="price bady-time">
					<span class="fl">开抢时间：</span>
					<span class="time fl">{$item.coupon_start_time|date="m月d日 H时i分",###}</span>
					<span class="common nomind shoot_time">
						<script type="text/javascript">
							var __qqClockShare = {
							   content: "{$item.title}",
							   time: "{$item.coupon_start_time|date="Y-m-d H:i",###}",
							   advance: 5,
							   url: "{:C('ftx_site_url')}{:U('item/'.$item['num_iid'])}",
							   icon: "2_1"
							};
							document.write('<a href="http://qzs.qq.com/snsapp/app/bee/widget/open.htm#content=' + encodeURIComponent(__qqClockShare.content) +'&time=' + encodeURIComponent(__qqClockShare.time) +'&advance=' + __qqClockShare.advance +'&url=' + encodeURIComponent(__qqClockShare.url) + '" target="_blank"><img src="http://i.gtimg.cn/snsapp/app/bee/widget/img/' + __qqClockShare.icon + '.png" style="border:0px;"/></a>');
						</script>
					</span>
				</p>
				<p class="fenxiang">
					<span class="fl">分享商品：</span>
					<div id="bdshare" class="fl bdshare_t bds_tools get-codes-bdshare fl">
						<a class="bds_sqq" rel="nofollow"></a>
						<a class="bds_qzone" rel="nofollow"></a>
						<a class="bds_tsina" rel="nofollow"></a>
						<a class="bds_tqq" rel="nofollow"></a>
						<a class="bds_renren" rel="nofollow"></a>
						<a class="bds_taobao tjh" rel="nofollow"></a>
						<span class="bds_more"></span>
						<script type="text/javascript" id="bdshare_js" data="type=button" ></script>
						<script type="text/javascript" id="bdshell_js"></script>
						<script type="text/javascript">
							var bds_config = {
								'bdDesc' : '发现个灰常给力的商品！{$item.title}，赶紧来抢吧！',
								'bdText' : '发现个灰常给力的商品！{$item.title}，赶紧来抢吧！' ,
								'bdPic' : '{:attach(get_thumb($item['pic_url'], '_b'),'item')}',
								'review' : 'off'
							};
							document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
						</script>
					</div>
				</p>
			</div>
		</div>

		<div class="product-comment">
			<div class="bady-tab" id="bady-tab">
				<ul>
					<notempty name="desc">
					<li class="tab1">
						<a class="badyactive" href="#desc">宝贝详情</a>
						<div class="bady-line-top"></div>
					</li>
					<li class="tab2">
						<a class="" href="#comm"></a>
						<div class=""></div>
					</li>
					<li class="tab3"></li>
					</notempty>
					<li class="tab4">
						<a href="#xihuan" class="">消费保障<em></em></a>
						<div class=""></div>
					</li>
				</ul>
				<div class="gobuy fr" style="display: none; ">
					<span class="title-tips01">折扣价格<em class="tip-b"></em></span>
					<p class="price fl">
						<em class="org">￥</em> 
						<span class="jd-current">{$item.coupon_price}</span> <if condition="$item.ems eq 1">/包邮</if>
					</p>
					<a target="_blank" id="dealGone" class="btn fl {$item.class}" href="{:U('jump/'.$item['num_iid'])}" rel="nofollow"><span>
						<if condition="$item.shop_type eq 'C' ">去淘宝抢购</if>
						<if condition="$item.shop_type eq 'B' ">去天猫抢购</if>
						<if condition="$item.shop_type eq 'D' ">去抢购</if>
					</span></a>
				</div>
			</div>

			 
			<notempty name="attributes">
			<div class="information info_s2" style="display: block;" >
				<h3><a name="desc" >商品属性</h3>
				<p><p>{$attributes}</p></p>
			</div>
			</notempty>
			<notempty name="desc">
			<div class="information" style="display: block;" >
				<p><p>{$desc}</p></p>
			</div>

	 
		</notempty>
		 
 
		<a name="xihuan" ></a>
		<div class="information" style="padding-top: 50px;">
  <div class="xiaobao">
    <div class="xb_icon">
      <a class="xb_s xb_s1" href="javascript:;">商家审核</a>
      <a class="xb_s xb_s2" href="javascript:;">买手砍价</a>
      <a class="xb_s xb_s3" href="javascript:;">验货质检</a>
      <a class="xb_s xb_s4" href="javascript:;">价格监控</a>
      <a class="xb_s xb_s5" href="javascript:;">全国包邮 </a>
      <a class="xb_s xb_s6" href="javascript:;">七天退换</a>
      <a class="xb_s xb_s7" href="javascript:;">闪电发货</a>
    </div>
  </div>
    <div class="xb_js">
      <div class="steup steup_01" style="display: block;"></div>
      <div class="steup steup_02" style="display: none;"></div>
      <div class="steup steup_03" style="display: none;"></div>
      <div class="steup steup_04" style="display: none;"></div>
      <div class="steup steup_05" style="display: none;"></div>
      <div class="steup steup_06" style="display: none;"></div>
      <div class="steup steup_07" style="display: none;"></div>
      <em class="jiao"></em>
    </div>
 </div>
	</div>
 
	</div> 
	<div class="clear"></div>
</div>
		
 
<include file="public:list" />
<script type="text/javascript" src="__STATIC__/assets/js/deal.js"></script>
<script type="text/javascript">
    $(".bady-tab:eq(0) li:eq(0)").find("a").addClass("badyactive");
    $(".bady-tab:eq(0) li:eq(0)").find("div").addClass("bady-line-top");
    //评论处js切换效果
    $(".bady-tab:eq(0) li").click(function(){
        $(document).scrollTop($('.bady-part').offset().top-50);
        $(".bady-tab").not( $(".bady-tab:eq(0)")).hide();
        $(this).parents("ul").find("a").removeClass("badyactive");
        $(this).parents("ul").find("div").removeClass("bady-line-top");
        $(this).find("a").addClass("badyactive");
        $(this).find("div").addClass("bady-line-top");
        if($(this).index() == 0){
            $(".bady-tab,.information").show();
            if($(".bady-tab").size() - $(".information").size() == 1){
                $(".bady-tab01").hide();
            }else if($(".bady-tab").size() - $(".information").size() == 2){
                $(".bady-tab01").hide();
            }
        }else{
            $(".information").hide();
            $(".information:eq("+$(this).index()+")").show();
        }
    });

    $(".bady-tab:eq(0) li").each(function(index){
        if(typeof($(this).attr("name"))!="undefined"){
            $("#"+$(this).attr("name")).click();
            $("#"+$(this).attr("name")).parents("ul").find("a").removeClass("badyactive");
            $("#"+$(this).attr("name")).parents("ul").find("div").removeClass("bady-line-top");
            $("#"+$(this).attr("name")).find("a").addClass("badyactive");
            $("#"+$(this).attr("name")).find("div").addClass("bady-line-top");
        }
    });

    var F_jkyCeleMenuAni = function(){
        var jiuMenuObj = $('#bady-tab');
        var Tab01Obj= $('.tab1').find("a");
        var Tab02Obj= $('.tab1').find("div");
        var Tab03Obj= $('.tab2').find("a");
        var Tab04Obj= $('.tab2').find("div");
	var Tab07Obj= $('.tab4').find("a");
        var Tab08Obj= $('.tab4').find("div");
        var menuScrolFunc = function(){
            scrolY = $(window).scrollTop();
            if(scrolY < 580){
                jiuMenuObj.removeClass('fixed');
                $('div.gobuy').hide();
            }else{
                jiuMenuObj.addClass('fixed');
                $('div.gobuy').show();
            }
            if(scrolY >=$('.goods-list').offset().top && !($(".information:eq(0)").is(":hidden"))){
		
                Tab03Obj.removeClass("badyactive");
                Tab04Obj.removeClass("bady-line-top");
                Tab01Obj.removeClass("badyactive");
                Tab02Obj.removeClass("bady-line-top");
                Tab07Obj.addClass("badyactive");
                Tab08Obj.addClass("bady-line-top")
            }else if(scrolY >=$('.bady-tab02').offset().top && !($(".information:eq(0)").is(":hidden"))){
	        Tab07Obj.removeClass("badyactive");
                Tab08Obj.removeClass("bady-line-top");
                Tab03Obj.removeClass("badyactive");
                Tab04Obj.removeClass("bady-line-top");
                Tab01Obj.removeClass("badyactive");
                Tab02Obj.removeClass("bady-line-top");
            }else if(scrolY >= $('.bady-tab01').offset().top && !($(".information:eq(0)").is(":hidden"))){
	        Tab07Obj.removeClass("badyactive");
                Tab08Obj.removeClass("bady-line-top");
                Tab01Obj.removeClass("badyactive");
                Tab02Obj.removeClass("bady-line-top");
                Tab03Obj.addClass("badyactive");
                Tab04Obj.addClass("bady-line-top")
            }else if(!($(".information:eq(0)").is(":hidden"))){
	        Tab07Obj.removeClass("badyactive");
                Tab08Obj.removeClass("bady-line-top");
                Tab03Obj.removeClass("badyactive");
                Tab04Obj.removeClass("bady-line-top");
                Tab01Obj.addClass("badyactive");
                Tab02Obj.addClass("bady-line-top")
            }

        }
        var F_nmenu_scroll = function () {
            if (!window.XMLHttpRequest) {
                return;
            }else{
                //默认执行一次
                menuScrolFunc();
                $(window).bind("scroll", menuScrolFunc);
            }
        }
        F_nmenu_scroll();
    }
    F_jkyCeleMenuAni();
</script>
<load href="__STATIC__/ftxia/js/report.js" />
<include file="public:footer" />
</body>
</html>
