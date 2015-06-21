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
        <?php $mod = ($si++)%4; ?>
        <li <eq name="mod" value="3">class="mr0"</eq>>
          <include file="shop-item"/>
        </li>
      </volist>
    </volist>
  </ul>
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
  <div class="mai007-w100x100">
    <!-- 图片广告 -->
    <div class="mai007-picad">
      <a href="" target="_blank">
        <img src="http://d05.res.meilishuo.net/pic/_o/fd/45/d45975bbf155ec6fb4e474e1421c_1200_120.ch.jpg" alt="">
      </a>
    </div>
  </div>
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