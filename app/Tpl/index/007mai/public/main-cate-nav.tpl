<notempty name="top_cates">
  <div class="jiu-nav-main">
    <div class="jiu-nav main page007mai">
      <div class="nav-item fl">
        <div class="item-list">
          <ul>
          <volist name="top_cates" id="bcate">
            <li><a <if condition="($rootid eq $bcate['id'])">class="active"</if> href="{:U('index/cate', array('cid'=>$bcate['id']))}" title="{$bcate.name}">{$bcate.name}</a></li> 
          </volist>
          </ul>
        </div>
      </div>
      <div class="n_h">
        <a href="{:U('index/cate',array('cid'=>$cid,'sort'=>'default','price'=>$list_info['price']))}"  class=" <if condition="$list_info['sort'] eq 'default'"> active </if> ">默认</a>
        <a href="{:U('index/cate',array('cid'=>$cid,'sort'=>'new','price'=>$list_info['price']))}" class=" <if condition="$list_info['sort'] eq 'new'"> active </if> ">最新</a>
        <a href="{:U('index/cate',array('cid'=>$cid,'sort'=>'hot','price'=>$list_info['price']))}" class=" <if condition="$list_info['sort'] eq 'hot'"> active </if> ">最热</a>

        <a href="{:U('index/cate',array('cid'=>$cid))}" class=" <if condition="$list_info['price'] eq ''"> active </if> ">全部</a>
        <a href="{:U('index/cate',array('cid'=>$cid,'price'=>'~50'))}" class=" <if condition="$list_info['price'] eq '~50'"> active </if> ">50以下</a>
        <a href="{:U('index/cate',array('cid'=>$cid,'price'=>'50~100'))}" class=" <if condition="$list_info['price'] eq '50~100'"> active </if> ">50~100</a>
        <a href="{:U('index/cate',array('cid'=>$cid,'price'=>'100~200'))}" class=" <if condition="$list_info['price'] eq '100~200'"> active </if> ">100~200</a>
        <a href="{:U('index/cate',array('cid'=>$cid,'price'=>'200~'))}" class=" <if condition="$list_info['price'] eq '200~'"> active </if> ">200以上</a>
      </div>
    </div>
  </div>
</notempty>