<!--编辑栏目-->
<div class="dialog_content col_tab">
	<form id="info_form" action="{:u('zc_cate/edit')}" method="post">

		<div class="J_panes">
        <div class="content_list pad_10">
	<table width="100%" class="table_form">
		<tr>
			<th>专场名称 :</th>
			<td>
				<input type="text" name="name" id="J_name" class="input-text" value="{$info.name}" size="30">
			</td>
		</tr>
		<tr>
			<th>专场英文 :</th>
			<td>
				<input type="text" name="ename" id="J_ename" class="input-text" value="{$info.ename}" size="30">
			</td>
		</tr>
		<tr>
			<th width="100">所属分类 :</th>
			<td><select class="J_cate_select mr10" data-pid="0" data-uri="{:U('zc_cate/ajax_getchilds', array('type'=>0))}" data-selected="{$info.spid}"></select><input type="hidden" name="pid" id="J_cate_id" value="{$info.pid}" /></td>
		</tr>
		<tr style="display:none">
			<th width="100">导航颜色 :</th>
			<td><input type="text" name="d_class" id="d_class" class="input-text" size="30" value="{$info.d_class}"></td>
		</tr>
		<tr style="display:none">
			<th width="100">背景颜色 :</th>
			<td><input type="text" name="q_class" id="q_class" class="input-text" size="30" value="{$info.q_class}"></td>
		</tr>
		<tr id="pic_url" class="bill_media">
      <th>图片750X290 :</th>
      <td>
          <input type="text" name="pic_url" id="J_img" class="input-text fl mr10"  value="{$info.pic_url}" size="30">
          <div id="J_upload_img" class="upload_btn"><span>{:L('upload')}</span></div>
      </td>
    </tr>
    <tr id="banner_pic" class="bill_media">
      <th>图片1920X300 :</th>
      <td>
          <input type="text" name="banner_pic" id="J_imgs" class="input-text fl mr10" value="{$info.banner_pic}" size="30">
          <div id="J_upload_imgs" class="upload_btn"><span>{:L('upload')}</span></div>
      </td>
    </tr>

    <tr id="body_pic" class="bill_media">
      <th>Body背景图 :</th>
      <td>
          <input type="text" name="body_pic" id="J_imgss" class="input-text fl mr10" value="{$info.body_pic}" size="30">
          <div id="J_upload_imgss" class="upload_btn"><span>{:L('upload')}</span></div>
      </td>
    </tr>


    <tr>
	    <th>首页描述 :</th>
            <td>
                <input type="text" name="intro" class="input-text fl mr10" value="{$info.intro}" size="30" />
            </td>
        </tr>
    <tr>
	    <th>报名描述 :</th>
            <td>
                <textarea style="height: 70px;width:260px;" name="bm_infro">{$info.bm_infro}</textarea>
            </td>
        </tr>
	<tr>
	    <th>网站链接 :</th>
            <td>
                <input type="text" name="url" class="input-text fl mr10" size="30" value="{$info.url}" />
            </td>
        </tr>
	    <tr>
			<th>状态 :</th>
			<td>
				<label><input type="radio" name="status" value="0" <if condition="$info.status eq 0">checked</if>> 不显示</label>&nbsp;&nbsp;
				<label><input type="radio" name="status" value="1" <if condition="$info.status eq 1">checked</if>> 显示</label>
			</td>
		</tr>
		 <tr>
			<th>状态 :</th>
			<td>
				<label><input type="radio" name="bm_xs" value="0" <if condition="$info.bm_xs eq 0">checked</if>> 不显示</label>&nbsp;&nbsp;
				<label><input type="radio" name="bm_xs" value="1" <if condition="$info.bm_xs eq 1">checked</if>> 显示</label>
			</td>
		</tr>
 

		</table>
		</div>


 
		<div class="content_list pad_10 hidden">
		<table width="100%" cellpadding="2" cellspacing="1" class="table_form">


		<tr>
			<th width="100">{:L('seo_title')} :</th>
			<td><input type="text" name="seo_title" class="input-text" value="{$info.seo_title}" style="width:300px;"></td>
		</tr>
		<tr>
			<th>{:L('seo_keys')} :</th>
			<td><input type="text" name="seo_keys" class="input-text" value="{$info.seo_keys}" style="width:300px;"></td>
		</tr>
		<tr>
			<th>{:L('seo_desc')} :</th>
			<td><textarea name="seo_desc" style="width:295px; height:50px;">{$info.seo_desc}</textarea></td>
		</tr>
	</table>
	</div>
        
        </div>
	<input type="hidden" name="id" value="{$info.id}" />
</form>
</div>
<script src="__STATIC__/js/fileuploader.js"></script>
<script>
$('.J_cate_select').cate_select('请选择');
var check_name_url = "{:U('zc_cate/ajax_check_name', array('id'=>$info['id']))}";
$(function(){
	$.formValidator.initConfig({formid:"info_form",autotip:true});
	$('#J_name').formValidator({onshow:lang.please_input+lang.items_cate_name,onfocus:lang.please_input+lang.items_cate_name}).inputValidator({min:1,onerror:lang.please_input+lang.items_cate_name});
	
	$('#info_form').ajaxForm({success:complate, dataType:'json'});
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
        action: "{:U('zc_cate/ajax_upload_img', array('type'=>'pic_url'))}",
        inputName: 'pic_url',
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
        button: document.getElementById('J_upload_imgs'),
        multiple: false,
        action: "{:U('zc_cate/ajax_upload_img', array('type'=>'banner_pic'))}",
        inputName: 'banner_pic',
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
            $('#J_upload_imgs').addClass('btn_disabled').find('span').text(lang.uploading);
        },
        onComplete: function(id, fileName, result){
            $('#J_upload_imgs').removeClass('btn_disabled').find('span').text(lang.upload);
            if(result.status == '1'){
                $('#J_imgs').val(result.data);
            } else {
                $.ftxia.tip({content:result.msg, icon:'error'});
            }
        }
    });

    var extimg_uploaders = new qq.FileUploaderBasic({
        allowedExtensions: ['jpg','gif','jpeg','png','bmp','pdg'],
        button: document.getElementById('J_upload_imgss'),
        multiple: false,
        action: "{:U('zc_cate/ajax_upload_img', array('type'=>'body_pic'))}",
        inputName: 'body_pic',
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
            $('#J_upload_imgss').addClass('btn_disabled').find('span').text(lang.uploading);
        },
        onComplete: function(id, fileName, result){
            $('#J_upload_imgss').removeClass('btn_disabled').find('span').text(lang.upload);
            if(result.status == '1'){
                $('#J_imgss').val(result.data);
            } else {
                $.ftxia.tip({content:result.msg, icon:'error'});
            }
        }
    });

});
</script>