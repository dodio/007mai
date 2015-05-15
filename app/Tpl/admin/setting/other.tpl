<include file="public:header" />
<!--其他设置-->
<div class="pad_lr_10">
	<form id="info_form" action="{:u('setting/edit')}" method="post">
	<table width="100%" class="table_form contentWrap">
 
	<tr>
            <th width="150">跳转设置 :</th>
            <td>
                <label><input type="radio" <if condition="C('ftx_click_ai') eq '1'">checked="checked"</if> value="1" name="setting[click_ai]"> 不经过爱淘宝</label> &nbsp;&nbsp;
                <label><input type="radio" <if condition="C('ftx_click_ai') eq '0'">checked="checked"</if> value="0" name="setting[click_ai]"> 经过爱淘宝</label>
                <span class="gray ml10">根据淘宝规定，建议最好选择经过爱淘宝</span>
            </td>
        </tr>
	<tr>
            <th width="150">商品描述 :</th>
            <td>
                <label><input type="radio" <if condition="C('ftx_desc_rate') eq '1'">checked="checked"</if> value="1" name="setting[desc_rate]"> 云平台自动调用</label> &nbsp;&nbsp;
                <label><input type="radio" <if condition="C('ftx_desc_rate') eq '0'">checked="checked"</if> value="0" name="setting[desc_rate]"> 使用本地采集</label>
                <span class="gray ml10">关闭调用速度会加快[荐] </span>
            </td>
        </tr>
	<tr>
            <th width="150">一键延时增加时间 :</th>
            <td><input type="text" name="setting[item_add_time]" size="10" class="input-text" value="{:C('ftx_item_add_time')}" />&nbsp;&nbsp;小时&nbsp;&nbsp;<span class="gray">一般72小时，三天过期</span></td>
        </tr>

	<tr>
            <th>QQ :</th>
            <td><input type="text" name="setting[qq]" class="input-text" size="20" value="{:C('ftx_qq')}"></td>
        </tr>
	<tr>
            <th width="150">QQ特享群 :</th>
            <td><input type="text" name="setting[qq_qun]" size="20" class="input-text" value="{:C('ftx_qq_qun')}" />&nbsp;&nbsp;<span class="gray">QQ特享群</span></td>
        </tr>
	<tr>
            <th width="150">{:L('kefu_html')} :</th>
            <td>
                <input type="text" name="setting[kefu_html]" class="input-text" size="80" value="{:C('ftx_kefu_html')}">
                <span class="gray ml10"><br>前台客服链接：请填写如：http://amos.im.alisoft.com/msg.aw?v=2&uid=你的客服旺旺&site=cntaobao&s=2&charset=utf-8</span>
            </td>
        </tr>
	<tr>
            <th width="150">新浪微博 :</th>
            <td>
                <input type="text" name="setting[sina_url]" class="input-text" size="80" value="{:C('ftx_sina_url')}">
                <span class="gray ml10"><br>新浪微博地址</span>
            </td>
        </tr>
	<tr>
            <th width="150">QQ空间 :</th>
            <td>
                <input type="text" name="setting[qzone_url]" class="input-text" size="80" value="{:C('ftx_qzone_url')}">
                <span class="gray ml10"><br>QQ空间地址</span>
            </td>
        </tr>
	<tr>
            <th width="150">腾讯微博 :</th>
            <td>
                <input type="text" name="setting[tenxun_url]" class="input-text" size="80" value="{:C('ftx_tenxun_url')}">
                <span class="gray ml10"><br>腾讯微博地址</span>
            </td>
        </tr>
	<tr>
        	<th></th>
        	<td><input type="hidden" name="menuid"  value="{$menuid}"/><input type="submit" class="smt mr10" name="do" value="{:L('submit')}"/></td>
    	</tr>
 
       

 
	</table>
 
	</form>
</div>
<include file="public:footer" />
</body>
</html>