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
  <include file="index:item-list" />
  <script>
    $(function(){
      $(".item").addClass("show-hover show-flypic");
    });
  </script>
</div>

<include file="public:footer" />
</body>
</html>