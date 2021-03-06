<include file="public:header" />
<!--清理缓存-->
<div class="subnav">
	<div class="content_menu ib_a blue line_x">
		<a class="on"><em>{:L('clear_cache')}</em></a>
	</div>
</div>
<div class="common-form pad_lr_10">
	<form id="info_form" action="{:u('cache/clear')}" method="post">
		<table width="100%" cellpadding="2" cellspacing="1" class="table_form">

			<thead>
				<tr>
					<th width="3%" align="left"><input type="checkbox" name="checkall" class="J_checkall"/></th>
					<th width="40%" align="left">缓存目录</th>
					<th width="20%" align="left">描述</th> 
					<th width="37%" align="left">说明</th> 
				</tr>
			</thead>

			<tr>
				<td width="10"><label><input type="checkbox" value="field" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'field'))}"> </label></td>
				<td width="120"><img src="/static/images/admin/folde.gif" width="16" height="14"> data/runtime/Data/_fields </td>
				<td>{:L('field_cache')}</td>
				<td><span class="gray mr10">{:L('field_cache_desc')}</span><span id="field_ifm"></span></td>
			</tr>
			<tr>
				<td><label><input type="checkbox" value="tpl" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'tpl'))}"></label></td>
				<td><img src="/static/images/admin/folde.gif" width="16" height="14"> data/runtime/Cache </td>
				<td> {:L('tpl_cache')}</td>
				<td><span class="gray mr10">{:L('tpl_cache_desc')}</span><span id="tpl_ifm"></span></td>
			</tr>
			<tr>
				<td><label><input type="checkbox" value="data" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'data'))}"></label></td>
				<td><img src="/static/images/admin/folde.gif" width="16" height="14"> data/runtime/Data </td>
				<td> {:L('data_cache')}</td>
				<td><span class="gray mr10">{:L('data_cache_desc')}</span><span id="data_ifm"></span></td>
			</tr>
      <tr>
        <td><label><input type="checkbox" value="shop" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'shop'))}"></label></td>
        <td><img src="/static/images/admin/folde.gif" width="16" height="14"> data/runtime/Data/shop </td>
        <td>店铺数据缓存</td>
        <td><span class="gray mr10">添加或者删除过店铺数据清除后更新</span><span id="shop_ifm"></span></td>
      </tr>
			<tr>
				<td><label><input type="checkbox" value="runtime" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'runtime'))}"> </label></td>
				<td><img src="/static/images/admin/folde.gif" width="16" height="14"> data/runtime/~runtime.php </td>
				<td>{:L('runtime_cache')}</td>
				<td><span class="gray mr10">{:L('runtime_cache_desc')}</span><span id="runtime_ifm"></span></td>
			</tr>
			<tr>
				<td><label><input type="checkbox" value="logs" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'logs'))}"></label></td>
				<td><img src="/static/images/admin/folde.gif" width="16" height="14"> data/runtime/Logs</td>
				<td> {:L('logs_cache')}</td>
				<td><span class="gray mr10">{:L('logs_cache_desc')}</span><span id="logs_ifm"></span></td>
			</tr>
			<tr>
				<td><label><input type="checkbox" value="js" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'js'))}"> </label></td>
				<td><img src="/static/images/admin/folde.gif" width="16" height="14">public/static/dist_js</td>
				<td>JS缓存文件</td>
				<td><span class="gray mr10">修改过JS文件需要清除缓存才会生效</span><span id="js_ifm"></span></td>
			</tr>

      <tr>
        <td><label><input type="checkbox" value="css" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'css'))}"> </label></td>
        <td><notempty name="combile_css_dirs">
            <volist name="combile_css_dirs" id="dir"><img src="/static/images/admin/folde.gif" width="16" height="14">{$dir}/dist_css<br></volist>
          </notempty></td>
        <td>CSS缓存文件</td>
        <td><span class="gray mr10">修改过CSS文件需要清除缓存才会生效</span><span id="css_ifm"></span></td>
      </tr>

			<tr>
				<td><label><input type="checkbox" value="api" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'api'))}"> </label></td>
				<td><img src="/static/images/admin/folde.gif" width="16" height="14"> data/runtime/FtxiaAPI</td>
				<td>飞天侠API缓存</td>
				<td><span class="gray mr10">清空飞天侠开放平台API缓存文件</span><span id="api_ifm"></span></td>
			</tr>

			<tr>
				<td><label><input type="checkbox" value="taobao" name="type" class="mr5" data-uri="{:U('cache/clear', array('type'=>'taobao'))}"> </label></td>
				<td><img src="/static/images/admin/folde.gif" width="16" height="14"> data/runtime/TaobaoAPI</td>
				<td>淘宝API缓存</td>
				<td><span class="gray mr10">清空阿里妈妈API缓存文件</span><span id="taobao_ifm"></span></td>
			</tr>
            <tr>
            	<th></th>
                <td><input type="button" id="J_clear_cache" class="smt mr10" value="{:L('clear')}"/></td>
                <td></td>
            </tr>
		</table>
	</form>
</div>
</div>
<include file="public:footer" />
<script>
$(function(){
    $('#J_clear_cache').live('click', function(){
        $('input[name="type"]:checked').each(function(){
            var type = $(this).val();
                uri = $(this).attr('data-uri');
            $('#'+type+'_ifm').html(lang.clear_wait);
            $.getJSON(uri, {type:type}, function(result){
                $('#'+type+'_ifm').addClass('onCorrect').html(lang.clear_success);
            });
        });
    });

    $(".J_checkall").click(function(){
				$('input[name="type"]').attr('checked', this.checked);
    })
});
</script>
</body>
</html>