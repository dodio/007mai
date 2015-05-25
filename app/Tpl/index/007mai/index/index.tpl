<!doctype html>
<html>
<head>
<include file="public:head" />
</head>
<body>
<include file="public:header" />
<script>
  
  $(function() {
    
   /**
     * 首页幻灯片
     * @param {}
     * @time 2015-01-13
     */

    var carousel_index = function(){
        if($(".banner li").size() == 1) $(".banner li").eq(0).css("opacity", "1");
        if($(".banner li").size() <= 1) return;
        var i = 0,max = $(".banner li").size()- 1,playTimer;
        $(".banner li").each(function(){
            $(".adType").append('<a></a>');
        });
    //初始化
        $(".adType a").eq(0).addClass("current");
    $(".banner li").eq(0).css({"z-index":"2","opacity":"1"});
    var playshow=function(){
        $(".adType a").removeClass("current").eq(i).addClass("current");
        $(".top_bar .banner li").eq(i).css("z-index", "2").fadeTo(500, 1, function(){
        $(".top_bar .banner li").eq(i).siblings("li").css({
                  "z-index": 0,
                  opacity: 0
        }).end().css("z-index", 1);
        });
    }
    var next = function(){
      i = i>=max?0:i+1;
      playshow()
    }
    var prev = function(){
      i = i<=0?max:i-1;
      playshow()
    }
        var play = setInterval(next,3000);
        $(".banner li a,.banner_arrow").hover(function(){
            clearInterval(play);
            $(".banner_arrow").css("display","block");
        },function(){
            clearInterval(play);
            play = setInterval(next,3000);
            $(".banner_arrow").css("display","none");
        });
        $(".banner_arrow .arrow_prev").on('click',prev);
        $(".banner_arrow .arrow_next").on('click',next);
        $(".adType a").mouseover(function(){
            if($(this).hasClass("current")) return;
            var index = $(this).index()-1;
            var playTimer = setTimeout(function(){
                clearInterval(play);
                i = index;
                next();
            },500)
        }).mouseout(function(){
                clearTimeout(playTimer);
            });
    }
    carousel_index();
  })
</script>

<include file="public:nav-classify" />
<div class="side_nav_fix_pos"></div>
<style>.side_nav .content{border-top: none;}</style>
<div class="big_banner group">
  {:R('advert/index', array(1), 'Widget')}
</div>
<div class="main page007mai group">
  {:R('advert/index', array(4), 'Widget')}
</div>

  <div class="main page007mai group">
    {:R('advert/index', array(5), 'Widget')}
  </div>
  <include file="public:list" />

<include file="public:footer" />
</body>
</html>