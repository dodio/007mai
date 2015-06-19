<script>
  var k = '{$k}';
  var g_curl = 'http://redirect.simba.taobao.com/rd?f=';
  var g_curl_param = '&w=unionapijs&p={$pid}&b=display_601_0_0_0_0&c=cn&pvid=1432407662_159563r2_798586013&k=317b874644f98ccc';
  var g_param = 'http://ai.taobao.com/search/index.htm?key='+ k +'&pid={$pid}&unid=&source_id=tdj_search';
  var g_url = ( g_curl + encodeURIComponent (g_param) + g_curl_param );
  window.location.href=g_url;
</script>