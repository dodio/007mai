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
      <div class="nav-other fl">
        <ul>
          <li><a href="{:U('xinpin/index')}" ><i class="today"></i><span>今日新品</span></a><em>{$today_item}</em></li>
        </ul>
      </div>
      <div class="n_h">
        <span>排序：</span>
        <a href="{:U('index/cate',array('cid'=>$cid,'sort'=>'default'))}"  class=" <if condition="$index_info['sort'] eq 'default'"> active </if> ">默认</a>
        <a href="{:U('index/cate',array('cid'=>$cid,'sort'=>'new'))}" class=" <if condition="$index_info['sort'] eq 'new'"> active </if> ">最新</a>
        <a href="{:U('index/cate',array('cid'=>$cid,'sort'=>'hot'))}" class=" <if condition="$index_info['sort'] eq 'hot'"> active </if> ">最热</a>
      </div>
    </div>
  </div>
</notempty>