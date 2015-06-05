<script type="text/javascript">
    function addLoadEvent(func) {
        var oldOnload = window.onload;
        if (typeof window.onload != 'function') {
            window.onload = func;
        }
        else {
            window.onload = function() {
                oldOnload();
                func();
            }
        }
    }
    // 添加Load事件处理
    addLoadEvent(hideMenu);
    function hideMenu() {
        setTimeout("window.scrollTo(0, 0)", 1);
    }

    $('.alert_black_bg .close').on('click', function(){
        $('.alert_black_bg').hide();
    });

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

    var F_pc = function(){
            if( browser.v.win || browser.v.mac){
                $("#alert_wrap .sub").html("立即下载");
            }else{
                $("#alert_wrap .sub").html("立即启动");
            }
        }
        F_pc();

    var refreshTimer = null,
            mebook = mebook || {};

    /*
     *滚动结束 屏幕静止一秒后检测哪些图片出现在viewport中
     *和PC端不同 由于无线速度限制 和手机运算能力的差异 1秒钟的延迟对手机端的用户来说可以忍受
     */
    $(window).on('scroll', function () {
        if (refreshTimer) {
            clearTimeout(refreshTimer);
            refreshTimer = null;
        }
        refreshTimer = setTimeout(mebook.getInViewportList(), 300);
    });

    $.belowthefold = function (element) {
        var fold = $(window).height() + $(window).scrollTop();
        return fold <= $(element).offset().top;
    };

    $.abovethetop = function (element) {
        var top = $(window).scrollTop();
        return top >= $(element).offset().top + $(element).height();
    };

    /*
     *判断元素是否出现在viewport中 依赖于上两个扩展方法
     */
    $.inViewport = function (element) {
        return !$.belowthefold(element) && !$.abovethetop(element)
    };

    mebook.loadImg = function (li) {
        if (li.length) {
            var img = li,
                    src = img.attr('_src');
            img.attr('src', src);
        }
    };
    mebook.getInViewportList = function () {
        var list = $('.lazy'),
                ret = [];
        list.each(function (i) {
            var li = list.eq(i);
            if ($.inViewport(li)) {
                mebook.loadImg(li);
            }
        });
    };
    $(window).scrollTop(1);
    mebook.getInViewportList();
    $(".goods-list li").each(function(){
        if($(this).find(".list-price").hasClass("start")){
            $(this).find("a").attr("href","javascript:;");
        }
    });

    $(".goods-list li").click(function(){
        if($(this).find(".list-price").hasClass("start")){
            $("#alert_exchange_new").css("top","40%");
            $(".alert_fullbg,#alert_exchange_new").show();
            $("#alert_exchange_new .fontL").html("下载客户端");
            $("#alert_exchange_new .fontS").html("收藏商品获开抢提醒");
            return false;
        }
    });
    
</script>
<script type="text/javascript" src="__STATIC__/m_8mob_jp/js/mjp.min.js"></script>
<script type="text/javascript" src="__STATIC__/m_8mob_jp/js/swipeSlide.min.js"></script>
<script type="text/javascript" src="__STATIC__/m_8mob_jp/js/jp.common.js"></script>
<script type="text/javascript">
            $(function(){
            function hideMenu() {
                setTimeout("window.scrollTo(0, 0)", 1);
            }
            $('.alert_black_bg .close').on('click', function(){
                $('.alert_black_bg').hide();
                $('#foot').height(120);
            });
            });
            $(".go-app .closed").on("click",function(){
                $(".go-app").hide();
                return false;
            })
</script>