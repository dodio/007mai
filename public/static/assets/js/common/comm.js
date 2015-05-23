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


/*搜索框ui效果*/
$(document).ready(function(){
  var word_top  = '输入宝贝名称！';
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


});

$(function(){
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