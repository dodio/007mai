<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/qingbao.css,
__STATIC__/assets/pc/css/gift.css
"/>
<ftx:load type="css" href="
__STATIC__/ftxia/new/css/md-goodslist.css,
__STATIC__/ftxia/new/css/md-public.css,
__STATIC__/ftxia/new/css/pg-item.css,
__STATIC__/ftxia/new/css/pg-try.css
"/>

<style>
.main .item_containt {min-height: 800px;}
</style>
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />

<include file="jifennav"/>
<include file="public:sidenav"/>


<div class="main container group">
	<div class="huan-left">
		<div class="goods-inside group">
			<div class="img_show fl"><img src="{:attach(str_replace('_s.'.array_pop(explode('.', $item['img'])), '_b.'.array_pop(explode('.', $item['img'])), $item['img']), 'score_item')}" alt="{$item.title}" /></div>
			<div class="price-info fl">
				<h3>{$item.title}</h3>
				<p class="price">所需情报：<span class="jd-current">{$item.score}</span> <em class="unit">个</em></p>
				<p>库存：<em class="org_2">{$item.stock}</em> 份</p>
				<p>兑换时间：{$item.start_time|date="y年m月d日 H时s分",###} - {$item.end_time|date="y年m月d日 H时s分",###}</p>
				<p>每名会员限兑换<em class="org_2">{$item.user_num}</em></span>次</p>
				<p class="bady-btn"><a href="javascript:;"   class="btn fl mr15 J_gift_btn" data-id="{$item.id}" data-num="#J_num_{$item.id}">兑换</a></p>
			</div>
		</div>
		<div class="bady-part group">
			<div class="bady-tab">
				<ul>
					<li>
						<a class="badyactive" href="javascript:;">宝贝详情</a>
						<div class="bady-line-top"></div>
					</li>
					<li>
						<a class="" href="javascript:;">兑换规则</a>
						<div class=""></div>
					</li>
				</ul>
			</div>
			<div class="information" style="display:block;">
			{$item.info}
			</div>
			<div class="bady-tab">
				<ul>
					<li style="border-right:none;"><span>兑换规则</span></li>
				</ul>
			</div>
			<div class="information" style="display:block">
				<div class="rule-explain mb20">
					<dl>
						<dt>兑换说明</dt>
						<dd>1、兑换开始后，所有{:C('ftx_site_name')}会员均可点击“我要兑换”按钮进行兑换。</dd>
						<dd>2、为了更好的回馈会员，所有的礼品兑换不收取任何费用（实物礼品我们包邮为您送到家）。</dd>
						<dd>3、只能使用在{:C('ftx_site_name')}获得的情报兑换，情报余额不足则不能兑换。</dd>
						<dd>4、一旦兑换即扣除相应情报，所兑换的礼品将在后台审核后发出。如审核过程中发现该用户情报行为异常，兑换礼品将不予发放，已扣除情报不退还。如该用户恶意刷情报行为严重，我们保留不另行通知而直接封禁该用户账号的权利。</dd>
					</dl>
				</div>
				<div class="rule-explain mb20">
					<dl>
						<dt>注意事项</dt>
						<dd>1、所有礼品（除支付宝红包、优惠券等虚拟礼品除外）在兑换后的1-2个工作日，本站将从合作商城购买，具体到货时间取决于合作商城发货情况。</dd>
						<dd>2、若兑换礼品缺货或收货地址无法送达，我们会在1~2个工作日将相应返利或情报返还至您的账户中。</dd>
						<dd>3、提交兑换后，需经管理员审核，成功后将以站内信，邮件等方式通知您。</dd>
						<dd>4、兑换下单都有数量限制，兑换数量不足时，将无法申请兑换。</dd>
						<dd>5、实物礼品是{:C('ftx_site_name')}与第三方网站合作完成的兑换。如因购买时价格变动，{:C('ftx_site_name')}和会员双方均不需要作差价补偿。</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
	<div class="huan-right">
		<div id="lr_float">
			<div class="huan-login h-good">
				<div class="nav-userinfo fl">
					<div class="group">
            <div class="user-img">
              <a class="userinfo-img" href="{:U('user/index')}"><img src="{:avatar($info['id'], 100)}" width="80" height="80" /></a>
            </div>
            <div class="user-personal">
              <span class="name"><a href="{:U('user/index')}" target="_blank"><i class="org_2">{$info.username}</i></a></span><br>
              <span class="jfb">情报：<i class="green_3">{$info.score}</i> </span><br>
            </div>     
          </div>
					<div class="user-manage group">
						<a href="{:U('user/gift')}" target="_blank" class="ml10">兑换记录</a>
						<a href="{:U('user/mingxi')}" target="_blank" class="ml25">收入明细</a>
					</div>
				</div>
			</div>
			<div class="right_ad">
				<div style="" id='ad10'></div>
			</div>
		</div>
	</div>
</div>
 
<script>
$(".bady-tab:eq(0) li").click(function(){
	$(".bady-tab").not( $(".bady-tab:eq(0)")).hide();
	$(this).parents("ul").find("a").removeClass("badyactive");
	$(this).parents("ul").find("div").removeClass("bady-line-top");
	$(this).find("a").addClass("badyactive");
	$(this).find("div").addClass("bady-line-top");
	if($(this).index() == 0){
		$(".bady-tab,.information").show();
	}else{
		$(".information").hide();
		$(".information:eq("+$(this).index()+")").show();
	}
});

</script>
 

 <script>

 $(function(){
 	//跟随滚动
    var ele_fix = $("#lr_float");
    var _main = $(".main");
    if (ele_fix.length > 0) {
        var ele_offset_top = ele_fix.offset().top;
        $(window).scroll(function() {
            var scro_top = $(this).scrollTop();
            var test = ele_offset_top + scro_top;
            var fix_foot_pos = parseInt(ele_fix.height()) + parseInt(scro_top);
            var mainpos = parseInt(_main.offset().top) + parseInt(_main.height());
            if (scro_top <= ele_offset_top && fix_foot_pos < mainpos) {
                ele_fix.css({
                    position: "static",
                    top: "0"
                });
            } else if (scro_top > ele_offset_top && fix_foot_pos < mainpos) {
                $("#lr_float").css({
                    "position": "fixed",
                    "top": "0"
                });
            } else if (scro_top > ele_offset_top && fix_foot_pos > mainpos) {
                var posi = mainpos - fix_foot_pos;
                ele_fix.css({
                    position: "fixed",
                    top: posi
                });
            }
        });
    }
 })
 </script>

<include file="public:footer" />
<ftx:load type="js" href="
__STATIC__/js/jquery/plugins/jquery.tools.min.js,
__STATIC__/jky/js/gift.js
"/>
</body>
</html>
