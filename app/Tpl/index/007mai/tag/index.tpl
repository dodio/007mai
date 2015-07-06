<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/qingbao.css
"/>
</head>
<body>
<?php $seo_keys = explode(",", $tag['seo_keys']); ?>
<include file="public:header" />
<include file="public:sidenav"/>
<div class="container">
  <div class="group mt30">
    <center>
      <a data-type="6" data-tmpl="573x66" data-tmplid="140" data-style="2" data-border="0" biz-s_logo="1" biz-s_hot="1" href="#" rel="nofollow">搜索</a>
    </center>
  </div>
  <div class="mt20">
    <div class="chao-title">
      <div class="chao-title-text">宝贝情报</div>
    </div>
    <div class="group mt20">
      <div class="fl">
        <a data-type="2" biz-keyword="{$name}" data-tmpl="720x220" data-tmplid="209" data-rd="2" data-style="2" data-border="1" href="#" rel="nofollow">{$name}</a>
      </div>
      <div class="fr">
        <?php 
          $key1 = !empty($tag['seo_title']) ? $tag['seo_title'] : array_shift($seo_keys);
         ?>
        <a data-type="2" biz-keyword="{$key1}" data-tmpl="336x280" data-tmplid="53" data-rd="2" data-style="2" data-border="1" href="#">{$key1}</a>
      </div>
    </div> 
  </div>
  
    <notempty name="items_list">
  <div class="mt20 group">
      <div class="chao-title">
        <div class="chao-title-text">本站精选</div>
      </div>

      <include file="index:item-list" />
  </div>
    </notempty>
  
  <volist name="seo_keys" id="val">
  <div class="mt20 group">
    <div class="chao-title">
      <div class="chao-title-text" style="width: 400px;">{$val}本站比价</div>
    </div>
    <div class="group mt20">
      <div class="fl">
        <a data-type="2" biz-keyword="{$val}" data-tmpl="790x675" data-tmplid="176" data-rd="2" data-style="2" data-border="1" href="#">{$val}</a>
      </div>
      <div class="fr">
        <a data-type="2" biz-keyword="{$val}" data-tmpl="300x250" data-tmplid="52" data-rd="2" data-style="2" data-border="1" href="#">{$val}</a>

        <div class="mt30">
          <a data-type="2" biz-keyword="{$val}" data-tmpl="290x380" data-tmplid="10" data-rd="2" data-style="2" data-border="1" href="#">{$val}</a>
        </div>
      </div>
    </div>
  </div>
  </volist>

  <script>
    $(function(){
      $.MAI007.ui.itemEffect.setEffect("缩放");
    });
  </script>
</div>

<include file="public:footer" />
</body>
</html>