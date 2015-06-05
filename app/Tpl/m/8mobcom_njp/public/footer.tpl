	<div class="alert_fullbg"></div>
	<div class="tips"><div><img src="http://s.juancdn.com/webapp/images/images.png" width="100%;"></div></div>
            <div class="tips01"><div><img src="http://s.juancdn.com/webapp/images/images01.png" width="100%;"></div></div>
	<div id="back_top" class="slide-box" style="display: none;">
		<a href="#" class="back-top"><img src="__STATIC__/m_8mob_jp/images/icon/back-top.png"></a>      
	</div>
	<script type="text/javascript">

	var browser={

        v: (function(){
            var u = navigator.userAgent, app = navigator.appVersion, p = navigator.platform;
            return {
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                ios: !!u.match(/i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
                iPhone: u.indexOf('iPhone') > -1 , //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                weixin: u.indexOf('MicroMessenger') > -1, //是否微信
                webApp: u.indexOf('Safari') == -1, //是否web应该程序，没有头部与底部
                UCB: u.match(/UCBrowser/i) == "UCBrowser",
                QQB: u.match(/MQQBrowser/i) == "MQQBrowser",
                win: p.indexOf('Win') > -1,//判断是否是WIN操作系统
                mac: p.indexOf('Mac') > -1//判断是否是Mac操作系统

            };
        })()
    }

    var F_weixin = function(){
        if (browser.v.weixin ) {

            $("ul.goods-list a").on('click', F_alert_tips);
            $("div.alert_fullbg").on('click',F_alert_hide);

        }else{

        }
    }

    var type = "";

    var F_alert_tips = function(type) {

        if(type == "down"){
            $(".tips").css({
                display:'block'
            });
        } else {
            $(".tips01").css({
                display:'block'
            });
        }

        $(".alert_fullbg").css({
            display:'block'
        })

        return false;
    }
    var F_alert_hide =function() {
        $(".tips").hide();
        $(".tips01").hide();
        $(".alert_fullbg").hide();
    }


    F_weixin();



	//回到顶部图标显示隐藏效果
	document.getElementById("back_top").style.display = "none";
	window.onscroll = function () {
	    if (document.documentElement.scrollTop + document.body.scrollTop > 100) {
		document.getElementById("back_top").style.display = "block";
	    }
	    else {
		document.getElementById("back_top").style.display = "none";
	    }
	}
	var $divWidth = $('.goods-a img').width();
	$('.goods-a img').css({'height':$divWidth});

	</script>
	<style type="text/css">
	#foot{height: 120px;}
	</style>
	{:C('ftx_taojindian_html')}
	<div id="foot">
	    <div class="foot-nav">
		<a href="{:C('ftx_site_url')}"><img src="__STATIC__/m_8mob_jp/images/icon/phone.png">电脑版</a>
		<a href="{:U('index/index')}" class="_border"><img src="__STATIC__/m_8mob_jp/images/icon/home.png">返回首页</a>
	    </div>
	    <div class="foot-copyright"></div>
	    <h2>copyright © 2015 {:C('ftx_site_name')}</h2>
	</div>

    <div style="display: none;">
        {:C('ftx_statistics_code')}</p>
    </div>