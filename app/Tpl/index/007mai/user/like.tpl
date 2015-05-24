<!doctype html>
<html>
<head>
<include file="public:head" />
</head>
<body>
<include file="public:header" />
<div class="jiu-nav {:C('ftx_site_width')}  seclevelinner main-ftxiacom clear">
            <div class="main-fanli main-my-like">
                <h3 class="title">我的收藏<em class="number">(共{$like_count}件商品)</em></h3>
                <span class="like-line"></span>
		<empty name="items_list"> 
		<div class="like-tips">
              		<div class="like-tips-img like-tips-img_1">
              			<span class="like-con">
                  			<p class="like-t">收藏的宝贝不能让它溜走!</p>
                  			<p>点击<em><img src="/static/images/heart-tips.gif"></em>收起来，登录后会实时提醒商品优惠，永远不丢失哦！</p>
                		</span>
             		</div>
          	</div>
		</empty>


            </div>  
</div>
 
<include file="public:nav-classify" />

<div class="side_nav_fix_pos"></div>
<include file="public:list" />
 <style>
  .widescreen{
    display: none;
  }
 </style>

<include file="public:footer" />
</body>
</html>