<include file='public:head'/>
<load href='__STATIC__/assets/css/pg-map.css' />
</head>
<body data-version="0">
<include file='public:header'/> 
<include file="public:head_nav" />
<div class="clear"></div>
<div class="area" style="margin: 0 auto;display: table;padding-top: 20px;">
  <div class="dealbox">
    <div class="content1">
      <div class="map-web">
        <h1 style='text-align:center;font-size:25px;'>网站地图</h1>
        <h2>商品分类</h2>
        <div class="group">
          <volist name='sitemap' id='val'>
            <a href="{:U('index/cate',array('cid'=>$val['id']))}" class="mr20" hidefocus="true">{$val.name}</a>
          </volist>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="clear"></div>
<!--尾部开始--> 
<include file='public:footer'/> 
<!--尾部结束-->
</body>
</html>