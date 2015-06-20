<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/cate.css
"/>
</head>
<body>
<?php $action = __ACTION__; ?>
<include file="public:topbar" />
<include file="public:header" />


<include file="public:sidenav" />


<block name="root_cates">
  <include file="index:root_cates"/>
</block>

<div class="container mt20 group">
  <div class="shop_promote fl">
    <div class="sp-title mb10">优秀店铺</div>
    
    <volist name="shops" id="val">
      <volist name="val" id="shop">
        <include file="shop-item"/>
      </volist>
    </volist>
    
    <div class="mt20 mai007-w206x100">
      {:R('advert/index', array(8), 'Widget')}
    </div>
  </div>
  <!-- 左边end -->

  <div class="fr cate-right">
    <div class="box">
      <block name="subcates">
        <include file="index:sub_cates"/>
      </block>
      <!-- subcates -->
      <block name="pricefilter">
        <include file="index:price-filter"/>
      </block>
    </div>

    <block name="ratefilter">
      <include file="index:rate-filter"/>
    </block>
    <div id="itemlist">
      <include file="index:item-list" />
    </div>
    <include file="public:pagenav"/>

  </div>

</div>

<include file="allshop"/>

<include file="public:footer" />
</body>
</html>