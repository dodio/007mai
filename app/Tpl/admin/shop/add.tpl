<include file="public:header" />
<div class="subnav">
    <h1 class="title_2 line_x">添加店铺</h1>
</div>
<div class="pad_lr_10" >
    <form id="info_form" action="{:U('shop/add')}" method="post" >
    <table width="100%" cellspacing="0" class="table_form">
        <tbody>
      <tr>
                <th width="150">店铺名称：</th>
                <td>
                    <input name="name" type="text" id="J_name" class="input-text" size="20" />
                    <span class="gray ml10">请填写店铺名称</span>
                </td>
            </tr>
            <tr>
                <th>店铺地址：</th>
                <td>
                    <input name="url" type="text" class="input-text" size="20" />
                    <span class="gray ml10">填写阿里妈妈转换后的地址。</span>
                </td>
            </tr>
       <tr>
            <th>商家旺旺ID：</th>
                <td>
                    <input type="text" name="num_iid" size="10" class="input-text" value="" />
                    <span class="gray ml10">淘宝或者天猫的店铺商家旺旺id，填写方便淘点金</span>
                </td>
            </tr>

      <tr>
        <th width="120">所属分类：</th>
                <td>
          <select class="J_cate_select mr10" data-pid="0" data-uri="{:U('items_cate/ajax_getchilds', array('type'=>0))}" data-selected=""></select><input type="hidden" name="cate_id" id="J_cate_id" value="" />
        </td>
      </tr>
            <tr>
                <th>推荐理由：</th>
                <td>
                    <input name="reason" type="text" class="input-text" size="20" />
                </td>
            </tr>
      
        <tr>
          <th>店铺类型：</th>
          <td>
            <select name="shop_type" id="shop_type">
              <option value="B">天猫</option>
              <option value="C">淘宝</option>
            </select>
          </td>
        </tr>
        <tr id="level">  
          <th>店铺等级：</th>
          <td>
            <select name="level">
              <option value="">选择</option>
              <volist name="levels" id="name" key="val">
               <option value="{$val}">{$name}</option>
              </volist>
            </select>
          </td>
        </tr>

          <tr>
            <th>店铺图片：</th>
            <td>
                <div class="fl">
                  <input type="text" id="J_extimg" name="img" size="40" class="input-text" value=""/>
                </div>
                <div id="J_upload_extimg" class="upload_btn"><span>{:L('upload')}</span></div>
            </td>
          </tr>

            <tr>
                <th>平均价格：</th>
                <td>
                    <input type="text" name="average_price" size="10" class="input-text" value="0"/>
                </td>
            </tr>
            <tr>
                <th>有效时间：</th>
                <td>
                    开始时间:
                    <input type="text" id="start_time" name="start_time" size="12" class="date input-text" value=""/>
                    结束时间
                    <input type="text" id="end_time" name="end_time" size="12" class="date input-text" value=""/>
                </td>
            </tr>

            <tr>
                <th></th>
                <td>
                    <input type="submit" class="smt  mr10" value="{:L('submit')}" />
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</div>
<include file="public:footer" />
<link rel="stylesheet" type="text/css" href="__STATIC__/js/calendar/calendar-blue.css"/>
<script type="text/javascript" src="__STATIC__/js/calendar/calendar.js"></script>
<script src="/static/js/fileuploader.js"></script>
<script>
$('.J_cate_select').cate_select('请选择');
$(function(){

  $.formValidator.initConfig({formid:"info_form",autotip:true});

  $("#J_name").formValidator({onshow:'请填写店铺名称',onfocus:'请填写店铺名称'}).inputValidator({min:1,onerror:'请填写店铺名称'});

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

    
    $("#shop_type").change(function(){
        var type = $(this).val();
        if(type == "C"){
            $("#level").show();
        }else{
            $("#level").hide();
        }
    }).change();
});
</script>
</body>
</html>
