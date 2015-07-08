<include file="public:header" />
<!--商品列表-->
<div class="subnav">
	<div class="content_menu ib_a blue line_x">
    	<a class="add fb " href="{:U('ftxrobots/add_do')}" ><em>添加采集器</em></a>
	<a class="add fb " href="javascript:auto_collect()" ><em>一键开始所有采集</em></a>
	<notempty name="ftxrobots_collect_data"><a class="add fb " href="javascript:jx_collect({$ftxrobots_collect_data.rid},{$ftxrobots_collect_data.p})" ><em>继续所有采集</em></a></notempty>
	<a class="add fb J_showdialog" href="javascript:void(0);" data-uri="{:U('setting/index',array('type'=>'ftxrobots'))}" data-title="采集设置" data-id="add" data-width="520" data-height="80"><em>采集设置</em></a>
	</div>

</div>
<div class="pad_lr_10" >

    <form name="searchform" method="get" >
    <table width="100%" cellspacing="0" class="search_form">
        <tbody>
            <tr>
                <td>
                <div class="explain_col">
            <input type="hidden" name="g" value="admin" />
            <input type="hidden" name="m" value="ftxrobots" />
            <input type="hidden" name="a" value="index" />
            <input type="hidden" name="menuid" value="{$menuid}" />
            分类 :
            <select class="J_cate_select mr10" data-pid="0" data-uri="{:U('items_cate/ajax_getchilds', array('type'=>0))}" data-selected="{$search.selected_ids}"></select>
            <input type="hidden" name="cate_id" id="J_cate_id" value="{$search.cate_id}" />
            &nbsp;&nbsp;关键字 :
            <input name="keyword" type="text" class="input-text" size="25" value="{$search.keyword}" />
            &nbsp;<label>游离采集器：<input type="checkbox" name="nocate" value="1" <if condition="$search.nocate eq 1">checked</if>></label>&nbsp;
            <input type="submit" name="search" class="btn" value="搜索" />         
                </div>
                </td>
            </tr>
        </tbody>
    </table>
    </form>

    <div class="J_tablelist table_list" data-acturi="{:U('ftxrobots/ajax_edit')}">
    <table width="100%" cellspacing="0">
        <thead>
            <tr>
                <th width=25><input type="checkbox" id="checkall_t" class="J_checkall"></th>
                <th><span data-tdtype="order_by" data-field="id">ID</span></th>
                <th align="left"><span data-tdtype="order_by" data-field="name">商品名称</span></th>
                <th width="80"><span data-tdtype="order_by" data-field="cate_id">分类</span></th>
                <th width="80"><span data-tdtype="order_by" data-field="start_price">最低价格</span></th>
                <th width="80"><span data-tdtype="order_by" data-field="end_price">最高价格</span></th>
				<th width="70"><span data-tdtype="order_by" data-field="page">采集页数</span></th>
				<th width="100"><span data-tdtype="order_by" data-field="last_page">上次采集页数</span></th>
                <th width="40"><span data-tdtype="order_by" data-field="ordid">{:L('sort_order')}</span></th>
				<th width="40"><span data-tdtype="order_by" data-field="status">状态</span></th>
                <th width="120"><span data-tdtype="order_by" data-field="last_time">最近时间</span></th>
                <th width="200">{:L('operations_manage')}</th>
            </tr>
        </thead>
    	<tbody>
            <volist name="list" id="val" >
            <tr>
                <td align="center"><input type="checkbox" class="J_checkitem" value="{$val.id}"></td>
                <td align="center">{$val.id}</td>
                <td align="left"><span data-tdtype="edit" data-field="name" data-id="{$val.id}" class="tdedit"  >{$val.name}</span></td>
                <td align="center"><b>{$cate_list[$val['cate_id']]}</b></td>
                <td align="center" class="red"><span data-tdtype="edit" data-field="start_price" data-id="{$val.id}" class="tdedit">{$val.start_price}</span></td> 
                <td align="center" class="red"><span data-tdtype="edit" data-field="end_price" data-id="{$val.id}" class="tdedit">{$val.end_price}</span></td> 
				<td align="center" class="red"><span data-tdtype="edit" data-field="page" data-id="{$val.id}" class="tdedit">{$val.page}</span></td> 
				<td align="center" class="red">{$val.last_page}</td> 
                <td align="center"><span data-tdtype="edit" data-field="ordid" data-id="{$val.id}" class="tdedit">{$val.ordid}</span></td>
				<td align="center"><img data-tdtype="toggle" data-id="{$val.id}" data-field="status" data-value="{$val.status}" src="__STATIC__/images/admin/toggle_<if condition="$val.status eq 0">disabled<else/>enabled</if>.gif" /></td>
                <td align="center">{$val.last_time|frienddate}</td>
                <td align="center"><a href="javascript:collect({$val.id},{$val.last_page});">继续上次采集</a> |<a href="javascript:collect({$val.id},1);">开始采集</a> |<a href="{:u('ftxrobots/edit', array('id'=>$val['id'], 'menuid'=>$menuid))}">{:L('edit')}</a> | <a href="javascript:void(0);" class="J_confirmurl" data-uri="{:u('ftxrobots/delete', array('id'=>$val['id']))}" data-acttype="ajax" data-msg="{:sprintf(L('confirm_delete_one'),$val['name'])}">{:L('delete')}</a></td>
            </tr>
            </volist>
    	</tbody>
    </table>
    </div>

    <div class="btn_wrap_fixed">
        <label class="select_all mr10"><input type="checkbox" name="checkall" class="J_checkall">{:L('select_all')}/{:L('cancel')}</label>
        <input type="button" class="btn" data-tdtype="batch_action" data-acttype="ajax" data-uri="{:U('ftxrobots/delete')}" data-name="id" data-msg="{:L('confirm_delete')}" value="{:L('delete')}" />
        <input type="text" id="input_pages" class="input-text" placeholder="页数" size="5">
        <input type="text" id="input_start_price" class="input-text" placeholder="最小价格" size="10">
        <input type="text" id="input_end_price" class="input-text" placeholder="最大价格" size="10">
        <input type="button" class="btn" id="setpages" value="统一设置" />
        <div id="pages">{$page}</div>
    </div>
