<div class="price-filter group">
  <div class="label fl">价格：</div>
  <div class="fl">
    <a href="{:U(__ACTION__,array('cid'=>$cid))}#root_cates" class=" <if condition="$list_info['price'] eq ''"> cur </if> ">全部</a>
    <a href="{:U(__ACTION__,array('cid'=>$cid,'price'=>'~50'))}#root_cates" class=" <if condition="$list_info['price'] eq '~50'"> cur </if> ">50以下</a>
    <a href="{:U(__ACTION__,array('cid'=>$cid,'price'=>'50~100'))}#root_cates" class=" <if condition="$list_info['price'] eq '50~100'"> cur </if> ">50~100</a>
    <a href="{:U(__ACTION__,array('cid'=>$cid,'price'=>'100~200'))}#root_cates" class=" <if condition="$list_info['price'] eq '100~200'"> cur </if> ">100~200</a>
    <a href="{:U(__ACTION__,array('cid'=>$cid,'price'=>'200~'))}#root_cates" class=" <if condition="$list_info['price'] eq '200~'"> cur </if> ">200以上</a>
  </div>
</div>