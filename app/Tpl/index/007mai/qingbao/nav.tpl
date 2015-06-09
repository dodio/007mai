<div class="cate-nav-wrap">
  <div class="jiu-nav-main jiu-nav-main-2">
      <div class="jiu-nav page007mai  seclevelinner">
        <div class="nav-item  ">
          <div class="item-list">
            <ul>
              <volist name="subnav" id="s">
              <li><a href="/qingbao/{$nav_curr}/cid/{$s.id}" <if condition="$s['id'] eq $cid">class="active"</if>>{$s.name}</a></li>
              </volist>
            </ul>
          </div>
          <div class="n_h">
            <if condition="$chanel_id eq $cid">
            <a href="{:U('qingbao/'.$nav_curr,array('sort'=>'default'))}"  class=" <if condition="$list_info['sort'] eq 'default'"> active </if> ">默认</a>
            <a href="{:U('qingbao/'.$nav_curr,array('sort'=>'new'))}" class=" <if condition="$list_info['sort'] eq 'new'"> active </if> ">最新</a>
            <a href="{:U('qingbao/'.$nav_curr,array('sort'=>'hot'))}" class=" <if condition="$list_info['sort'] eq 'hot'"> active </if> ">最热</a>
            <else/>
            <a href="{:U('qingbao/'.$nav_curr,array('cid'=>$cid, 'sort'=>'default'))}"  class=" <if condition="$list_info['sort'] eq 'default'"> active </if> ">默认</a>
            <a href="{:U('qingbao/'.$nav_curr,array('cid'=>$cid, 'sort'=>'new'))}" class=" <if condition="$list_info['sort'] eq 'new'"> active </if> ">最新</a>
            <a href="{:U('qingbao/'.$nav_curr,array('cid'=>$cid, 'sort'=>'hot'))}" class=" <if condition="$list_info['sort'] eq 'hot'"> active </if> ">最热</a>
            </if>
          </div>
        </div>
      </div>
    </div>
</div>