</div>
<include file="public:footer" />
<script>
    $(function(){
      $("#setpages").click(function(){
        var p = parseInt($("#input_pages").val());
        var start_price = parseInt($("#input_start_price").val());
        var end_price = parseInt($("#input_end_price").val());
        var ids = $(".J_checkitem:checked").map(function(){
            return $(this).val();
        }).get().join(",");
        
        var url = "{:U('ftxrobots/setAll')}"; 
        var data = {
            id:ids
        }
        if(p){
            data.page = p;
        }
        if(start_price){
            data.start_price = start_price;
        }
        if(end_price){
            data.end_price = end_price;
        }
        if(p || start_price || end_price){
            $.getJSON(url,data,function(rsp){
                if(rsp.status){
                    window.location.reload();
                }else{
                    $.dialog.alert(rsp.msg);
                }
            });
        }
      });
    });

    var collect_url = "{:U('ftxrobots/collect')}";
    var id = 0;
	var p = 1;
	function collect(id,p){
        $.getJSON(collect_url, {id:id,p:p}, function(result){
            if(result.status == 1){
				$.dialog({id:'cmt_taobao', title:result.msg, content:result.data, padding:'', lock:true});
                p++;
				setTimeout("collect_page("+ id +","+ p+")",1000);
            }else{
                $.ftxia.tip({content:result.msg});
            }
        });
    }
	function collect_page(id,p){
        $.getJSON(collect_url, {id:id,p:p}, function(result){
            if(result.status == 1){
                $.dialog.get('cmt_taobao').content(result.data);
                p++;
				setTimeout("collect_page("+ id +","+ p+")",1000);
            }else{
                $.dialog.get('cmt_taobao').close();
                $.ftxia.tip({content:result.msg});
            }
        });
    }




    function auto_collect(){

        $.getJSON(collect_url, {auto:1}, function(result){
            if(result.status == 1){
                $.dialog({id:'cmt_ftxia', title:result.msg.title, content:result.data, padding:'', lock:true});
                rid = result.msg.rid;
                p = result.msg.np;
                
                setTimeout("auto_collect_page("+ rid +","+ p+")",1000);
            }else{
                $.ftxia.tip({content:result.msg});
            }
        });
    }
    function auto_collect_page(rid,p){
        $.getJSON(collect_url, {rid:rid,p:p,auto:1}, function(result){
            if(result.status == 1){
                $.dialog.get('cmt_ftxia').content(result.data);
                rid = result.msg.rid;
                p = result.msg.np;
                setTimeout("auto_collect_page("+ rid +","+ p+")",1000);
            }else{
                $.dialog.get('cmt_ftxia').close();
                $.ftxia.tip({content:result.msg});
            }
        });
    }

    function jx_collect(rid,p){
        $.getJSON(collect_url, {rid:rid,p:p,auto:1}, function(result){
            if(result.status == 1){
                 $.dialog({id:'cmt_ftxia', title:result.msg.title, content:result.data, padding:'', lock:true});
                rid = result.msg.rid;
                p = result.msg.np;
                setTimeout("auto_collect_page("+ rid +","+ p+")",1000);
            }else{
                $.dialog.get('cmt_ftxia').close();
                $.ftxia.tip({content:result.msg});
            }
        });
    }
</script>
<script>
    $(function(){
        $('.J_cate_select').cate_select({top_option:lang.all}); //分类联动
    });
</script>
</body>
</html>