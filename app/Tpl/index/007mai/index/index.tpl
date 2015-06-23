<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/index.css
"/>
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />

<include file="public:sidenav"/>

<div class="big_banner group">
  {:R('advert/index', array(1), 'Widget')}
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