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
    

    <for start="0" end="9">
    <div class="show-item shop mb20">
      <div class="show-pic">
        <a href="" target="_blank"><img src="http://img01.taobaocdn.com/bao/uploaded/i3/TB1yrEKHFXXXXaEXVXXXXXXXXXX_!!0-item_pic.jpg_310x310.jpg" alt=""></a>
      </div>
      <div class="show-name"><a href="" target="_blank">夏天的我2003</a></div>
      <div class="show-info group">
        <div class="taobao fl"><i class="icon icon-taobao"></i>淘宝</div>
        <div class="fr"><div class="taobaorank rank-r20"></div></div>
      </div>
      <a href="" target="_blank" class="shop-go mt10">进店逛逛</a>
    </div>

    <div class="show-item shop mb20">
      <div class="show-pic">
        <a href="" target="_blank"><img src="http://img01.taobaocdn.com/bao/uploaded/i4/T19ufyFOBXXXXXXXXX_!!0-item_pic.jpg_310x310.jpg" alt=""></a>
      </div>
      <div class="show-name"><a href="" target="_blank">郑人鞋类专营店</a></div>
      <div class="show-info group">
        <div class="taobao fl"><i class="icon icon-tmall"></i>天猫</div>
        <div class="fr"><i class="heart1-icon icon"></i>2311人关注</div>
      </div>
      <a href="" target="_blank" class="shop-go mt10">进店逛逛</a>
    </div>
    </for>
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

    <include file="index:item-list" />
    <include file="public:pagenav"/>

  </div>

</div>

<include file="allshop"/>

<include file="public:footer" />
</body>
</html>