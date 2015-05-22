<!-- 头部开始 -->
<div id="toolbar">
    <div class="bar-con  {:C('ftx_site_width')}">

	<ul class="topNav fl">
		<li style="border:none;">上007买,东西很好买</li>
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
			function topHtml() {/*
			<div class="logined-show">
				<a id="{:U('user/index')}" href="{:U('user/index')}" class="normal-a"><span class="user"><literal>{$name}</literal></span><em class="cur"></em></a>
				<div class="normal-box login-box">
					<ul>
						<li><a href="{:U('user/gift')}"><i class="icon icon-02"></i><span>我的订单</span></a></li>
						<li><a href="{:U('user/index')}"><i class="icon icon-03"></i><span>账号设置</span></a></li>
						<li><a href="{:U('user/logout')}" class="exit" ><i class="icon icon-04"></i><span>退出</span></a></li>
					</ul>
				</div>
			</div>
			<div class="personal-show">
				<a href="{:U('user/mingxi')}"><span>账户明细</span></a>
				<a href="{:U('user/gift')}"><span>我的订单</span></a>
				<p class="info fr ffv"><a href="{:U('user/msg')}"><literal>{$msgsrc}</literal></a></p>
				<em class="count" style="display: none;">0</em></a>　|
			</div>
			<div class="other-show"><a href="{:C('ftx_kefu_html')}" target="_blank" rel="nofollow">在线客服</a></div>*/;}
				$.ajax({
					url: '{:U('ajax/userinfo')}',
					dataType:'jsonp',
					jsonp:"callback",
					success: function(data){
						if(data.s==1){
							topHtml=getTplObj(topHtml,data.user);
							$('#right-show').html(topHtml).show();
						}
						else{
							$('#right-show').show();
						}
					}
				});
			</script>

    </div>
</div>
<div class="header">
    <div class="area {:C('ftx_site_width')}">
        <div class="logo">
		<if condition="C('ftx_site_logo') neq ''">
			<h1 class="fl"><a title="{:C('ftx_site_name')}" href="{:C('ftx_site_url')}"><img src="{:C('ftx_site_logo')}" width="238" height="50" /></a></h1>
		<else />
			<h1 class="fl"><a title="{:C('ftx_site_name')}" href="{:C('ftx_site_url')}"><img src="/static/8mobcom/images/logo.png" width="238" height="50" /></a></h1>
		</if>

        </div>
        <div class="protection">
            <a title="每天22点开抢" class="update"   target="_blank"></a>
            <a title="职业买手砍价" class="lowest"  target="_blank"></a>
            <a title="商品验货质检" class="check"   target="_blank"></a>
        </div>
              <div class="search">
                <form method="get" action="/index.php" onsubmit="return search_submit();" >
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
        <div class="nav {:C('ftx_site_width')}">
            <ul class="navigation fl">
		<li class="<if condition="$nav_curr eq 'index'">current</if>   ">
			<a href="{:C('ftx_site_url')}">{:L('index_page')}</a>
			<div class="all-classify">
                    <dl>
                        <dd><a href="{:U('index/cate',array('cid'=>1))}"><i class="fushi"></i><span>女装</span></a><a href="{:U('index/cate',array('cid'=>3))}"><i class="jujia"></i><span>居家</span></a></dd>
                            <dd><a href="{:U('index/cate',array('cid'=>4))}"><i class="muying"></i><span>母婴</span></a><a href="{:U('index/cate',array('cid'=>7))}"><i class="meishi"></i><span>美食</span></a></dd>
                            <dd><a href="{:U('index/cate',array('cid'=>5))}"><i class="xiebaopeishi"></i><span>配饰</span></a><a href="{:U('index/cate',array('cid'=>9))}"><i class="meizhuang"></i><span>美妆</span></a></dd>
                            <dd><a href="{:U('index/cate',array('cid'=>8))}"><i class="shuma"></i><span>数码</span></a><a href="{:U('index/cate',array('cid'=>10))}"><i class="wenti"></i><span>文体</span></a></dd>
                        </dl>
                    </div>
		
		</li>
		<ftx:nav type="lists" style="main">
			<volist name="data" id="val">
			<li class="  <if condition="$nav_curr eq $val['alias']">current</if>"><a href="{$val.link}" <if condition="$val.target eq 1">target="_blank"</if>>{$val.name}</a></li>
			</volist>
		</ftx:nav>

            </ul>
            <div class="state-show fr">
              <a href="javascript:;" class="dosign signin_a sign_btn" id="signIn_btn"></a>
              <a href="{:U('gift/index')}" target="_blank" class="mr20 btn_jfsc">积分商城</a> 
                <div style="display: none;" class="normal-side-box" id="top-side-box">
                    <div class="box-tips">
                        <p class="text">我的情报：</p>
                        <p class="other"> <a target="_blank" href="{:U('user/mingxi')}">我的积分</a>　｜　<a target="_blank" href="{:U('gift/index')}">积分商城</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

 
<!--OLD头部结束-->

 