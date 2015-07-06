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
                <input type="hidden" name="m" value="tag" />
                <input type="hidden" name="a" value="index" />
                <input type="hidden" name="menuid" value="{$menuid}" />
                <input name="keyword" type="text" class="input-text mr10" size="25" value="{$search.keyword}" />
                <input type="submit" name="search" class="btn" value="搜索" />
          </div>
            </td>
            </tr>
        </tbody>
    </table>
    </form>

    <div class="J_tablelist table_list" data-acturi="{:U('tag/ajax_edit')}">
      <table width="100%" cellspacing="0">
        <thead>
      <tr>
        <th width="25"><input type="checkbox" class="J_checkall"></th>
        <th><span tdtype="order_by" fieldname="id">ID</span></th>
        <th><span title="(搜索内容)">便签名字</span></th>
        <th>页面title</th>
        <th>页面keywords</th>
        <th width="300">页面desc</th>
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
        <td><span data-tdtype="edit" data-field="seo_title" data-id="{$val.id}" class="tdedit">{$val.seo_title}</span></td>
        <td><span data-tdtype="edit" data-field="seo_keys" data-id="{$val.id}" class="tdedit">{$val.seo_keys}</span></td>
        <td><span data-tdtype="edit" data-field="seo_desc" data-id="{$val.id}" class="tdedit">{$val.seo_desc}</span></td>
        <td align="center"><img data-tdtype="toggle" data-id="{$val.id}" data-field="status" data-value="{$val.status}" src="__STATIC__/images/admin/toggle_<if condition="$val.status eq 0">disabled<else/>enabled</if>.gif" /></td>
                <td align="center">
                  <a href="javascript:void(0);" class="J_showdialog" data-uri="{:U('tag/edit', array('id'=>$val['id']))}" dtitle="{:L('edit')} - {$val.name}" data-id="edit" data-width="500" data-height="280">{:L('edit')}</a> | 
                    <a href="javascript:void(0);" class="J_confirmurl" data-acttype="ajax" data-uri="{:u('tag/delete', array('id'=>$val['id']))}" data-msg="{:sprintf(L('confirm_delete_one'), $val['name'])}">{:L('delete')}</a></td>
      </tr>
      </volist>
        </tbody>
    </table>
        <div class="btn_wrap_fixed">
      <label class="select_all"><input type="checkbox" name="checkall" class="J_checkall">{:L('select_all')}/{:L('cancel')}</label>
            <input type="button" class="btn" data-tdtype="batch_action" data-acttype="ajax" data-uri="{:U('tag/delete')}" data-name="id" data-msg="{:L('confirm_delete')}" value="{:L('delete')}" />
      <div id="pages">{$page}</div>
    </div>
  </div>
</div>
<include file="public:footer" />
</body>
</html>