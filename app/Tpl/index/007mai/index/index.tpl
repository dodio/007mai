<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/index.css
"/>
</head>
<body>
<div id="big_slide_down">
  <div class="big_ad">
    {:R('advert/index', array('big_slide_down'), 'Widget')}
  </div>
  <a href="javascritp:" class="btn_close">点击拉回</a>
</div>
<include file="public:header" />

<include file="public:sidenav"/>

<div class="big_banner group">
  {:R('advert/index', array('big_banner'), 'Widget')}
</div>

<div class="container group mt30">
  <div class="fl promote_cate_list group">
    {:R('advert/index', array('promote_cate_list1'), 'Widget')}
    {:R('advert/index', array('promote_cate_list2'), 'Widget')}
    {:R('advert/index', array('promote_cate_list3'), 'Widget')}
    {:R('advert/index', array('promote_cate_list4'), 'Widget')}
  </div>
  <div class="fr">
    <notempty name="visitor">
      <div class="qingbao_box">
        <div class="title"><a href="/gift/index" target="_blank">你的情报，你的商城</a></div>
        <div id="qiandaobox" class="mt10 content group">
          <div class="userinfo group">
            <div class="avatar">
              <a href="/user/index">
                <img src="{:avatar($visitor['id'],48)}" alt="">
              </a>
            </div>
            <div class="info fl ml10">
              <div class="username"><a href="" target="/user/index">{$visitor.username}</a></div>
              <div class="text group">
                <span class="score">情报：<em>{$visitor.score}</em></span>
                <a target="_blank" class="fr" href="/user/mingxi">明细</a>
              </div>
            </div>
          </div>
          <div id="closest_duihuan" class="mt10 group">
            
          </div>
        </div>
<script>
  $(function(){
    $.MAI007.data.getUserinfo().done(function(data){
      if(data.s == 1){
        //登录获取最接近的礼物商品
        var user = data.user;
        $.MAI007.data.getCloseScoreItem().done(function(data){
          if(data.status == 1 && data.msg){
            var html= "<div class=\"fl mt5\">"
+ "              <div class=\"text\"><a href=\"/help/qingbao\" target=\"_blank\">快速获得情报!</a></div>"
+ "              <div class=\"text\">"
+ "                <span class=\"score\">还差<em class=\"ml5\"><literal>{$distance_score}</literal></em></span>&nbsp;情报"
+ "              </div>"
+ "              <div class=\"text\">就可以兑换：<a href=\"/gift/detail/id/<literal>{$id}</literal>\" class=\"item_ex\" target=\"_blank\"><literal>{$title}</literal></a></div>"
+ "            </div>"
+ "            <div class=\"q_item\">"
+ "              <a href=\"/gift/detail/id/<literal>{$id}</literal>\" target=\"_blank\">"
+ "                <img src=\"<literal>{$img}</literal>\" alt=\"\">"
+ "              </a>"
+ "            </div>";
            var tpl = _.template(html);
            var item = data.data;
            item.distance_score = item.score-user.jifen;
            console.log(tpl.toString());
            $("#closest_duihuan").html( tpl(item) );
          }else{
            var html = "您已经收集了很多情报，快去情报商城兑换吧！";
            $("#closest_duihuan").html(html);
          }
        })
        //未登录
      }else{
        html = "登录以后可以看到，您可以马上兑换什么礼物。";
        $("#closest_duihuan").html(html);
      }
    });
    
  });
</script>
    </div>
    </notempty>
    
    <empty name="visitor">
      <div class="qingbao_box group">
        <div class="title"><a href="/gift/index" target="_blank">你的情报，你的商城</a></div>
        <div id="qiandaobox" class="mt10 content group">
          <a href="{:U('oauth/index', array('mod'=>'qq'))}" target="_blank"><img src="__STATIC__/assets/images/Connect_logo_5.png" alt=""></a>
        </div>
      </div>
      <div class="ad_qb">
        {:R('advert/index', array('qingbao_ad'), 'Widget')}
      </div>
    </empty>
    
  </div>
</div>

<div class="mai007-w100x150bg group">
  <div class="mai007-inner">
    <div class="container">
      {:R('advert/index', array('hot_cates'), 'Widget')}
    </div>
  </div>
</div>

<div class="container">
    <div class="baokuan">
      <div class="bk-top group">
        <h2>情报精选</h2>
        <div class="bk-label"></div>
        <div class="bk-nav">
          <a href="/ba" target="_blank">八块八</a>
          <a href="/shiba" target="_blank">十八块八</a>
        </div>
      </div>
      <include file="baokuan_list" />
   </div>
</div>

<div class="container mt20">
  <div class="baokuan">
    <div class="bk-top group">
      <h2>情报店铺</h2>
      <div class="bk-nav">
        <a href="http://s.click.taobao.com/t?e=m%3D2%26s%3DF1zIB0VV1A4cQipKwQzePCperVdZeJviEViQ0P1Vf2kguMN8XjClAuSP2sR3JAkEijNJEVZuO8ASAQtu4hYZUK%2FcS5yixJ%2FffI1UR37r6pJ9h2dzyPuHmlW00662PG2K8Cm%2FwUl4ESHcHtRpEUy6RLSgd9R%2Fv5WktY4Qt2cZ1lVeY%2By0blbhscYl7w3%2FA2kb" target="_blank">聚划算</a>
      </div>
    </div>
  </div>
  <?php $si = 0 ; ?>
  <ul class="wide_shoplist group">
    <volist name="shops" id="val">
      <volist name="val" id="shop">
        <?php $mod = ($si++)%6; ?>
        <li <eq name="mod" value="5">class="mr0"</eq>>
          <include file="shop-item-reason"/>
        </li>
      </volist>
    </volist>
  </ul>
</div>
<div class="container mt20">
  <div class="baokuan">
    <div class="bk-top group">
      <h2>免费兑换</h2>
      <div class="bk-nav">
        <a href="/gift" target="_blank">情报商城</a>
      </div>
    </div>
  </div>
  <ul class="scoreitem-list group">
    <volist name="scoreitems" id="item" mod="5">
      <li <eq name="mod" value="4"> class="mr0"</eq>>
        <include file="gift:score-item"/>
      </li>
    </volist>
  </ul>
  <include file="gift:timerjs"/>
</div>

<?php foreach ($cate_items as $cid => $items_list): ?>
  <?php $cate = $cate_data[$cid]; ?>
  <div class="container index-promote">
    <div class="baokuan">
      <div class="bk-top group">
        <h2>{$cate.name}</h2>
        <div class="bk-nav">
          <a href="/index/cate/cid/{$cate.id}" target="_blank">更多</a>
        </div>
      </div>
    </div>
    <include file="item-list"/>
  </div>
<?php endforeach ?>

<div class="mt20 container group">
  <!-- 100高度广告位 -->
  <div class="mai007-w100x100" data-ajax-ad="tracker" data-ad-tracker="index_middle" data-auto="1"></div>
</div>

  <include file="public:shopping_index"/>

<include file="public:footer" />
<script>
  $(function(){
    $('.item').addClass("show-normal");
  });
</script>
</body>
</html>