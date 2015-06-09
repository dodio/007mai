/**
 * comm.js
 */
$(function() {

  /**
   * 签到按钮的划出框
   * @type {[type]}
   */
  var the;
  $(".btn_jfsc,#signIn_btn,#top-side-box").bind({
        mouseover:function(){
            clearTimeout(the);
            $("#top-side-box").show();
        },
        mouseout:function(){
            the = setTimeout(function(){
              $("#top-side-box").hide();
            },200);
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
    threshold:500,
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



// 页面最右侧边栏
$(function(){
    var $Right_layer = function() {
        var st = $(document).scrollTop(), winh = $(window).height();
        (st > 200)? $('#fix-right-layer').show(): $('#fix-right-layer').hide();
        //IE6下的定位
        if (!window.XMLHttpRequest) {
            $('#fix-right-layer').css("top", st + winh - 166);
        }
    };
    $(window).bind("scroll", $Right_layer);
    $Right_layer();


    $(window).resize(function(){
        if($('#fix-right-layer').height()<580){
            $('.fix-right-middle').hide();
        }else{
            $('.fix-right-middle').show();
        }
    });

        /* 右侧浮动层*/
    $('.img-span').hover(function(){
        var bar = $(this).find(".tab-bar-js");
        bar.css('right','60px').show().animate({right:"35px"},1000);
    },function(){
       $(this).find(".tab-bar-js").hide();
    });
    $('.gotop').click(function() {$("html, body").animate({ scrollTop: 0 }, 120);});
});
  


(function($){
  $.fn.extend({xyz_tab:function(c,callback){
      return this.each(function(j){
        var _s = this;
        setTimeout(function(){
          var menu =$('.ui-tabmenu',_s);
          var tabdiv=$('.ui-tabdiv',_s);
          var method = c ? "click" : "mouseenter";
          menu.each(function(i){
            $(this)[method](function(){
              tabdiv.hide()
              if(tabdiv[i]){
                tabdiv[i].style.display="block";
              }
              menu.removeClass('cur');
              $(this).addClass('cur');
              if($.isFunction(callback)){
                callback(tabdiv[i]);
              }
            });
          });
        },j*300);
      });
    }});
})(jQuery);

$(function(){
    //左侧浮动导航
    var side_nav = $("#sidenav");
    if(side_nav.length === 0){
      return;
    }
    var headh = $("div.side_nav_fix_pos").offset().top;
    var $navFun = function() {
        var st = $(document).scrollTop();

        if(st > headh){
          side_nav.addClass("affix");
        } else {
          side_nav.removeClass("affix");
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

    var side_sub_nav = $("div.side_sub_nav",side_nav);
    side_nav.mouseleave(function() {
      side_sub_nav.fadeOut(200);
      $('.ui-tabmenu',side_nav).removeClass('cur');
    });
    side_nav.xyz_tab(false,function(ele){
      if(ele){
        side_sub_nav.fadeIn(200);
      }else{
        side_sub_nav.hide();
      }

    });
});
