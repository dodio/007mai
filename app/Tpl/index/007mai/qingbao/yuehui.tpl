<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/qingbao.css
"/>
</head>
<body>

<include file="public:header" />


<style>
  .sidenav.affix{
    top: 37px;
  }
</style>
<div id="root_cates" class="root_cates">
  <div class="rc_wrap">
    <div class="container mod_mid group">
      <ul class="mod_mid_wrap">
          <li class="mod_mid_item"><a href="#tuan">团购</a></li> 
          <li class="mod_mid_item"><a href="#meishi">美食</a></li> 
          <li class="mod_mid_item"><a href="#movies">电影</a></li> 
          <volist name="subnav" id="bcate">
            <li class="mod_mid_item"><a <if condition="($rootid eq $bcate['id'])">class="cur"</if> href="{:U(__ACTION__)}#q_{$bcate.id}" title="{$bcate.name}">{$bcate.name}</a></li> 
          </volist>
          <li class="mod_mid_item"><a href="#hotel">旅行酒店</a></li> 
      </ul>
    </div>
  </div>
</div>
<script>
  $(function(){
    var w = $("#root_cates").find('.rc_wrap');
    var top = w.offset().top;
    setTimeout(function(){
      $.scrollManager.add({
        height:top,
        down:function(){
          w.addClass("affix");
        }
      },"hide_root_cate");
    },2000);
  });
</script>
<include file="public:sidenav" />

<block name="banner">
  <div class="container">
    <div class="qinglv_pic" style="width: 100%;height: 205px;background:url(__STATIC__/images/yuehui.png) 0 0 no-repeat;"></div>
  </div>
</block>


<div id="tuan" class="container mt30 group">
    <div id="q_{$cate.id}" class="title_bar">
      <h2>精选团购</h2>
    </div>
    <div class="group mt20">
      <div class="fl">
        <iframe frameborder="0" id="mtcontent" scrolling="no" style="width:680px;height:70px;margin-top: 30px;" src="http://x.union.meituan.com/search?type=99&width=435&logo=1&keyword=1&source=5be571b0c846c66deac88a95bbfe2bb3784&callback=1"></iframe>
        <div class="mt20">
          <a href="http://r.union.meituan.com/url/visit/?a=1&key=5be571b0c846c66deac88a95bbfe2bb3784&url=http%3A%2F%2Fwww.meituan.com" target="_blank"><img alt="mt_728*90" src="http://union.meituan.com/static/ad/MT_1322185669.gif"  border="0" /></a>
        </div>
      </div>
      <div class="fr">
        <iframe frameborder="0" id="mtcontent" scrolling="no" style="width:300px;height:250px;" src="http://x.union.meituan.com/adx?type=3&source=5be571b0c846c66deac88a95bbfe2bb3784&callback=1&width=300&height=250"></iframe>
      </div>
    </div>
</div>

<div id="meishi" class="container mt30 group">
    <div id="q_{$cate.id}" class="title_bar">
      <h2>约会美食</h2>
    </div>
    <div class="group mt20">
      <div class="fl">
        <a href="http://r.union.meituan.com/url/visit/?a=1&key=5be571b0c846c66deac88a95bbfe2bb3784&url=http%3A%2F%2Fwww.meituan.com" target="_blank"><img alt="mt_600*310" src="http://union.meituan.com/static/ad/MT_1343378794.jpg"  border="0" /></a>
      </div>
      <div class="fr">
        <a href="http://r.union.meituan.com/url/visit/?a=1&key=5be571b0c846c66deac88a95bbfe2bb3784&url=http%3A%2F%2Fwww.meituan.com" target="_blank"><img alt="mt_460*260" src="http://union.meituan.com/static/ad/MT_1338366501.jpg"  border="0" /></a>
      </div>
    </div>
</div>


<div id="movies" class="container mt30 group">
    <div id="q_{$cate.id}" class="title_bar">
      <h2>约会电影</h2>
    </div>
    <div class="group mt20">
      <iframe frameborder="0" id="mtcontent" scrolling="no" style="width:1040px;height:260px;margin: 0 auto;" src="http://x.union.meituan.com/movie?type=80&start=0&nums=8&source=5be571b0c846c66deac88a95bbfe2bb3784&callback=1"></iframe>
    </div>
</div>


<div id="baobei" class="container mt20 group">
  <foreach name="item_groups" key="cate_id" item="items_list">
  <?php 
  $cate = $cate_data[$cate_id];
  $items_list = array_slice($items_list, 0,8);
  ?>
  
    <div id="q_{$cate.id}" class="title_bar">
      <h2>约会{$cate.name}</h2>
      <a href="/index/cate/?cname={$cate.name}" target="_blank" class="more">更多</a>
    </div>

    <include file="index:item-list"/>

  </foreach>

  <script>
    $(function(){
      $.MAI007.ui.itemEffect.setEffect("缩放");
    });
  </script>
</div>


<div id="hotel" class="container mt20 mb20 group">
  <div id="q_{$cate.id}" class="title_bar">
      <h2>旅游酒店</h2>
  </div>
  <div class="group mt20">
    <div class="fl ml20">
      <a data-type="15" data-tmpl="670x310" data-tmplid="217" biz-loc_name="{$ipinfo.city}" biz-from_city="" biz-begin_date="" biz-end_date="" data-rd="2" data-style="2" data-border="1" href="#"></a>
    </div>
    <div class="fl ml20">
      <iframe frameborder="0" id="mtcontent" scrolling="no" style="width:252px;height:397px;" src="http://x.union.meituan.com/hotel?type=70&start=0&nums=3&source=5be571b0c846c66deac88a95bbfe2bb3784&callback=1"></iframe>
    </div>
  </div>

</div>

 
<include file="public:footer" />
</body>
</html>

