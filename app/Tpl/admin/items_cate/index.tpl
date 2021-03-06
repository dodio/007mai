<include file="public:header" />
<!--栏目列表-->
<div class="pad_lr_10">
    <div class="J_tablelist table_list" data-acturi="{:U('items_cate/ajax_edit')}">
    <table width="100%" cellspacing="0" id="J_cate_tree">
        <thead>
            <tr>
                <th width="30"><input type="checkbox" name="checkall" class="J_checkall"></th>
                <th width="30"><span data-tdtype="order_by" data-field="id">ID</span></th>
                <th>{:L('item_cate_name')}</th>
              	<th width="60"><span data-tdtype="order_by" data-field="ordid">{:L('sort_order')}</span></th>
                <th width="60"><span data-tdtype="order_by" data-field="ishot">热门分类</span></th>
                <th width="60"><span data-tdtype="order_by" data-field="status">页面显示</span></th>
                <th width="180">{:L('operations_manage')}</th>
            </tr>
        </thead>
    	<tbody>
        {$list}
    	</tbody>
    </table>
    </div>
    <div class="btn_wrap_fixed">
        <label class="select_all mr10"><input type="checkbox" name="checkall" class="J_checkall">{:L('select_all')}/{:L('cancel')}</label>
        <input type="button" class="btn btn_submit" data-tdtype="batch_action" data-acttype="ajax_form" data-id="move" data-uri="{:U('items_cate/move')}" data-name="id" data-title="{:L('item_cate_move')}" value="{:L('move')}" /> 
        <input type="button" class="btn" data-tdtype="batch_action" data-acttype="ajax" data-uri="{:U('items_cate/delete')}" data-name="id" data-msg="{:L('confirm_delete')}" value="{:L('delete')}" />
    </div>
</div>
<include file="public:footer" />
<script src="__STATIC__/js/jquery/plugins/jquery.treetable.js"></script>
<script>
$(function(){
    //initialState:'expanded'
    $("#J_cate_tree").treeTable({indent:20,treeColumn:2});
    $(".J_preview").preview();
});        
</script> 
</body>
</html>