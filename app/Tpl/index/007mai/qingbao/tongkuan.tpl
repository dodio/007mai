<!doctype html>
<html>
<head>
<include file="public:head" />
<ftx:load type="css" href="
__STATIC__/assets/pc/css/qingbao.css
"/>
</head>
<body>

<include file="public:header" />


<div class="container">
  <div class="qinglv_pic" style="width: 100%;height: 205px;background:url(__STATIC__/images/mingxing.png) 0 0 no-repeat;"></div>
</div>
<include file="public:sidenav" />
<div class="container mt20 group">
<include file="index:item-list" />
</div>
<script>
    $(function(){
      $(".item").addClass('show-normal');
    });
</script>
<include file="public:footer" />
</body>
</html>