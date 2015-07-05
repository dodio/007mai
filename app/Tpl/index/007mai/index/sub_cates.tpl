<?php 
    $cate = $cate_data[$cid];
    if($cate['pid'] == 0){
      $rootid = $cid;
    }else{
      $parents_id = explode('|', $cate['spid']);
      $rootid = $parents_id[0];
    }
    if($cate_data[$rootid]){
      $erji = $cate_list['s'][$rootid];
    }
 ?>

<notempty name="erji">
<div class="subcates group">
  <div class="label fl">类型：</div>
  <div class="fl ml15">
    <volist name="erji" id="er">
    <div class="erji-box group">
      <a href="{:U(__ACTION__,array("cid"=>$er['id']))}#subates_nav" class="erji <if condition="$cid eq $er['id']">cur</if>">{$er.name}</a>
      <div class="sanji">
        <?php 
          $sanji = $cate_list['s'][$er['id']];
         ?>
        <volist name="sanji" id="san">
        <a href="{:U(__ACTION__,array("cid"=>$san['id']))}#subates_nav" <if condition="$cid eq $san['id']">class="cur"</if>>{$san.name}</a>
        </volist>
      </div>
    </div>
    </volist>
  </div>
</div>
</notempty>
