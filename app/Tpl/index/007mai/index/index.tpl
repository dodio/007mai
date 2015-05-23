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
<div class="big_banner group">
  {:R('advert/index', array(1), 'Widget')}
  <div class="top_wrap {:C('ftx_site_wc')}">
    <div class="top_box">
      <div class="banner_l">
        <dl>
          <dd>
            <a href="{:U('jiu/index')}"  target="_blank"><img src="/static/assets/images/global/top_right_jiu.png">
            <div class="txt"><span class="title">9.9包邮</span> <span>今日上新<em>{$today_jiu_count}</em>款</span></div></a>
          </dd>
          <dd>
            <a href="{:U('shijiu/index')}"  target="_blank"><img src="/static/assets/images/global/top_right_shi.png">
            <div class="txt"><span class="title">19.9包邮</span> <span>今日上新<em>{$today_shi_count}</em>款</span></div></a>
          </dd>
          <dd>
            <a href="{:U('jiu/index')}"  target="_blank"><img src="/static/assets/images/global/top_right_jiu.png">
            <div class="txt"><span class="title">9.9包邮</span> <span>今日上新<em>{$today_jiu_count}</em>款</span></div></a>
          </dd>
        </dl>
      </div>
      <div class="round">
          <div class="adType"></div>
      </div>
      <div style="display:none;" class="banner_arrow" data-banner="arrow">
          <a href="javascript:;" class="arrow_prev" data-arrow="prev"><i></i></a>
          <a href="javascript:;" class="arrow_next" data-arrow="next"><i></i></a>
      </div>
      </div>
  </div>
</div>


<div class="main w1100 group">
  {:R('advert/index', array(4), 'Widget')}
</div>

<div class="main w1100 group">
  <include file="pailist" />
</div>

<include file="public:list" />

<include file="public:footer" />
</body>
</html>