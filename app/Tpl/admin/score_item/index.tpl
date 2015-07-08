<include file="public:header" />
<div class="pad_lr_10" >
    
    <form name="searchform" method="get" >
    <table width="100%" cellspacing="0" class="search_form">
        <tbody>
            <tr>
            <td>
            <div class="explain_col">
            	<input type="hidden" name="g" value="admin" />
                <input type="hidden" name="m" value="score_item" />
                <input type="hidden" name="a" value="index" />
                <input type="hidden" name="menuid" value="{$menuid}" />
				所属分类：
                <select name="cate_id">
                        <option value="">--请选择分类--</option>
                         <volist name="cate_list" id="val"> <option value="{$key}" 
                            <if condition="$search.cate_id eq $key"> selected="selected" </if>
                            >{$val}
                         </option>
                         </volist>
                </select>&nbsp;
                {:L('ad_start_time')}：
                <input type="text" name="start_time_min" id="start_time_min" class="date" size="12" value="{$search.start_time_min}">
                -
                <input type="text" name="start_time_max" id="start_time_max" class="date mr10" size="12" value="{$search.start_time_max}">
                {:L('ad_end_time')}：
                <input type="text" name="end_time_min" id="end_time_min" class="date" size="12" value="{$search.end_time_min}">
                -
                <input type="text" name="end_time_max" id="end_time_max" class="date" size="12" value="{$search.end_time_max}">
                <div class="bk3"></div>
                关键字 :
                <input name="keyword" type="text" class="input-text" size="25" value="{$search.keyword}" />
                <input type="submit" name="search" class="btn" value="搜索" />
        	</div>
            </td>
            </tr>
        </tbody>
    </table>
    </form>
    
    <div class="J_tablelist table_list" data-acturi="{:U('score_item/ajax_edit')}">
    <table width="100%" cellspacing="0">
        <thead>
            <tr>
                <th width=25><input type="checkbox" id="checkall_t" class="J_checkall"></th>
                <th width="40"><span tdtype="order_by" fieldname="id">ID</span></th>
				<th width="50" align="center">缩略图</th>
                <th align="left"><span data-tdtype="order_by" data-field="title">商品名称</span></th>
                <th align="left">兑换时间</th>
                <th width="80" align="left"><span data-tdtype="order_by" data-field="score">所需情报</span></th>
                <th width="80" align="left"><span data-tdtype="order_by" data-field="stock">库存</span></th>
                <th width="70" align="left"><span data-tdtype="order_by" data-field="user_num">每人限兑</span></th>
                <th width="60" align="center">分类名称</th>
				<th width="40" align="left"><span data-tdtype="order_by" data-field="ordid">排序</span></th>
                <th width="80">{:L('operations_manage')}</th>
            </tr>
        </thead>
    	<tbody>
            <volist name="list" id="val" >
            <tr>
                <td align="center">
                <input type="checkbox" class="J_checkitem" value="{$val.id}"></td>
                <td align="center">{$val.id}</td>
                <td align="center">
                <notempty name="val.img">
				<span class="attachment_icon J_attachment_icon" file-type="image" file-rel="{:attach($val['img'], 'score_item')}">
				<img src="{:attach($val['img'], 'score_item')}" style="width:26px; height:26px;" /></span>
                </notempty>
				</td>
                <td align="left"><span data-tdtype="edit" data-field="name" data-id="{$val.id}" class="tdedit">{$val.title}</span></td>
                <td align="left">{$val.start_time|date='Y-m-d h:m',###} / {$val.end_time|date='Y-m-d h:m',###}</td>
                <td align="left"><span data-tdtype="edit" data-field="score" data-id="{$val.id}" class="tdedit">{$val.score}</span></td>
                <td align="left"><span data-tdtype="edit" data-field="stock" data-id="{$val.id}" class="tdedit">{$val.stock}</span></td>
                <td align="left"><span data-tdtype="edit" data-field="user_num" data-id="{$val.id}" class="tdedit">{$val.user_num}</span></td>
                <td align="center"><b>{$cate_list[$val['cate_id']]}</b></td>
				<td align="left"><span data-tdtype="edit" data-field="ordid" data-id="{$val.id}" class="tdedit">{$val.ordid}</span></td>
                <td align="center">
					<a href="{:U('score_item/edit', array('id'=>$val['id'], 'menuid'=>$menuid))}" data-uri="{:U('score_item/edit', array('id'=>$val['id'], 'menuid'=>$menuid))}" data-title="{:L('edit')} - {$val.name}"  data-id="edit" >{:L('edit')}</a> | 
                    <a href="javascript:;" class="J_confirmurl" data-acttype="ajax" data-uri="{:U('score_item/delete', array('id'=>$val['id']))}" data-msg="{:sprintf(L('confirm_delete_one'),$val['name'])}">{:L('delete')}</a>
					</td>
            </tr>
            </volist>
    	</tbody>
    </table>
    </div>
	<div class="btn_wrap_fixed">
    	<label><input type="checkbox" name="checkall" class="J_checkall">{:L('select_all')}/{:L('cancel')}</label>
    	<input type="button" class="btn" data-tdtype="batch_action" data-acttype="ajax" data-uri="{:U('score_item/delete')}" data-name="id" data-msg="{:L('confirm_delete')}" value="{:L('delete')}" />
        <input type="button" class="btn" id="setTime" value="设置时间">
        <input type="text" id="all_start_time" class="date" size="15"> - 
        <input type="text" id="all_end_time" class="date" size="15">
    	<div id="pages">{$page}</div>
    </div>
</div>
<include file="public:footer" />
<link rel="stylesheet" type="text/css" href="__STATIC__/js/calendar/calendar-blue.css"/>
<script type="text/javascript" src="__STATIC__/js/calendar/calendar.js"></script>
<script>    
Calendar.setup({
    inputField : "start_time_min",
    ifFormat   : "%Y-%m-%d %H:%M",
    showsTime  : false,
    timeFormat : "24"
});
Calendar.setup({
    inputField : "start_time_max",
    ifFormat   : "%Y-%m-%d %H:%M",
    showsTime  : false,
    timeFormat : "24"
});
Calendar.setup({
    inputField : "end_time_min",
    ifFormat   : "%Y-%m-%d %H:%M",
    showsTime  : false,
    timeFormat : "24"
});
Calendar.setup({
    inputField : "end_time_max",
    ifFormat   : "%Y-%m-%d %H:%M",
    showsTime  : false,
    timeFormat : "24"
});
Calendar.setup({
    inputField : "all_start_time",
    ifFormat   : "%Y-%m-%d %H:%M",
    showsTime  : false,
    timeFormat : "24"
});
Calendar.setup({
    inputField : "all_end_time",
    ifFormat   : "%Y-%m-%d %H:%M",
    showsTime  : false,
    timeFormat : "24"
});
$("#setTime").click(function(){
    var ids = $(".J_checkitem:checked").map(function(){
        return $(this).val();
    }).get().join(",");

    var start_time = $("#all_start_time").val();
    var end_time = $("#all_end_time").val();
    var url = "{:U('score_item/set_time')}";
    var data = {
        start_time:start_time,
        end_time:end_time,
        ids:ids
    }

    $.getJSON(url,data,function(rsp){
        if(rsp.status){
            window.location.reload();
        }else{
            $.dialog.alert(rsp.msg);
        }
    });
})
</script>
</body>
</html>