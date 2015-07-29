<!DOCTYPE html>
<html lang="en">
<head>
  <include file="public:head" />
  <script>
    window.$ = undefined;
    window.Zepto = undefined;
  </script>
  <script src="__STATIC__/assets/mobile/js/zepto.1.8.min.js"></script>
  <script>
  window.$ = Zepto;
  var _czc = _czc || [];
  </script>
  <style>
  body{
    background:#000 url("__STATIC__/assets/images/bg/footer_lodyas.png");
    font-family: "微软雅黑";
  }
  .layout{
    color: #fff;
    font-size: 24px;
    text-align: center;
    position: absolute;
    top: 40%;
    width: 100%;
    padding: 10px 0;
    border-top: 2px solid #bbb;
    border-bottom: 2px solid #bbb;
  }
  .layout a{
    color: #fff;
  }
  .no_need{
    position: fixed;
    bottom: 0;
    border-top: 1px solid #4D4D4D;
    height: 40px;
    line-height: 40px;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.38);
  }
  .nav{
    position: fixed;
    top: 0;
    border-bottom: 1px solid #4D4D4D;
    height: 30px;
    line-height: 30px;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.38);
  }
  .nav a{
    margin: 0 10px;
    color: #fff;
  }
  .block{
    width: 33%;
    float: left;
    height: 100%;
    color: #fff;
    text-align: center;
  }
  .block img{
    height: 20px;
    vertical-align: middle;
    margin-right: 5px;
  }
  </style>
</head>
<body>
  <div class="nav">
    <a href="http://temai.m.taobao.com/cheap.htm?pt=1&pid=mm_110720202_10278645_34550205" target="_blank">9.9包邮</a>
    <a href="http://ai.m.taobao.com/bu.html?id=1&pid=mm_110720202_10278645_34550205" target="_blank">天天特价</a>
    <a href="http://s.click.taobao.com/t?e=m%3D2%26s%3DTQF%2Bj7UW4uwcQipKwQzePCperVdZeJviEViQ0P1Vf2kguMN8XjClAs8VvQiNEO%2FlNPiTe99ZiioZxBy11dmGfVFhtOZK2Oeim6mwYXo14qHTdn1WbKctLab6h%2BauVgdyCEDNGBpwx5jlSg55GVX5wUq81chpYDA%2BKjFpBRN4HNEQpQHQByQbSVnSsMe4z%2FjMXC7kBqIO%2BKFqN6boZkper2yRRiHl3Da8" target="_blank">品牌团</a>
    <a href="http://ai.m.taobao.com/channel.html?id=1&pid=mm_110720202_10278645_34550205" target="_blank">母婴玩具</a>
  </div>
<div class="layout"><a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '店铺', '{$shop.name}',(new Date().getHours())]);">触摸去"{$shop.name}"店铺</a></div>
<div class="no_need">
  <div class="block"><img src="http://img03.taobaocdn.com/imgextra/i3/648011753/TB2kRB5cpXXXXXXXpXXXXXXXXXX-648011753.png" alt="">品质保障</div>
  <div class="block"><img src="http://img01.taobaocdn.com/imgextra/i1/648011753/TB2nUN3cpXXXXcqXXXXXXXXXXXX-648011753.png" alt="">七天退换货</div>
  <div class="block"><img src="http://img02.taobaocdn.com/imgextra/i2/648011753/TB2qfaXcpXXXXXaXXXXXXXXXXXX-648011753.png" alt="">实物拍摄</div>
</div>

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
<div style="display:none"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1255103351'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1255103351' type='text/javascript'%3E%3C/script%3E"));</script></div>
<script>
  
  $(function(){
    var l = $(".layout")
    function fadeOut(){
      l.animate({opacity:0.5},1000,'ease-out');

      setTimeout(fadeIn,1100);
    }

    function fadeIn(){
      l.animate({opacity:1},1000);
      setTimeout(fadeOut,1100);
    }
    fadeOut();
  });
</script>
</body>
</html>
