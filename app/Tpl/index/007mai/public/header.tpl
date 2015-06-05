<!-- 头部开始 -->
<div id="toolbar">
    <div class="bar-con  page007mai">

	<ul class="topNav fl">
    <ftx:nav type="lists" style="top">
      <volist name="data" id="val">
      <li><a href="{$val.link}" <if condition="$val.target eq 1">target="_blank"</if>>{$val.name}</a></li>
      </volist>
    </ftx:nav> 
  </ul>
        
    <div class="right-show fr" id="right-show">
  		<div class="union-login">
  			<volist name="oauth_list" id="val">
  				<a href="{:U('oauth/index', array('mod'=>$val['code']))}">{$val.name}</a>
  			</volist>　|
  		</div>
  		<div class="login-show">
  			<a href="{:U('user/login')}">登录</a>
  			<a href="{:U('user/register')}">免费注册</a>　|
  		</div>
  		<div class="other-show">
  			<a href="{:C('ftx_kefu_html')}" target="_blank" rel="nofollow">在线客服</a>
  		</div>
  	</div>

	<script>
      $(function(){
        var html= "<div class=\"logined-show\">"
+ "          <a href=\"{:U('user/index')}\" class=\"normal-a\" id=\"{:U('user/index')}\"><span class=\"user\"><literal>{$name}</literal></span><em class=\"cur\"></em></a>"
+ "          <div class=\"normal-box login-box\">"
+ "            <ul>"
+ "              <li><a href=\"{:U('user/gift')}\"><i class=\"icon icon-02\"></i><span>我的订单</span></a></li>"
+ "              <li><a href=\"{:U('user/info')}\"><i class=\"icon icon-03\"></i><span>账号设置</span></a></li>"
+ "              <li><a href=\"{:U('user/logout')}\" class=\"exit\" ><i class=\"icon icon-04\"></i><span>退出</span></a></li>"
+ "            </ul>"
+ "          </div>"
+ "        </div>"
+ "        <div class=\"personal-show\">"
+ "          <a href=\"{:U('user/mingxi')}\"><span>账户明细</span></a>"
+ "          <p class=\"info fr ffv\"><a href=\"{:U('user/msg')}\"><literal>{$msgsrc}</literal></a></p>"
+ "          <em class=\"count\" style=\"display: none;\">0</em></a>　|"
+ "        </div>"
+ "        <div class=\"other-show\"><a href=\"{:C('ftx_kefu_html')}\" target=\"_blank\" rel=\"nofollow\">在线客服</a></div>";

        $.MAI007.data.getUserinfo().done(function(data){
            if(data.s==1){
              tpl = _.template(html);
              $('#right-show').html(tpl(data.user)).show();
            }
            else{
              $('#right-show').show();
            }
          });
      });
			</script>

    </div>
</div>
<div class="header">
    <div class="area group page007mai">
        <div class="logo fl">
		<if condition="C('ftx_site_logo') neq ''">
			<h1><a title="{:C('ftx_site_name')}" href="{:C('ftx_site_url')}"><img src="{:C('ftx_site_logo')}"/></a></h1>
		<else />
			<h1><a title="{:C('ftx_site_name')}" href="{:C('ftx_site_url')}"><img src="__STATIC__/assets/images/logo.png"/></a></h1>
		</if>

        </div>
        <div class="search fr">
          <form method="get" action="/index.php" target="_blank" onsubmit="return search_submit(this);" >
          <span class="search-area fl search_box">
            <input type="hidden" name="m" value="search" />
            <input type="hidden" name="a" value="index" />
            <input x-webkit-speech name="key" id="keywords" placeholder="请输入您要找的宝贝！" value="" class="txt text" />
          </span>
          <input type="submit" value="" class="smt fr">
          </form>
        </div>
        
    </div>
    
    <div class="mainNav">
        <div class="nav page007mai">
            <ul class="navigation fl">
		<li class="<if condition="$nav_curr eq 'index'">current</if>   ">
			<a href="{:C('ftx_site_url')}">{:L('index_page')}</a>
		</li>
		<ftx:nav type="lists" style="main">
			<volist name="data" id="val">
			<li class="  <if condition="$nav_curr eq $val['alias']">current</if>"><a href="{$val.link}" <if condition="$val.target eq 1">target="_blank"</if>>{$val.name}</a></li>
			</volist>
		</ftx:nav>

            </ul>
            <div class="state-show fr">
              <a href="javascript:;" class="dosign signin_a sign_btn" id="signIn_btn">签到</a>
              <a href="{:U('gift/index')}" target="_blank" class="mr20 btn_jfsc">情报商城</a> 
                <div style="display: none;" class="normal-side-box" id="top-side-box">
                    <div class="box-tips">
                        <notempty name="visitor">
                          <p class="text"><span>我的情报：</span><span class="score mr5">{$visitor.score}</span><em class="icon_zhibi"></em></p>
                        <else />
                          <p class="text"><span>我的情报：</span><a href="{:U('user/login')}" class="score">登录</a>后显示</p>
                        </notempty>
                        <p class="text" id="closest_duihuan"></p>
                        <p class="other"> <a target="_blank" href="{:U('user/mingxi')}">我的情报</a>　｜　<a target="_blank" href="{:U('gift/index')}">情报商城</a> ｜ <a href="/" target="_blank">快速获得情报!</a></p>
                    </div>
                </div>
            </div>
            <script>
              $(function(){
                $.MAI007.data.getUserinfo().done(function(data){
                  if(data.s == 1){
                    //登录获取最接近的礼物商品
                    var user = data.user;
                    $.MAI007.data.getCloseScoreItem().done(function(data){
                      if(data.status == 1 && data.msg){
                        var html = '还差<span class="score ml5">{$(score)}</span><em class="icon_zhibi mr10 ml10"></em>就可以兑换：<br/><a target="_blank" href="/gift/detail/id/{$(id)}.html">{$(title)}</a>';
                        var tpl = _.template(html);
                        var item = {
                          score: data.msg.score - user.jifen,
                          id:data.msg.id,
                          title:data.msg.title
                        }
                        $("#closest_duihuan").html( tpl(item) );
                      }else{
                        var html = "您已经收集了很多情报，快去情报商城兑换吧！";
                        $("#closest_duihuan").html(html);
                      }
                    })
                    //未登录
                  }else{
                    html = "登录以后可以看到，您可以马上兑换什么礼物。";
                    $("#closest_duihuan").html(html);
                  }
                });
                
              });
            </script>
        </div>
    </div>
</div>

 
<!--OLD头部结束-->

 