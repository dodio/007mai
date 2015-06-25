<include file="public:header" />
<!--广告位列表-->
<div class="pad_lr_10">
    <form name="searchform" method="get" >
    <table width="100%" cellspacing="0" class="search_form">
        <tbody>
            <tr>
            <td>
            <div class="explain_col">
              <input type="hidden" name="g" value="admin" />
                <input type="hidden" name="m" value="adboard" />
                <input type="hidden" name="a" value="index" />
                <input type="hidden" name="menuid" value="{$menuid}" />
                {:L('adboard_type')}
                <select name="board_type" class="mr10">
                    <option value="">--{:L('all')}--</option>
                    <volist name="tpl_list" id="val" >
                    <option value="{$key}" <if condition="$search.board_type eq $key">selected="selected"</if>>{$val.name}</option>
                    </volist>
                </select>
                <input name="keyword" type="text" class="input-text mr10" size="25" value="{$search.keyword}" />
                <input type="submit" name="search" class="btn" value="搜索" />
          </div>
            </td>
            </tr>
        </tbody>
    </table>
    </form>

    <div class="J_tablelist table_list" data-acturi="{:U('adboard/ajax_edit')}">
      <table width="100%" cellspacing="0">
        <thead>
			<tr>
				<th width="25"><input type="checkbox" class="J_checkall"></th>
				<th><span tdtype="order_by" fieldname="id">ID</span></th>
				<th><span tdtype="order_by" fieldname="name">{:L('adboard_name')}</span></th>
				<th><span tdtype="order_by" fieldname="type">{:L('adboard_type')}</span></th>
				<th>{:L('adboard_size')}</th>
				<th>页面tracker</th>
                <th width="40"><span data-tdtype="order_by" data-field="status">{:L('status')}</span></th>
                <th>{:L('operations_manage')}</th>
			</tr>
        </thead>
		<tbody>
			<volist name="list" id="val">
			<tr>
				<td align="center"><input type="checkbox" name="checkall" class="J_checkitem" value="{$val.id}"></td>
				<td align="center">{$val.id}</td>
				<td><span data-tdtype="edit" data-field="name" data-id="{$val.id}" class="tdedit">{$val.name}</span></td>
                <td align="center">{$tpl_list[$val['tpl']]['name']}</td>
				<td align="center"><span data-tdtype="edit" data-field="width" data-id="{$val.id}" class="tdedit">{$val.width}</span>*<span data-tdtype="edit" data-field="height" data-id="{$val.id}" class="tdedit">{$val.height}</span></td>
				<td align="center">{$val.tracker}</td>
                <td align="center"><img data-tdtype="toggle" data-id="{$val.id}" data-field="status" data-value="{$val.status}" src="__STATIC__/images/admin/toggle_<if condition="$val.status eq 0">disabled<else/>enabled</if>.gif" /></td>
                <td align="center">
                  <a href="{:U('ad/index',array('board_id'=>$val['id'],'menuid'=>11))}">查看广告</a>
                  <a href="javascript:void(0);" class="J_showdialog" data-uri="?m=ad&a=add&board_id={$val.id}" data-title="添加广告-{$val.name}" data-id="add" data-width="520" data-height="350">添加广告</a>
                	<a href="javascript:void(0);" class="J_showdialog" data-uri="{:U('adboard/edit', array('id'=>$val['id']))}" dtitle="{:L('edit')} - {$val.name}" data-id="edit" data-width="500" data-height="280">{:L('edit')}</a> | 
                    <a href="javascript:void(0);" class="J_confirmurl" data-acttype="ajax" data-uri="{:u('adboard/delete', array('id'=>$val['id']))}" data-msg="{:sprintf(L('confirm_delete_one'), $val['name'])}">{:L('delete')}</a></td>
			</tr>
			</volist>
        </tbody>
		</table>
        <div class="btn_wrap_fixed">
			<label class="select_all"><input type="checkbox" name="checkall" class="J_checkall">{:L('select_all')}/{:L('cancel')}</label>
            <input type="button" class="btn" data-tdtype="batch_action" data-acttype="ajax" data-uri="{:U('adboard/delete')}" data-name="id" data-msg="{:L('confirm_delete')}" value="{:L('delete')}" />
			<div id="pages">{$page}</div>
		</div>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="__STATIC__/js/calendar/calendar-blue.css"/>
<script type="text/javascript" src="__STATIC__/js/calendar/calendar.js"></script>
<include file="public:footer" />
</body>
</html>