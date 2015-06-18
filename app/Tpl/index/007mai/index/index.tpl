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

 <div class="container mt20">
    <div class="chao-title"><div class="chao-title-text">热门品牌</div></div>
    <include file="brand:brand-list"/>
  </div>


<div class="container">
    <div class="baokuan">
      <div class="bk-top group">
        <h2>十件爆款</h2>
        <div class="bk-label"></div>
        <div class="bk-nav">
          <a href="/ba" target="_blank">八块八</a>
          <a href="/shiba" target="_blank">十八块八</a>
        </div>
      </div>
      <include file="public:baokuan_list" />
   </div>
</div>


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
</body>
</html>