<div class="container" style="_position:relative;">
	<div class="fix-right-layer" id="fix-right-layer" style="right: 0px;">
	    <div class="fix-right-body">
	        <div class="fix-right-middle" style="overflow: visible; display: block;">
	            
                <notempty name="visitor">
                    <div class="avatar">
                        <a href="{:U('user/index')}" target="_blank">
                        <img src="{:avatar($info['id'], 32)}" alt="">
                        </a>
                    </div>
                  <div class="fix-uinfo mt20">现有<br><em>{$visitor.score}</em><br>情报</div>
                <else/>
                <div class="img-span">
                        <a href="{:U('user/index')}" target="_blank" class="mark" title="会员中心">
                            <img src="__STATIC__/assets/pc/images/layout/my.png">
                        </a>
                        <div class="tab-bar tab-bar-js" style="display:none;">登录<div class="tab-tip-arr">◆</div></div>
                    </div>
                </notempty>

	        </div>
            <div class="fix-right-bottom">
                <div class="img-span">
                    <a href="javascript:void(0);" class="sign sign_btn">
                        <img src="__STATIC__/assets/pc/images/layout/sign.gif" style="margin-left: 10px;">
                    </a>
                    <div class="tab-bar tab-bar-js" style="display: none;">签到得情报<div class="tab-tip-arr">◆</div></div>
                </div>
                
                <if condition="C('ftx_site_browser') neq ''">
                    <div class="img-span">
                        <a href="javascript:void(0);">
                            <img src="__STATIC__/assets/pc/images/layout/qrcode.png">
                        </a>
                        <div class="qrcode-tab-bar tab-bar-js" style="display: none;">
                            <img src="{:C('ftx_site_browser')}" width="140px">
                        </div>
                    </div>
                </if>
                
                <div class="img-span">
                    <a href="{:C('ftx_kefu_html')}" target="_blank" rel="nofollow">
                        <img src="__STATIC__/assets/pc/images/layout/qq.png">
                    </a>
                    <div class="tab-bar tab-bar-js" style="display:none;"><a href="http://tieba.baidu.com/f?kw=007%E4%B9%B0" target="_blank">官方贴吧</a></div>
                </div>
                <div class="img-span">
                    <div id="gotop" class="gotop" style="display: block;">
	                    <a href="javascript:void(0);">
	                        <img src="__STATIC__/assets/pc/images/layout/gotop.png">
	                    </a>
                    </div>
                    <div class="tab-bar tab-bar-js" style="display:none;">返回顶部<div class="tab-tip-arr">◆</div></div>
                </div>
            </div>
            
	    </div>
	</div>
</div>
<script>

    $(function(){
        var rightbar = $("#fix-right-layer");
        var width = rightbar.width();
        $.scrollManager.add({
          up:function(){
            rightbar.animate({right:0},300);
          },
          down:function(){
            rightbar.animate({right:-width},300);
          }
        });

          //右侧窗口侧边栏会员中心按钮,检测是否登录
        $('.mark',rightbar).bind('click', function(){
            if(!$.ftxia.dialog.islogin()) return !1;
        });

        /* 右侧浮动层*/
        $('.img-span',rightbar).hover(function(){
            var bar = $(this).find(".tab-bar-js");
            bar.css('right','90px').show().animate({right:"50px"},500);
        },function(){
           $(this).find(".tab-bar-js").hide();
        });
        $('.gotop',rightbar).click(function() {$("html, body").animate({ scrollTop: 0 }, 120);});
    });

</script>