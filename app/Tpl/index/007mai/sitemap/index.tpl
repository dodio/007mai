<!doctype html>
<html>
<head>
<include file='public:head'/>
</head>
<body data-version="0">

<include file='public:header'/> 
<style>
  h1{
    text-align: center;
    font-size: 24px;
    margin-bottom: 10px;
  }
  h2{
    font-size: 18px;
    margin-bottom: 10px;
  }
  .list{
    line-height: 24px;
    color: #777;
  }
</style>
<div class="container mt20">
  <div class="map-web">
    <h1>网站地图</h1>
    <h2>商品分类</h2>
    <div class="group list">
      <volist name='sitemap' id='val'>
        <a href="{:U('index/cate',array('cid'=>$val['id']))}" target="_blank" class="mr20" hidefocus="true">{$val.name}</a>
      </volist>
    </div>
    <h2 class="mt20">热门标签</h2>
    <div class="group list">
      <volist name='tags' id='val'>
        <a href="{:U('tag/'.$val['name'])}" class="mr20" target="_blank" hidefocus="true">{$val.name}<notempty name="val.seo_title">
          ,{$val.seo_title}
        </notempty></a>
      </volist>
    </div>
    <div class="mt20 container group">
      <include file="public:pagenav"/>
    </div>
    <h2 class="mt20"><strong>007买</strong>文章</h2>
    <div class="group mt20">
      <volist name="arc_list" id="val">
        <a href="{:U('article/read',array('id' =>$val['id'] ))}" class="mr20" target="_blank">{$val.title}</a>
      </volist>
    </div>
    <div class="mt20 container group">
      <?php $page = $a_page; ?>
      <include file="public:pagenav"/>
    </div>
  </div>
</div>

<!--尾部开始--> 
<include file='public:footer'/> 
<!--尾部结束-->
</body>
</html>