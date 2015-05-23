/**
 * comm.js
 */
$(function() {

  /**
   * 签到按钮的划出框
   * @type {[type]}
   */
	$(".btn_jfsc,#top-side-box").bind({
        mouseover:function(){
            $("#top-side-box").show();
        },
        mouseout:function(){
            $("#top-side-box").hide();
        }
    });

  /**
   * 登录后的用户菜单
   */
	$(".logined-show").live({
        mouseover:function(){
            $(this).addClass("hover");
        },
        mouseout:function(){
            $(this).removeClass("hover");
        }
    });

  //右侧窗口侧边栏会员中心按钮,检测是否登录
	$('.mark').bind('click', function(){
		if(!$.ftxia.dialog.islogin()) return !1;
	});

});



/**
 * 跟comm.js一样，都是全站使用的效果js
 */

/*搜索框ui效果*/
$(document).ready(function(){
  var word_top  = '在此输入您要找的宝贝！';
  var $word_top = $('.search_box .text');
  $word_top.focusClear();

  if(!$word_top.val()){
    $word_top.val(word_top);
  }
  $word_top.focus(function(){
    if( $(this).val()==word_top){
      $(this).val('');
    }
  }).blur(function(){
    if( !$(this).val()){
      $(this).val(word_top);
    }
  });
});

function search_submit(){
  var k = $(".search_box .text").val();
  if(k == '请输入您要找的宝贝！'){
    alert("请输入要搜索的内容！");
    return false;
  }
}

function formatFloat(src, pos){
  return Math.round(src*Math.pow(10, pos))/Math.pow(10, pos);
}

/*收藏*/
function AddFavorite(b) {
  CloseNLRAF(true);
  var c = null;
  if (b == "childreTop") {
    var c = SITEURL;
  } else {
    if (b == "welcomefavorite") {
      var c = SITEURL+"?from=fav"
    } else {
      var c = location.href + (b == true ? "?from=topfavorite": "")
    }
  }
  if ($.browser.msie) {
    try {
      window.external.addFavorite(c, ""+WEBNICK+"-省钱，从"+WEBNICK+"开始。")
    } catch(a) {
      alert("请按键盘 CTRL键 + D 把"+WEBNICK+"放入收藏夹，折扣信息一手掌握！")
    }
  } else {
    if ($.browser.mozilla) {
      try {
        window.sidebar.addPanel(""+WEBNICK+"-网购，从"+WEBNICK+"开始。", c, "")
      } catch(a) {
        alert("请按键盘 CTRL键 + D 把"+WEBNICK+"放入收藏夹，折扣信息一手掌握！")
      }
    } else {
      alert("请按键盘 CTRL键 + D 把"+WEBNICK+"放入收藏夹，折扣信息一手掌握！")
    }
  }
  return false
}

function SetHome(url){
  if (document.all) {
    document.body.style.behavior='url(#default#homepage)';
    document.body.setHomePage(url);
  }else{ 
    alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!"); 
  } 
}

function CloseNLRAF(a) {
  if (a) {
    $.cookie("NLRAF", "true", {
      path: "/",
      expires: 30
    })
  } else {
    $.cookie("NLRAF", "true", {
      path: "/"
    })
  }
  $("#afp").slideUp()
}

$(function(){
  //图片懒加载
  $('img.lazy').lazyload({
    threshold:200,
    failure_limit:40,
    effect : "fadeIn"
  });

  //顶部弹出收藏
  if ($.cookie("NLRAF") == null && !/favorite|desk|zt11/.test(location.search)) {
    if (!$("#afp").length) {
      $("body").prepend('<div id="afp" style="display:none;"><div class="afpc"><p>请按键盘 <strong>CTRL + D</strong> 把'+WEBNICK+'放入收藏夹，折扣信息一手掌握！<a id="af" class="afpa" href="javascript:void(0)" onclick="AddFavorite(true)">加入收藏夹</a><a href="'+SITEURL+'index.php?m=index&a=shortcut" class="desktop">添加到桌面</a></p></div><div class="close_area"><label id="nlraf" onclick="CloseNLRAF(true)" for="check_nlraf"><input type="checkbox" id="check_nlraf" />不再提醒</label><a id="cafp" href="javascript:void(0)" onclick="CloseNLRAF(false)"></a></div></div>')
    }
    $("#afp").slideDown("slow")
  }

  
  

// 主导航的js效果
  allMenu_show=function(){
    if($(".top_bar").size() > 0){
      $(".nav ul li:first").addClass("open");
      return;
    }
        var timer=null;
        $(".nav ul li:first").hover(
            function(){
                var mu=$(this);
                timer=setTimeout(function(){
                    mu.addClass("open");
                },100);
            },
            function(){
                clearTimeout(timer);
                $(this).removeClass("open");
            }
        );
    }
    allMenu_show();

});

$(function(){
    //左侧浮动导航
    var $navFun = function() {
        var st = $(document).scrollTop(), 
            headh = $("div.head").height(),           
            $nav_classify = $("div.jiu-side-nav");

        if(st > headh){
            $nav_classify.addClass("fixed");
        } else {
            $nav_classify.removeClass("fixed");
        }
    };

    var F_nav_scroll = function () {
        if(navigator.userAgent.indexOf('iPad') > -1){
            return false;
        }      
        if (!window.XMLHttpRequest) {
           return;          
        }else{
            //默认执行一次
            $navFun();
            $(window).bind("scroll", $navFun);
        }
    }
    F_nav_scroll();

});