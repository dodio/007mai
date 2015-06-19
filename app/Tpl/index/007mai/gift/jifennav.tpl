
<div class="mai-nav">
  <div class="mai-nav-wrap container group">
    <div class="nav-item fl">
        <ul>
          <!-- <li><a href="{:U('gift/index')}" <if condition="$cid eq ''">class="active"</if>>热门兑换</a></li> -->
          <volist name="cate_list" id="cate">
          <li><a href="{:U('gift/cate',array('cid'=>$cate['id']))}" title="{$cate.name}" <if condition="$cid eq $cate['id']">class="active"</if>>{$cate.name}</a></li>
          </volist>
        </ul>
    </div>
  </div>
</div>