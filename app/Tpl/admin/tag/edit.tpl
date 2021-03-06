<!--添加广告位-->
<div class="dialog_content">
<form id="info_form" action="{:u('tag/edit')}" method="post">
<table width="100%" cellpadding="2" cellspacing="1" class="table_form">
  <tr> 
    <th style="width:100px;">标签名字 :</th>
    <td><input type="text" name="name" id="name" value="{$info.name}" class="input-text" size="30"></td>
  </tr>
  <tr> 
    <th style="width:100px;">标签页面标题 :</th>
    <td><input type="text" name="seo_title" id="seo_title" value="{$info.seo_title}" class="input-text" size="30"></td>
  </tr>
  <tr> 
    <th style="width:100px;">标签页面关键词 :</th>
    <td><input type="text" name="seo_keys" id="seo_keys" value="{$info.seo_keys}" class="input-text" size="30"></td>
  </tr>
  
  <tr> 
    <th>标签页面描述 :</th>
    <td><textarea rows="4" cols="45" class="input-textarea" id="seo_desc" name="seo_desc">{$info.seo_desc}</textarea></td>
  </tr>
  <tr>
    <th>{:L('enabled')} :</th>
    <td>
        <label><input type="radio" name="status" value="1" <if condition="$info.status eq '1'">checked="checked"</if>> {:L('yes')}</label>&nbsp;&nbsp;
        <label><input type="radio" name="status" value="0" <if condition="$info.status eq '0'">checked="checked"</if>> {:L('no')}</label>
    </td>
  </tr>
  <input type="hidden" name="id" id="id" value="{$info.id}" />
</table>
</form>
</div>
<script type="text/javascript">
$(function(){
  $('#info_form').ajaxForm({success:complate,dataType:'json'});
  function complate(result){
    if(result.status == 1){
      $.dialog.get(result.dialog).close();
      $.ftxia.tip({content:result.msg});
      window.location.reload();
    } else {
      $.ftxia.tip({content:result.msg, icon:'alert'});
    }
  }
});
</script>