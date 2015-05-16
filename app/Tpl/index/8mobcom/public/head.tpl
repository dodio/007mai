<meta charset="utf-8" />
<title>{$page_seo.title} — {:C('ftx_site_name')}</title>
<meta name="keywords" content="{$page_seo.keywords}" />
<meta name="description" content="{$page_seo.description}" />
<meta name="renderer" content="webkit">
<meta name="MSSmartTagsPreventParsing" content="True" />
<meta http-equiv="MSThemeCompatible" content="Yes" />
<script type="text/javascript" src="__STATIC__/8mobcom/js/uaredirect.js"></script>
<script type="text/javascript">
  uaredirect("http://m.007mai.com");
	SITEURL="{:C('ftx_site_url')}";
	CURURL="{:C('ftx_site_url')}";
	WEBNICK="{:C('ftx_site_name')}";
	URL_COOKIE=0;
</script>
<ftx:load type="css" href="
__STATIC__/8mobcom/css/base.css,
__STATIC__/8mobcom/css/global.css,
__STATIC__/8mobcom/css/alert.css,
__STATIC__/8mobcom/css/page.css,
__STATIC__/8mobcom/css/ad.css
"/>

<script type="text/javascript" src="__STATIC__/8mobcom/js/jquery.js"></script>
<script type="text/javascript" src="__STATIC__/8mobcom/js/jquery.cookie.js"></script>
<script type="text/javascript" src="__STATIC__/8mobcom/js/lazyload.js"></script>
<script type="text/javascript" src="__STATIC__/8mobcom/js/fun.js"></script>
<script type="text/javascript" src="__STATIC__/8mobcom/js/jumpbox.js"></script>
<script type="text/javascript" src="__STATIC__/8mobcom/js/funs.js"></script>
{:C('ftx_header_html')}
<script language="javascript">window.onerror = function(){return true;}</script>
<if condition="C('ftx_site_style') eq 'juanpi'">
<link rel=stylesheet type=text/css href="__STATIC__/8mobcom_jp/css/base.css" />
<elseif condition="C('ftx_site_style') eq 'zhe800'" />
<link rel=stylesheet type=text/css href="__STATIC__/8mobcom_zhe/css/base.css" />
<elseif condition="C('ftx_site_style') eq 'jky'" />
<link rel=stylesheet type=text/css href="__STATIC__/8mobcom_jky/css/base.css" />
</if>


