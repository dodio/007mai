<div class="show-item item {$item.class}" id="nid_{$item.num_iid}">
  <div class="show-pic">
    <a biz-itemid="{$item['num_iid']}" isconvert=1 href="" target="_blank">
      <?php if($i < 12 ) { ?>
      <img src='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}"  />
      <?php }else{ ?>
      <img src='__STATIC__/assets/images/blank.gif' data-original='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}" class="lazy"   />
      <?php } ?>
    </a>
  </div>
  <div class="show-name"><a biz-itemid="{$item['num_iid']}" isconvert=1 target="_blank" href="">{$item.title}</a></div>
  <div class="item-info group">
    <div class="item-price fl">
      <s>¥{$item.price}</s>
      <span>¥{$item.coupon_price}</span>
    </div>
    <div class="item-sell fr">
      <if condition="$item.volume gt 0 "><span class="sold">已售<em>{$item.volume}</em></span><else/><span>新品上架</span></if><span class="ml10">({$item.zk}折)</span></div>
  </div>
  <div class="item-shop">
    <if condition="$item.shop_type eq 'C' ">
    <i class="icon-taobao icon"></i>淘宝：<a data-type="1" biz-sellerid="{$item['sellerId']}" data-tmpl="140x190" data-tmplid="3" data-rd="2" data-style="1" data-border="1" href="#">{$item.nick}</a>
    <elseif condition="$item.shop_type eq 'B' " />
    <i class="icon-tmall icon"></i>天猫：<a data-type="1" biz-sellerid="{$item['sellerId']}" data-tmpl="140x190" data-tmplid="3" data-rd="2" data-style="1" data-border="1" href="#">{$item.nick}</a>
    <elseif condition="$item.shop_type eq 'D' " />
    <a href="{$item.click_url}" target="_blank" rel="nofollow"><span>京东</span></a>
    <else />
    <a href="" biz-itemid="{$item['num_iid']}" isconvert=1 target="_blank" rel="nofollow"><span>去抢购</span></a>
    </if>
  </div>
</div>