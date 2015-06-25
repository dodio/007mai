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
<script>
  window.sidenav_fix =  300;
</script>

<include file="public:sidenav" />

<div class="container mt20 group">
    <div class="main-my-like group">
      <eq name="like_count" value="0">
        <h3 class="title">您还没有收藏任何宝贝!</h3>
      <else/>
        <h3 class="title">我的收藏<em class="number">(共{$like_count}件商品)</em></h3>
      </eq>
      <span class="like-line"></span>
      <empty name="items_list"> 
        <div class="like-tips">
            <div class="like-tips-img like-tips-img_1">
              <span class="like-con">
                  <p class="like-t">收藏的宝贝不能让它溜走!</p>
                  <p>点击<em><img src="__STATIC__/images/heart-tips.gif"></em>收起来，登录后会实时提醒商品优惠，永远不丢失哦！</p>
              </span>
            </div>
          </div>
        <else/>
          <include file="index:item-list" />
      </empty>
    </div>

</div>

<include file="public:footer" />
</body>
</html>