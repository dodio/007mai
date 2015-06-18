<?php 
    $cate = $cate_data[$cid];
    $top_cates = $cate_list['p'];
    if($cate['pid'] == 0){
      $rootid = $cid;
    }else{
      $parents_id = explode('|', $cate['spid']);
      $rootid = $parents_id[0];
    }
 ?>
<notempty name="top_cates">
<style>
  .sidenav.affix{
    top: 37px;
  }
</style>
<div id="root_cates" class="root_cates">
  <div class="rc_wrap">
    <div class="container mod_mid group">
      <ul class="mod_mid_wrap">
        <volist name="top_cates" id="bcate">
            <li class="mod_mid_item"><a <if condition="($rootid eq $bcate['id'])">class="cur"</if> href="{:U(__ACTION__,array("cid"=>$bcate['id']))}#root_cates" title="{$bcate.name}">{$bcate.name}</a></li> 
          </volist>
      </ul>
    </div>
  </div>
</div>
</notempty>

