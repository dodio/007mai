<div class="show-item item {$item.class}" data-nid="{$item.num_iid}" id="nid_{$item.num_iid}">
  <div class="show-pic">
    <a biz-itemid="{$item['num_iid']}" isconvert=1 href="" target="_blank" rel="nofollow">
      <?php if(isset($lazy_item_num) && $i < $lazy_item_num) { ?>
      <img src='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}"  />
      <?php }else{ ?>
      <img src='__STATIC__/assets/images/blank.gif' data-original='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}" class="lazy"   />
      <?php } ?>
    </a>
  </div>
  <div class="show-name"><a biz-itemid="{$item['num_iid']}" isconvert=1 target="_blank" href="" rel="nofollow">{$item.title}</a></div>
  <div class="item-info group">
    <div class="item-price fl">
      <s>¥{$item.price}</s>
      <span>¥{$item.coupon_price}</span>
    </div>
    <div class="item-sell fr">
      <if condition="$item.volume gt 0 "><span class="sold">已售<em>{:friend_number($item['volume'])}件</em></span><else/><span>新品上架</span></if><span class="item-zk">({$item.zk}折)</span></div>
  </div>
  <div class="item-shop">
    <if condition="$item.shop_type eq 'C' ">
    <i class="icon-taobao icon"></i>淘宝：<a data-type="1" biz-sellerid="{$item['sellerId']}" data-tmpl="140x190" data-tmplid="3" data-rd="2" data-style="1" data-border="1" href="javascript:">{$item.nick}</a>
    <elseif condition="$item.shop_type eq 'B' " />
    <i class="icon-tmall icon"></i>天猫：<a data-type="1" biz-sellerid="{$item['sellerId']}" data-tmpl="140x190" data-tmplid="3" data-rd="2" data-style="1" data-border="1" href="javascript:">{$item.nick}</a>
    <elseif condition="$item.shop_type eq 'D' " />
    <a href="{$item.click_url}" target="_blank" rel="nofollow"><span>京东</span></a>
    <else />
    <a href="" biz-itemid="{$item['num_iid']}" isconvert=1 target="_blank" rel="nofollow"><span>去抢购</span></a>
    </if>
  </div>

  <!-- like -->
    <if condition="$nav_curr eq 'like'">
    <a href="javascript:" class="my-like" lkid="{$item.id}" gtype="1" lks="0" title="取消收藏"><i class="like-ico l-active"><span class="heart_left"></span><span class="heart_right"></span></i></a>
    <else/>
    <a href="javascript:" class="my-like" lkid="{$item.id}" gtype="1" lks="1" title="加入收藏"><i class="like-ico "><span class="heart_left"></span><span class="heart_right"></span></i></a>
    </if>
    <!-- end like -->
</div>