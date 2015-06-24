<include file="public:header" />
<!--广告列表-->
<div class="pad_lr_10">
    <form name="searchform" method="get" >
    <table width="100%" cellspacing="0" class="search_form">
        <tbody>
            <tr>
            <td>
            <div class="explain_col">
              <input type="hidden" name="g" value="admin" />
                <input type="hidden" name="m" value="shop" />
                <input type="hidden" name="a" value="index" />
                <input type="hidden" name="menuid" value="{$menuid}" />
              {:L('ad_start_time')}：
              <input type="text" name="start_time_min" id="start_time_min" class="date" size="12" value="{$search.start_time_min}">
                -
                <input type="text" name="start_time_max" id="start_time_max" class="date mr10" size="12" value="{$search.start_time_max}">
                {:L('ad_end_time')}：
                <input type="text" name="end_time_min" id="end_time_min" class="date" size="12" value="{$search.end_time_min}">
                -
                <input type="text" name="end_time_max" id="end_time_max" class="date" size="12" value="{$search.end_time_max}">
              <div class="bk3"></div>
                分类 :
                <select class="J_cate_select mr10" data-pid="0" data-uri="{:U('items_cate/ajax_getchilds', array('type'=>0))}" data-selected="{$search.selected_ids}"></select>
                <input type="hidden" name="cate_id" id="J_cate_id" value="{$search.cate_id}" />
                本类&nbsp;<input type="checkbox" name="this_cate" value="1" <eq name="search.this_cate" value="1">checked</eq>/>&nbsp;
                店名 :
                <input name="name" type="text" class="input-text mr10" size="25" value="{$search.name}" />
                <input type="submit" name="search" class="btn" value="搜索" />
                <input type="button" id="add_search" class="btn" value="添加到选择分类" />
          </div>
            </td>
            </tr>
        </tbody>
    </table>
    </form>
    
    <div class="J_tablelist table_list" data-acturi="{:U('shop/ajax_edit')}">
    <table width="100%" cellspacing="0">
        <thead>
          <tr>
            <th width="25"><input type="checkbox" name="checkall" class="J_checkall"></th>
            <th><span data-tdtype="order_by" data-field="id">ID</span></th>
            <th align="left">店铺名称</th>
            <th align="left">图片</th>
            <th align="center"><span data-tdtype="order_by" data-field="cate_id">分类</span></th>
            <th align="center"><span data-tdtype="order_by" data-field="shop_type">店铺类型</span></th>
            <th width="200" align="left">推荐理由</th>
            <th align="left"><span data-tdtype="order_by" data-field="average_price">平均价格</span></th>
            <th>sellerId：</span></th>
            <th width="150">有效时间</th>
            <th width="60"><span data-tdtype="order_by" data-field="ordid">{:L('sort_order')}</span></th>
            <th width="60"><span data-tdtype="order_by" data-field="status">{:L('status')}</span></th>
            <th width="80">{:L('operations_manage')}</th>
          </tr>
        </thead>
        <tbody>
          <volist name="list" id="val" >
          <tr>
            <td align="center"><input type="checkbox" class="J_checkitem" value="{$val.id}"></td>
            <td align="center">{$val.id}</td>
            <td><span data-tdtype="edit" data-field="name" data-id="{$val.id}" class="tdedit">{$val.name}</span></td>
            <td><img src="{:attach($val['img'],'images')}" width="96px" height="96px" alt=""></td>
            <td align="center"><?php echo $cate_data[$val['cate_id']]['name']; ?></td>
            <td align="center">{$val.shop_type}</td>
            <td align="left"><span data-tdtype="edit" data-field="reason" data-id="{$val.reason}" class="tdedit">{$val.reason}</span></td>
            <td align="left"><span data-tdtype="edit" data-field="average_price" data-id="{$val.average_price}" class="tdedit">{$val.average_price}</span></td>
            <td align="center">{$val.sellerId}</td>
            <td align="center">{$val.start_time|date='Y-m-d',###} / {$val.end_time|date='Y-m-d',###}</td>
            <td align="center"><span data-tdtype="edit" data-field="ordid" data-id="{$val.id}" class="tdedit">{$val.ordid}</span></td>
            <td align="center"><img data-tdtype="toggle" data-id="{$val.id}" data-field="status" data-value="{$val.status}" src="__STATIC__/images/admin/toggle_<if condition="$val.status eq 0">disabled<else/>enabled</if>.gif" /></td>
            <td align="center">
                <a href="{:u('shop/edit', array('id'=>$val['id'], 'menuid'=>$menuid))}">{:L('edit')}</a> | 
                <a href="javascript:void(0);" class="J_confirmurl" data-acttype="ajax" data-uri="{:u('shop/delete', array('id'=>$val['id']))}" data-msg="{:sprintf(L('confirm_delete_one'),$val['name'])}">{:L('delete')}</a></td>
          </tr>
          </volist>
        </tbody>
        </table>
      <div class="btn_wrap_fixed">
        <label class="select_all"><input type="checkbox" name="checkall" class="J_checkall">{:L('select_all')}/{:L('cancel')}</label>
            <input type="button" class="btn" data-tdtype="batch_action" data-acttype="ajax" data-uri="{:U('shop/delete')}" data-name="id" data-msg="{:L('confirm_delete')}" value="{:L('delete')}" />
            <input type="button" class="btn btn_submit" data-tdtype="batch_action" data-acttype="ajax_form" data-id="move" data-uri="{:U('shop/move',array('move'=>2))}" data-name="id" data-title="批量分类" value="批量分类" /> 
  <!-- <input type="button" class="btn btn_submit" data-tdtype="batch_action" data-acttype="ajax_form" data-id="move" data-uri="{:U('shop/move',array('move'=>1))}" data-name="id" data-title="批量加入专场" value="批量专场" />  -->
            <input type="button" class="btn" id="setTime" value="设置时间">
            <input type="text" id="all_start_time" class="date" size="12"> - 
            <input type="text" id="all_end_time" class="date" size="12">
        <div id="pages">{$page}</div>
      </div>
    </div>
</div>
<include file="public:footer" />
<link rel="stylesheet" type="text/css" href="__STATIC__/js/calendar/calendar-blue.css"/>
<script type="text/javascript" src="__STATIC__/js/calendar/calendar.js"></script>
<script type="text/javascript">
Calendar.setup({
  inputField : "start_time_min",
  ifFormat   : "%Y-%m-%d",
  showsTime  : false,
  timeFormat : "24"
});
Calendar.setup({
  inputField : "start_time_max",
  ifFormat   : "%Y-%m-%d",
  showsTime  : false,
  timeFormat : "24"
});
Calendar.setup({
  inputField : "end_time_min",
  ifFormat   : "%Y-%m-%d",
  showsTime  : false,
  timeFormat : "24"
});
Calendar.setup({
  inputField : "end_time_max",
  ifFormat   : "%Y-%m-%d",
  showsTime  : false,
  timeFormat : "24"
});

Calendar.setup({
    inputField : "all_start_time",
    ifFormat   : "%Y-%m-%d",
    showsTime  : false,
    timeFormat : "24"
});
Calendar.setup({
    inputField : "all_end_time",
    ifFormat   : "%Y-%m-%d",
    showsTime  : false,
    timeFormat : "24"
});
$('.J_cate_select').cate_select({top_option:lang.all}); //分类联动

$("#setTime").click(function(){
    var ids = $(".J_checkitem:checked").map(function(){
        return $(this).val();
    }).get().join(",");

    var start_time = $("#all_start_time").val();
    var end_time = $("#all_end_time").val();
    var url = "{:U('shop/set_time')}";
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
});

$("#add_search").click(function(){
  var cate_id = $("#J_cate_id").val();
  window.open("{:U('shop/add',array('cid'=>'"+cate_id+"'))}");
});
</script>
</body>
</html>