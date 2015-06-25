<div class="show-item show-normal item {$item.class}" id="nid_{$item.num_iid}">
  <div class="show-pic">
    <a biz-itemid="{$item['num_iid']}" isconvert=1 href="" target="_blank" rel="nofollow">
      <?php if($i < 12 ) { ?>
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
      <if condition="$item.volume gt 0 "><span class="sold">已售<em>{$item.volume}</em></span><else/><span>新品上架</span></if><span class="ml10">({$item.zk}折)</span></div>
  </div>
  
</div>