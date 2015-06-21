<!--编辑广告-->
<div class="dialog_content">
<form id="info_form" action="{:u('ad/edit')}" method="post">
<table width="100%" cellpadding="2" cellspacing="1" class="table_form">
    <tr>
        <th width="80">{:L('ad_name')} :</th>
        <td><input type="text" name="name" id="name" class="input-text" size="40" value="{$info.name}"></td>
    </tr>
    <tr>
        <th>{:L('ad_url')} :</th>
        <td><input type="text" name="url" class="input-text" size="40" value="{$info.url}"></td>
    </tr>
    <tr>
        <th>{:L('adboard')} :</th>
        <td class="blue">
            {$board_info.name} ({$board_info.width}*{$board_info.height})
        </td>
    </tr>
    <tr>
        <th>{:L('ad_type')} :</th>
        <td>
            <select name="type" id="type">
            <volist name="ad_type_arr" id="val" >
                <option value="{$key}" <if condition="$info['type'] eq $key">selected="selected"</if>>{$val}</option>
            </volist>
            </select>
        </td>
    </tr>
    <tr id="ad_image" class="bill_media">
        <th>{:L('ad_image')} :</th>
        <td><input type="text" name="img" id="J_img" class="input-text fl mr10" size="30" value="{$info.content}">
          <div id="J_upload_img" class="upload_btn"><span>{:L('upload')}</span></div>
		<if condition="$info.type eq 'image'"><notempty name="info['content']"><span class="attachment_icon J_attachment_icon" file-type="image" file-rel="{:attach($info['content'],'images')}"><img src="__STATIC__/images/filetype/image_s.gif" /></span></notempty></if>
		</td>
    </tr>

    <tr id="ad_code" class="bill_media" style="display:none;">
        <th>{:L('ad_code')} :</th>
        <td><textarea rows="3" cols="50" name="code" id="code">{$info.content}</textarea></td>
    </tr>

    <tr id="ad_text" class="bill_media" style="display:none;">
        <th>{:L('ad_text')} :</th>
        <td><textarea rows="3" cols="50" name="text" id="text">{$info.content}</textarea></td>
    </tr>
    <tr>
      <th>{:L('ad_desc')} :</th>
      <td><input type="text" name="desc" class="input-text fl mr10" size="30" value="{$info.desc}"></td>
    </tr>
    <tr>
        <th>{:L('ad_time')} :</th>
        <td>
            <input type="text" name="start_time" id="start_time" class="date" size="12" value="{$info.start_time|date='Y-m-d',###}">
            <input type="text" name="end_time" id="end_time" class="date" size="12" value="{$info.end_time|date='Y-m-d',###}">
        </td>
    </tr>
    <tr id="ad_image">
      <th>扩展图片 :</th>
      <td>
          <input type="text" name="extimg" id="J_extimg" class="input-text fl mr10" value="{$info.extimg}" size="30">
          <div id="J_upload_extimg" class="upload_btn"><span>{:L('upload')}</span></div>
          <if condition="$info.type eq 'image'"><notempty name="info['extimg']"><span class="attachment_icon J_attachment_icon" file-type="image" file-rel="{:attach($info['extimg'],'images')}"><img src="__STATIC__/images/filetype/image_s.gif" /></span></notempty></if>
      </td>
    </tr>
    <tr id="ad_extval">
      <th>扩展值 :</th>
      <td>
          <input type="text" name="extval" id="J_extval" class="input-text fl mr10" size="30" value="{$info.extval}">
      </td>
    </tr>
    <tr>
        <th>{:L('enabled')} :</th>
        <td>
            <label><input type="radio" <if condition="$info['status'] eq '1'">checked="checked"</if> value="1" name="status"> {:L('yes')}</label>&nbsp;&nbsp;
            <label><input type="radio" <if condition="$info['status'] eq '0'">checked="checked"</if> value="0" name="status"> {:L('no')}</label>
        </td>
    </tr>
</table>
<input type="hidden" name="id" id="id" value="{$info.id}" />
</form>
</div>
<script src="/static/js/fileuploader.js"></script>
<script type="text/javascript">
Calendar.setup({
    inputField : "start_time",
    ifFormat   : "%Y-%m-%d",
    showsTime  : false,
    timeFormat : "24"
});
Calendar.setup({
    inputField : "end_time",
    ifFormat   : "%Y-%m-%d",
    showsTime  : false,
    timeFormat : "24"
});

$(function(){
    $("#type").change(function(){
        $(".bill_media").hide();
        $("#ad_"+$(this).val()).show();
    });
    $("#type").change();

    $.formValidator.initConfig({formid:"info_form",autotip:true});
    $("#name").formValidator({onshow:"请填写广告名称",onfocus:"请填写广告名称"}).inputValidator({min:1,onerror:"请填写广告名称"}).defaultPassed();
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
	
	//上传图片
    var img_uploader = new qq.FileUploaderBasic({
        allowedExtensions: ['jpg','gif','jpeg','png','bmp','pdg'],
        button: document.getElementById('J_upload_img'),
        multiple: false,
        action: "{:U('ad/ajax_upload_img')}",
        inputName: 'img',
        forceMultipart: true, //用$_FILES
        messages: {
            typeError: lang.upload_type_error,
            sizeError: lang.upload_size_error,
            minSizeError: lang.upload_minsize_error,
            emptyError: lang.upload_empty_error,
            noFilesError: lang.upload_nofile_error,
            onLeave: lang.upload_onLeave
        },
        showMessage: function(message){
            $.ftxia.tip({content:message, icon:'error'});
        },
        onSubmit: function(id, fileName){
            $('#J_upload_img').addClass('btn_disabled').find('span').text(lang.uploading);
        },
        onComplete: function(id, fileName, result){
            $('#J_upload_img').removeClass('btn_disabled').find('span').text(lang.upload);
            if(result.status == '1'){
                $('#J_img').val(result.data);
            } else {
                $.ftxia.tip({content:result.msg, icon:'error'});
            }
        }
    });

    var extimg_uploader = new qq.FileUploaderBasic({
        allowedExtensions: ['jpg','gif','jpeg','png','bmp','pdg'],
        button: document.getElementById('J_upload_extimg'),
        multiple: false,
        action: "{:U('ad/ajax_upload_img', array('type'=>'extimg'))}",
        inputName: 'extimg',
        forceMultipart: true, //用$_FILES
        messages: {
            typeError: lang.upload_type_error,
            sizeError: lang.upload_size_error,
            minSizeError: lang.upload_minsize_error,
            emptyError: lang.upload_empty_error,
            noFilesError: lang.upload_nofile_error,
            onLeave: lang.upload_onLeave
        },
        showMessage: function(message){
            $.ftxia.tip({content:message, icon:'error'});
        },
        onSubmit: function(id, fileName){
            $('#J_upload_extimg').addClass('btn_disabled').find('span').text(lang.uploading);
        },
        onComplete: function(id, fileName, result){
            $('#J_upload_extimg').removeClass('btn_disabled').find('span').text(lang.upload);
            if(result.status == '1'){
                $('#J_extimg').val(result.data);
            } else {
                $.ftxia.tip({content:result.msg, icon:'error'});
            }
        }
    });

})
</script>