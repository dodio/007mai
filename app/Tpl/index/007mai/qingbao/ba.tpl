
<extend name="index:cate" />
<block name="pricefilter"></block>
<block name="subcates">
  <?php 
    $cate = $cate_data[$cid];
    if($cate['pid'] == 0){
      $rootid = $cid;
    }else{
      $parents_id = explode('|', $cate['spid']);
      $rootid = $parents_id[0];
    }
    if($cate_data[$rootid]){
      $tmp2 = $cate_list['s'][$rootid];
    }
    $counts = array();
    foreach ($cate_count as $value) {
      $counts[$value['cate_id']] = $value['count(cate_id)'];
    }
    $cate_count_ids = array_keys($counts);
    $erji = array();
    foreach ($tmp2 as $er) {
      if(in_array($er['id'], $cate_count_ids)){
        $erji[]=$er;
        continue;
      }
      $sanji = $cate_list['s'][$er['id']];
      foreach ($sanji as $san) {
        if(in_array($san['id'], $cate_count_ids)){
          $erji[] = $er;
          break;
        }
      }
    }
 ?>
<notempty name="erji">
<div class="subcates group">
  <div class="label fl">类型：</div>
  <div class="fl ml15">
    <volist name="erji" id="er">
    <div class="erji-box group">
      <a href="{:U(__ACTION__,array("cid"=>$er['id']))}#root_cates" class="erji <eq name="er.ishot" value="1">highlight</eq> <if condition="$cid eq $er['id']">cur</if>">{$er.name}</a>
      <?php $sanji = $cate_list['s'][$er['id']]; ?>
      <div class="sanji">
        <volist name="sanji" id="san">
          <?php if ($counts[$san['id']]): ?>
            <a href="{:U(__ACTION__,array("cid"=>$san['id']))}#root_cates" class="<eq name="san.ishot" value="1">highlight</eq> <if condition="$cid eq $san['id']">class="cur"</if>>{$san.name}({$counts[$san['id']]})</a>
          <?php endif; ?>
        </volist>
      </div>
    </div>
    </volist>
  </div>
</div>
</notempty>

</block>