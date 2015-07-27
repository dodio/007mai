<include file="public:header" />
<!--采集 设置-->
<div class="subnav">
    <div class="content_menu ib_a blue line_x">
		<a  class="on"><em>采集设置</em></a>
	</div>
</div>
<div class="pad_lr_10">
	<form id="info_form" action="{:u('setting/edit')}" method="post">
		<table width="100%" class="table_form contentWrap">
			<tr>
				<th width="150">默认活动时间 :</th>
				<td><input type="text" name="setting[coupon_add_time]" size="10" class="input-text" value="{:C('ftx_coupon_add_time')}" />&nbsp;&nbsp;小时&nbsp;&nbsp;<span class="gray">一般72小时，三天过期（采集的时候自动设置）</span></td>
			</tr>

			<tr>
				<th width="150">前台管理员 :</th>
				<td><input type="text" name="setting[index_admin]" size="30" class="input-text" value="{:C('ftx_index_admin')}" />&nbsp;&nbsp;&nbsp;&nbsp;<span class="gray">前台管理员</span></td>
			</tr>

			<tr>
			    <th width="150">采集遇到淘宝限制 :</th>
			    <td>
				<label><input type="radio" <if condition="C('ftx_robot_wait') eq '1'">checked="checked"</if> value="1" name="setting[robot_wait]">自动停止 不采集</label> &nbsp;&nbsp;
				<label><input type="radio" <if condition="C('ftx_robot_wait') eq '0'">checked="checked"</if> value="0" name="setting[robot_wait]">跳过 继续采集下一个</label>
				<span class="gray ml10"> </span>
			    </td>
			</tr>

			<tr>
        		<th></th>
        		<td><input type="hidden" name="menuid"  value="{$menuid}"/>
				<input type="submit" class="smt mr10" name="do" value="{:L('submit')}"/></td>
    		</tr>
 
      
		</table>
	</form>
</div>
<include file="public:footer" />
</body>
</html>