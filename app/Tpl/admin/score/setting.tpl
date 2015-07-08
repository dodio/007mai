<include file="public:header" />
<!--积分设置-->
<div class="pad_lr_10">
<form id="info_form" action="{:U('score/setting')}" method="post">
    <table width="100%" cellspacing="0" class="table_form">
        <thead>
        <tr>
            <th width="150" align="left">用户行为</th>
            <th width="150" align="left">情报</th>
            <th align="left">奖惩上限次数</th>
        </tr>
        </thead>
        <tbody>
<!--         <tr>
            <td><?php dump(C('ftx_score_rule')); ?></td>
        </tr> -->
        <tr>
            <td>注册赠送 :</td>
            <td><input type="text" name="score_rule[register]" class="input-text" size="10" value="{:C('ftx_score_rule.register')}"></td>
            <td>每人{:C('ftx_score_rule.register_nums')}次<input type="text" name="score_rule[register_nums]" class="input-text" size="10" value="1" style="display:none"></td>
        </tr>
        <tr>
            <td>每日登录 :</td>
            <td><input type="text" name="score_rule[login]" class="input-text" size="10" value="{:C('ftx_score_rule.login')}"></td>
            <td>每日 {:C('ftx_score_rule.login_nums')} 次<input type="text" name="score_rule[login_nums]" class="input-text" size="10" value="1" style="display:none"></td>
        </tr>
		<tr>
            <td>首次签到 :</td>
            <td><input type="text" name="score_rule[sign]" class="input-text" size="10" value="{:C('ftx_score_rule.sign')}"></td>
            <td>每日 {:C('ftx_score_rule.sign_nums')} 次
				<input type="text" name="score_rule[sign_nums]" class="input-text" size="10" value="1" style="display:none">
			</td>
        </tr>
		<tr>
            <td>签到情报递增 :</td>
            <td><input type="text" name="score_rule[sign_add]" class="input-text" size="10" value="{:C('ftx_score_rule.sign_add')}"></td>
            <td> </td>
        </tr>
		<tr>
            <td>签到天数封顶 :</td>
            <td><input type="text" name="score_rule[sign_day]" class="input-text" size="10" value="{:C('ftx_score_rule.sign_day')}"></td>
            <td> </td>
        </tr>

        <tr>
            <td>下载快捷方式 :</td>
            <td><input type="text" name="score_rule[download_shortcut]" class="input-text" size="10" value="{:C('ftx_score_rule.download_shortcut')}"></td>
            <td>每月{:C('ftx_score_rule.download_shortcut_nums')}次<input type="hidden" name="score_rule[download_shortcut_nums]" value="1"> </td>
        </tr>
        <tr>
            <td>快捷方式打开 :</td>
            <td><input type="text" name="score_rule[from_client]" class="input-text" size="10" value="{:C('ftx_score_rule.from_client')}"></td>
            <td>每日 {:C('ftx_score_rule.from_client_nums')} 次 <input type="text" name="score_rule[from_client_nums]" class="input-text" size="2" value="1" style="display: none;"></td>
        </tr>
        <tr>
            <td>给网站提建议 :</td>
            <td><input type="text" name="score_rule[advice_007mai]" class="input-text" size="10" value="{:C('ftx_score_rule.advice_007mai')}"></td>
            <td>每两周{:C('ftx_score_rule.advice_007mai_nums')}次<input type="hidden" name="score_rule[advice_007mai_nums]" value="1"> </td>
        </tr>
        <tr>
            <td>日常 :浏览10个页面</td>
            <td><input type="text" name="score_rule[read_page10]" class="input-text" size="10" value="{:C('ftx_score_rule.read_page10')}"></td>
            <td>每日 {:C('ftx_score_rule.read_page10_nums')} 次 <input type="text" name="score_rule[read_page10_nums]" class="input-text" size="2" value="1" style="display: none;"></td>
        </tr>
        <tr>
            <td>日常 :浏览50个页面</td>
            <td><input type="text" name="score_rule[read_page50]" class="input-text" size="10" value="{:C('ftx_score_rule.read_page50')}"></td>
            <td>每日 {:C('ftx_score_rule.read_page50_nums')} 次 <input type="text" name="score_rule[read_page50_nums]" class="input-text" size="2" value="1" style="display: none;"></td>
        </tr>
		<tr>
            <td>邀请访问奖励 :</td>
            <td><input type="text" name="score_rule[union_visit]" class="input-text" size="10" value="{:C('ftx_score_rule.union_visit')}"></td>
            <td>每天 <input type="text" name="score_rule[union_visit_nums]" class="input-text" size="2" value="{:C('ftx_score_rule.union_visit_nums')}" > 次</td>
        </tr>

		<tr>
            <td>邀请注册奖励 :</td>
            <td><input type="text" name="score_rule[union_reg]" class="input-text" size="10" value="{:C('ftx_score_rule.union_reg')}"></td>
            <td>每月 <input type="text" name="score_rule[union_reg_nums]" class="input-text" size="2" value="{:C('ftx_score_rule.union_reg_nums')}" > 次</td>
        </tr>
        <tr>
            <td colspan="3"><input type="submit" value="{:L('submit')}" id="dosubmit" name="dosubmit" class="smt mr10" /></td>
        </tr>
    </tbody>
    </table>
</form>
</div>
<include file="public:footer" />
<script>
$('#score_setting').find('input').live('keyup keydown blur',function(){
    var self = $(this);
    var val = self.val();
    val = val.replace(/[^0-9]/g,'');
    self.val(val);
});
</script>
</body>
</html>