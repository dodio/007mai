<notempty name="visitor">
    <?php dump($visitor); ?>
<if condition="$visitor['rights']['admin_item'] eq true">
<script type="text/javascript">
    $(function(){
        $('.item').append('<a href="javascript:" class="btn_hide">隐藏该宝贝</a>');
        $(".itemlist").on("click",'.btn_hide',function(){
            var _self = $(this);
            id =_self.parent('.item').attr("data-nid");
            if(!$.ftxia.dialog.islogin()) return ;
            _self.html('<img src="__STATIC__/assets/images/loading.gif" />');
            $.ajax({
                url: FTXIAER.root + '/?m=ajax&a=noshow',
                    type: 'POST',
                    data: {
                        id: id
                    },
                dataType: 'json',
                success: function(result){
                    if(result.status == 1){
                        if(result.msg.isshow){
                            _self.html('已取消');
                        }else{
                            _self.html('缓存到期后隐藏');
                        }
                    }else{
                        _self.html('操作失败');
                        $.ftxia.tip({content:result.msg, icon:'error'});
                    }
                }
            });
        });
    });
</script>
</if>
</notempty>
<!-- 页脚 -->

<div class="footer">
    <div class="container group">
      <div class="help-group">
        <div class="help-icon icon"></div>
        <div class="help-topic">了解007买</div>
        <div class="help-item"><a href="/help/aboutus" target="_blank">关于我们</a></div>
        <div class="help-item"><a href="/help/disclaimer" target="_blank">免责申明</a></div>
        <div class="help-item"><a href="/help/question" target="_blank">常见问题</a></div>
        <div class="help-item highlight"><a href="/help/qingbao" target="_blank">情报规则</a></div>
        <div class="help-item highlight"><a href="/help/exchange" target="_blank">兑换流程</a></div>
      </div>

      <div class="help-group">
        <div class="help-icon icon"></div>
        <div class="help-topic">商家合作</div>
        <div class="help-item"><a href="/help/seller" target="_blank">商家合作</a></div>
      </div>

      <div class="help-group">
        <div class="help-icon icon"></div>
        <div class="help-topic">会员服务</div>
        <div class="help-item"><a href="/user/login" target="_blank">用户登录</a></div>
        <div class="help-item"><a href="/user/register" target="_blank">注册</a></div>
        <div class="help-item"><a href="/forget" target="_blank">找回密码</a></div>
      </div>
    </div>
    <div class="container mt30 copyright">
    	<p class="f_miibeian tac page007mai"><a href="http://www.miibeian.gov.cn/" rel="nofollow" target="_blank">{:C('ftx_site_icp')}</a> © 2010-2015 007mai.com all Rights Reserved
		{:C('ftx_statistics_code')} <a href="/sitemap" target="_blank">网站地图</a>
		</p>
    </div>
  </div>

<!-- /页脚 -->
<include file="public:fix-right-layer" />
<!--淘点金开始-->

<script type="text/javascript">
    (function(win,doc){
        var s = doc.createElement("script"), h = doc.getElementsByTagName("head")[0];
        if (!win.alimamatk_show) {
            s.charset = "gbk";
            s.async = true;
            s.src = "http://a.alimama.cn/tkapi.js";
            h.insertBefore(s, h.firstChild);
        };
        var o = {
            pid: "{$taodianjin_pid}",/*推广单元ID，用于区分不同的推广渠道*/
            appkey: "",/*通过TOP平台申请的appkey，设置后引导成交会关联appkey*/
            unid: "",/*自定义统计字段*/
            type: "click" /* click 组件的入口标志 （使用click组件必设）*/
        };
        win.alimamatk_onload = win.alimamatk_onload || [];
        win.alimamatk_onload.push(o);
    })(window,document);
</script>

<!--淘点金结束-->
<script type="text/javascript">
var FTXIAER = {
    root: "__ROOT__",
		site: "{:C('ftx_site_url')}",
    uid: "{$visitor['id']}", 
    url: {}
};
var lang = {};
<volist name=":L('js_lang')" id="val">lang.{$key} = "{$val}";</volist>
</script>
<ftx:load type="js" href="
__STATIC__/js/jquery/plugins/formvalidator.js,
__STATIC__/js/ftxia.js,
__STATIC__/js/front.js,
__STATIC__/js/dialog.js,
__STATIC__/js/item.js,
__STATIC__/js/user.js
" />
<ftx:load type="js" href="
__STATIC__/assets/js/common/comm.js,
__STATIC__/assets/js/lib/jumpbox.js
"/>
