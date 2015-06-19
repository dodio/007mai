<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/qingbao.css
"/>
<block name="head">
  <style>
    body{
      background-color: #F9F6F5;
    }
  </style>
</block>
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />


<include file="subnav"/>
<include file="public:sidenav" />

<block name="banner">
  <div class="container">
    <div class="qinglv_pic" style="width: 100%;height: 205px;background:url(__STATIC__/images/qinglv.png) 0 0 no-repeat;"></div>
  </div>
</block>

<div class="container mt20 group">
  <foreach name="item_groups" key="cate_id" item="items_list">
  <?php 
  $cate = $cate_data[$cate_id];
  $items_list = array_slice($items_list, 0,8);
  ?>
  
    <div id="q_{$cate.id}" class="title_bar">
      <h2>{$cate.name}</h2>
      <a href="<block name="more_url">/index.php?m=search&a=index&key=情侣</block>{$cate.name}" target="_blank" class="more">更多</a>
    </div>

    <include file="index:item-list"/>

  </foreach>

  <script>
    $(function(){
      $(".item").addClass('show-hover show-flypic');
    });
  </script>
</div>
 
<include file="public:footer" />
</body>
</html>