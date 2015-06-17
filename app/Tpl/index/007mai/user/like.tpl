<!doctype html>
<html>
<head>
<include file="public:head" />
</head>
<body>
<include file="public:topbar" />
<include file="public:header" />
<div class="jiu-nav container  seclevelinner main-ftxiacom group">
            <div class="main-fanli main-my-like">
                <h3 class="title">我的收藏<em class="number">(共{$like_count}件商品)</em></h3>
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
		</empty>
</div>  
</div>

<script>
  window.sidenav_fix =  300;
</script>
<include file="public:sidenav" />

<include file="public:list" />


<include file="public:footer" />
</body>
</html>