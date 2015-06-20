/**
 * comm.js
 */
;(function($){
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
    $("#afp").slideDown("slow");
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
    $.removeCookie('score_change',{path:"/"});
  }
});


$(function(){
  var root_cates = $("#root_cates .rc_wrap");
  if(root_cates.length == 0 )
    return;
  var top_height = root_cates.offset().top;
  var height = root_cates.height();
  $.scrollManager.add({
    down:function(st,ot){
      if(st>top_height){
        root_cates.hide();
      }
    },
    up:function(st,ot){
      if(st>top_height){
        root_cates.css({top:-height}).addClass("affix").show().animate({top:0},300);
      }
    }
  },"hide_root_cate");

  $.scrollManager.add({
    height:height,
    up:function(){
      root_cates.removeClass("affix").show();
    }
  });
});


$(function(){
    var side_nav = $("#sidenav");
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

    var search_btn = $(".btn_search",side_nav);
    var txt = $("input[name=key]",side_nav);
    var form = $("form",side_nav);
    search_btn.click(function(){
      form.submit();
    }).mouseenter(function(){
      txt.focus();
    });

    form.submit(function(){
      var k = txt.val();
       if($.trim(k) == ""){
        return false;
      }
    });

});

$(function(){
    var sidenav = $("#sidenav");
    if(sidenav.length == 0 )
      return;
    var headh = window.sidenav_fix || $("#side_nav_fix_pos").offset().top;
    var sidenav_width = sidenav.width();
    $(".sidenav-nav-wrap",sidenav).width(sidenav_width);
    $.scrollManager.add({
      height:headh,
      up:function(st){
        sidenav.removeClass("affix");
      },
      down:function(st){
        sidenav.addClass('affix');
      }
    });

    $.scrollManager.add({
      up:function(st,ot){
        if(st<headh){
          sidenav.removeClass("affix");
          return;
        }
        sidenav.show();
        sidenav.stop(true).animate({width:sidenav_width},200,function(){
          sidenav.css("overflow","visibale");
        });
      },
      down:function(st,ot){
        if(st<headh){
          sidenav.removeClass("affix");
          return;
        }
        sidenav.stop(true).animate({width:0},200,function(){
          sidenav.hide();
        });
      }
    });
});





$(function() {
    if($('.itemlist').length == 0 ){
      return;
    }
  var F_createEle = function(ele){
          var div = document.createElement('div');
          div.id = "likeico";
          div.innerHTML = "<span class='heart_left'></span><span class='heart_right'></span>";
          ele.append(div);
      }

  var Mylike_add = function(event) {
    if(!$.ftxia.dialog.islogin()) return !1;
   
          var obj = $(this);
          var parent = obj;
          var id = parent.attr('lkid');
          var s = parent.attr('lks');
          var gtype = parent.attr("gtype");

          F_createEle(obj);
          setTimeout(function(){$("#likeico").remove()}, 600);
          if(s == 1) {
              // like success
              parent.attr('lks',0);
              obj.find('i.like-ico').addClass('l-active');
              obj.closest('li').find('.like-ceng').show();
              $("#likeico").removeClass('unliked').addClass('like-big').addClass('demo1');
              parent.css('display','block');
          } else {
              // un like success
              parent.attr('lks',1);
              obj.find('i.like-ico').removeClass('l-active');
              $("#likeico").removeClass('l-active').addClass('unliked').removeClass('demo1');
              obj.closest('li').find('.like-ceng').hide();
              parent.css('display','');
          }
      }




    $("a.my-like").bind('click', 
    function() {
        var pid = $(this).attr("lkid");
        if (!$.ftxia.dialog.islogin()) return;
  var obj = $(this);
        var parent = obj;
        var id = parent.attr('lkid');
        var s = parent.attr('lks');
        var gtype = parent.attr("gtype");

        F_createEle(obj);
        setTimeout(function(){$("#likeico").remove()}, 600);
        if(s == 1) {
            // like success
            parent.attr('lks',0);
            obj.find('i.like-ico').addClass('l-active');
            obj.closest('li').find('.like-ceng').show();
            $("#likeico").removeClass('unliked').addClass('like-big').addClass('demo1');
            parent.css('display','block');
        } else {
            // un like success
            parent.attr('lks',1);
            obj.find('i.like-ico').removeClass('l-active');
            $("#likeico").removeClass('l-active').addClass('unliked').removeClass('demo1');
            obj.closest('li').find('.like-ceng').hide();
            parent.css('display','');
        }

        $.ajax({
            url: FTXIAER.root + '/index.php?m=ajax&a=like',
            type: 'POST',
            data: {
                pid: pid
            },
            dataType: 'json',
            success: function(result) {
                if (result.status == 1) {
                    $.ftxia.tip({
                        content: result.msg,
                        icon: 'success'
                    });
                } else if (result.status == 2) {
                    $.ftxia.tip({
                        content: result.msg,
                        icon: 'error'
                    });
                } else {
                    $.ftxia.tip({
                        content: result.msg,
                        icon: 'error'
                    });
                }
            }
        });
    });
});
