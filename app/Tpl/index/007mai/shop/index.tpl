<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/shop.css
"/>
<script>
  $.MAI007.util.delay(function(){
    $("#cafp").click();
  },100);
</script>
</head>
<body>
<div class="header">
  <div class="mainNav group">
    <ul class="navigation group">
      <ftx:nav type="lists" style="main">
        <li <if condition="$nav_curr eq 'index'">class="cur"</if> >
          <a href="{:C('ftx_site_url')}">{:L('index_page')}</a>
        </li>
        <volist name="data" id="val">
        <li <if condition="$nav_curr eq $val['alias']">class="cur"</if> ><a href="{$val.link}" <if condition="$val.target eq 1">target="_blank"</if>>{$val.name} <if condition="'1' eq $val['hot']"><span class="hot_icon">HOT</span></if></a></li>
        </volist>
      </ftx:nav>
    </ul>
  </div>
</div>
<div class="mainbody">
  <div class="container">
    <div class="shop">
      <div class="shop-name"><a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '店铺', '{$shop.name}',(new Date().getHours())]);">{$shop.name}</a><span class="click_in" style="margin-left: 50px;"><img src="__STATIC__/assets/pc/images/arrow_left.png" alt="">点击逛店铺</span></div>
      <div class="group">
        <notempty name="shop.seo_desc">
          <div class="desc">
          <p>{$shop.seo_desc}</p>
          <div class="tac mt20">
            <a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '店铺', '{$shop.name}',(new Date().getHours())]);"><img src="http://img03.taobaocdn.com/imgextra/i3/648011753/TB2uqV3cpXXXXasXpXXXXXXXXXX-648011753.png" alt=""></a>
          </div>
        </div>
        </notempty>
        <div class="pic" <empty name="shop.seo_desc">style="float:none;margin-right:0;"</empty>>
          <a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '店铺', '{$shop.name}',(new Date().getHours())]);"><img src="{:attach($shop['img'],"images")}" alt=""></a>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="global-design">
    <div class="container group"> 
    <div class="idea-get">
    <a class="dianj" data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '店铺', '{$shop.name}',(new Date().getHours())]);"><img src="http://img03.taobaocdn.com/imgextra/i3/648011753/TB2kRB5cpXXXXXXXpXXXXXXXXXX-648011753.png"></a>
      <h4>品质保障</h4> 
      <p>所有商品如实描述，全场无假货，如需要开具正规发票，品质护航，购物无忧！</p>    
  </div>
    <div class="idea-get">
    <a class="dianj" data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '店铺', '{$shop.name}',(new Date().getHours())]);"><img src="http://img01.taobaocdn.com/imgextra/i1/648011753/TB2nUN3cpXXXXcqXXXXXXXXXXXX-648011753.png"></a>
      <h4>七天无理由退换货</h4> 
      <p>签收商品后7天内，因主观原因不愿完成交易，可享受“7天无理由退换货”服务！</p>    
  </div>
    <div class="idea-get we-get-grid">
    <a class="dianj" data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '店铺', '{$shop.name}',(new Date().getHours())]);"><img src="http://img02.taobaocdn.com/imgextra/i2/648011753/TB2qfaXcpXXXXXaXXXXXXXXXXXX-648011753.png"></a>
      <h4>更多特色服务</h4> 
      <p>全程保障您的支付和商品安全，专属用户定制特色服务，严格执行售后及保修政策！</p>
  </div>
  </div>
</div>

<script>
  $(function(){
    var bg = "bg1,bg2,bg3".split(",");
    $(".mainbody").addClass(_.sample(bg));
  });
  $(function(){
    
    var click_in = $(".click_in");

    function ml(){
      click_in.animate({marginLeft:20},500,function(){
        setTimeout(mr,1000);
      });
    }
    function mr(){
      click_in.animate({marginLeft:50},200,function(){
        ml();
      });
    }
    ml();
  });
</script>
<include file="public:footer" />
</body>
</html>