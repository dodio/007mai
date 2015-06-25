<div class="topbar group">
          <div id="login-show" class="login-show fl">
            <volist name="oauth_list" id="val">
              <a href="{:U('oauth/index', array('mod'=>$val['code']))}" target="_blank"><?php if ($val['code']=="qq"): ?>
                <img src="__STATIC__/assets/images/icon_qqlogin.png" alt="">
              <?php endif ?></a>
            </volist>
            <a href="/user/login" target="_blank">登录</a>
            <a href="/user/register" target="_blank">免费注册</a>
          </div>
          <ftx:nav type="lists" style="top">
            <notempty name="data">
              <div class="other-show fl">
                <volist name="data" id="val">
                <a href="{$val.link}" <if condition="$val.target eq 1">target="_blank"</if>>{$val.name}</a>
                </volist>
              </div>
            </notempty>
          </ftx:nav>
         <script>
          $(function(){
            var html= "<div id=\"logined-show\" class=\"logined-show fl\"> "
        +  "<a href=\"{:U('user/index')}\" class=\"normal-a\" id=\"{:U('user/index')}\"><span class=\"user\"><literal>{$name}</literal></span><em class=\"cur\"></em></a>"
        + "          <div class=\"normal-box login-box\">"
        + "            <ul>"
        + "              <li><a href=\"{:U('user/gift')}\"><i class=\"icon icon-02\"></i><span>我的订单</span></a></li>"
        + "              <li><a href=\"{:U('user/info')}\"><i class=\"icon icon-03\"></i><span>账号设置</span></a></li>"
        + "              <li><a href=\"{:U('user/like')}\"><i class=\"icon icon-01\"></i><span>我的收藏</span></a></li>"
        + "              <li><a href=\"{:U('user/logout')}\" class=\"exit\" ><i class=\"icon icon-04\"></i><span>退出</span></a></li>"
        + "            </ul>"
        + "          </div>"
        + "        </div>"
        + "        <div class=\"personal-show mr15\">"
        + "          <a href=\"{:U('user/mingxi')}\"><span>账户明细</span></a>"
        + "           <a class=\"ml10\" title=\"消息\" href=\"{:U('user/msg')}\"><literal>{$msgsrc}</literal></a>"
        + "        </div>"
        + " </div>";

            $.MAI007.data.getUserinfo().done(function(data){
                if(data.s==1){
                  tpl = _.template(html);

                  $('#login-show').replaceWith(tpl(data.user)).show();
                }else{
                  $('#login-show').show();
                }
              });
          });
        </script>
        </div>