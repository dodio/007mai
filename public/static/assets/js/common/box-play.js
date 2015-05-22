//幻灯片
$(function() {
  if($(".box-play").length){
    if ($(".box-play").find(".img-list li").length != 1) {
      var n = $(".box-play"),
        b, a = "",
        h = $(".box-play").find(".img-list li"),
        k = box_play_interval = null,
        c = 0;
      for (b = 0; b < h.length; b++) {
        if (b == 0) {
          a += '<li class="cur" style=" margin-left:0;"></li>'
        } else {
          a += "<li></li>"
        }
      }
      n.find(".count-num").html(a).css({
        marginLeft: (-n.find(".count-num").width() / 2) + "px"
      });
      n.find(".count-num li").live("mouseover", function() {
        c = n.find(".count-num li").index($(this));
        k = setTimeout(function() {
          n.find(".count-num li").eq(c).addClass("cur").siblings().removeClass("cur");
          h.eq(c).fadeIn("slow").siblings().fadeOut("slow")
        }, 100)
      }).live("mouseout", function() {
        clearTimeout(k)
      });

      function m() {
        clearTimeout(box_play_interval);
        if (c < h.length - 1) {
          c++;
          n.find(".count-num li").eq(c).addClass("cur").siblings().removeClass("cur");
          h.eq(c).fadeIn("slow").siblings().fadeOut("slow")
        } else {
          c = 0;
          n.find(".count-num li").eq(c).addClass("cur").siblings().removeClass("cur");
          h.eq(c).fadeIn("slow").siblings().fadeOut("slow")
        }
        box_play_interval = setTimeout(m, 8000)
      }
      box_play_interval = setTimeout(m, 8000);
      n.live("mouseover", function() {
        clearTimeout(box_play_interval)
      }).live("mouseout", function() {
        box_play_interval = setTimeout(m, 8000)
      })
    } else {
      $(".box-play").find(".count-num").remove()
    }
  }

  //幻灯片开关
  if(getCookie('box-play')!=1){
    $("#img-list").show();
    $("#close_play").show();
  }
  else{
    $("#img-list").hide();
    $("#open_play").show();
  }
  $("#close_play").on("click",function(){
    $("#img-list").slideUp();
    $("#close_play").hide("slow");
    $("#open_play").show("slow");
    setCookie('box-play',1,7); //默认7天执行一次
  })
  $("#open_play").on("click",function(){
    $("#img-list").slideDown();
    $("#close_play").show("slow");
    $("#open_play").hide("slow");
    setCookie('box-play');
  })
});