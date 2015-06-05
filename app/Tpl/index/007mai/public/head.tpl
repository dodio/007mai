<meta charset="utf-8" />
<title>{$page_seo.title} — {:C('ftx_site_name')}</title>
<meta name="keywords" content="{$page_seo.keywords}" />
<meta name="description" content="{$page_seo.description}" />
<meta name="renderer" content="webkit">
<meta name="MSSmartTagsPreventParsing" content="True" />
<meta http-equiv="MSThemeCompatible" content="Yes" />
<meta name="viewport" content="width=device-width,minimum-scale=1,maximum-scale=1">
<script type="text/javascript" src="__STATIC__/assets/js/common/uaredirect.js"></script>
<script type="text/javascript">
  uaredirect("http://m.007mai.com");
	SITEURL="{:C('ftx_site_url')}";
	CURURL="{:C('ftx_site_url')}";
	WEBNICK="{:C('ftx_site_name')}";
  CDN_ROOT = '<?php echo CDN_ROOT; ?>';
	URL_COOKIE=0;
  var _czc = _czc || [];
</script>
<ftx:load type="css" href="
__STATIC__/assets/css/base.css,
__STATIC__/assets/css/global.css,
__STATIC__/assets/css/alert.css,
__STATIC__/assets/css/page.css,
__STATIC__/assets/css/ad.css,
__STATIC__/assets/css/jiu-side-nav.css,
__STATIC__/8mobcom_zhe/css/base.css
"/>


<ftx:load type="js" href="
__STATIC__/assets/js/jquery/jquery.js,
__STATIC__/assets/js/jquery/jquery.cookie.js,
__STATIC__/assets/js/jquery/lazyload.js
"/>
<script>
  // 兼容各个屏幕的js media query 兼容麻烦
(function(){
  function adaptscreen(){
    var width = $(window).width();
    if(width<=1440){
      $("html").addClass("w1005");
    }else{
      $("html").removeClass("w1005");
    }
  }
  $(window).resize(adaptscreen);
  adaptscreen();
})();
</script>
<ftx:load type="js" href="
__STATIC__/assets/js/lib/funs.js,
__STATIC__/assets/js/lib/underscore.js,
__STATIC__/assets/js/base/settings.js,
__STATIC__/assets/js/base/MAI007.js,
__STATIC__/assets/js/lib/placeholder.js
"/>
{:C('ftx_header_html')}
<script language="javascript">window.onerror = function(){return true;}</script>


