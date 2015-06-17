/**
 * comm.js
 */
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
  //积分变更提示
  var score_change = $.MAI007.util.thinkCookie('score_change');
  if(score_change){
    $.ftxia.tip({
      content: score_change.action +":　情报 +" + score_change.score,
      time: 3000
    });
    $.cookie('score_change',null);
  }
});