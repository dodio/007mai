<div class="show-item item {$item.class}" data-nid="{$item.num_iid}" id="nid_{$item.num_iid}">
  <div class="show-pic">
    <a biz-itemid="{$item['num_iid']}" isconvert=1 href="/jump/index/iid/{$item['num_iid']}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '宝贝', '{$cate_data[$item['cate_id']]['name']}',(new Date().getHours()),'nid_{$item.num_iid}']);">
      <?php if(isset($lazy_item_num) && $i < $lazy_item_num) { ?>
      <img src='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}"  />
      <?php }else{ ?>
      <img src='__STATIC__/assets/images/blank.gif' data-original='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$cate_data[$item['cate_id']]['name']}" class="lazy"   />
      <?php } ?>
    </a>
  </div>
  <div class="group mt10">
    <div class="show-name fl"><a biz-itemid="{$item['num_iid']}" isconvert=1 target="_blank" href="/jump/index/iid/{$item['num_iid']}" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '宝贝', '{$cate_data[$item['cate_id']]['name']}',(new Date().getHours()),'nid_{$item.num_iid}']);">{$item.title}</a></div>
    <div class="item-sell fr">
      <if condition="$item.volume gt 0 "><span class="sold">已售<em>{:friend_number($item['volume'])}件</em></span><else/><span>新品上架</span></if>
    </div>
  </div>
  
  <div class="mt10 group">
    <div class="item-coupron_price fl ml10">¥<strong>{$item.coupon_price}</strong></div>
      <div class="fl ml10">
        <div class="item-price mt5">
          <s>原价:¥{$item.price}</s>
        </div>
        <div class="item-zk">{$item.zk}折</div>
      </div>

      <div class="item-shop mt10 fr">
        <if condition="$item.shop_type eq 'C' ">
        <a biz-itemid="{$item['num_iid']}" isconvert=1 href="/jump/index/iid/{$item['num_iid']}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '宝贝', '{$cate_data[$item['cate_id']]['name']}',(new Date().getHours()),'nid_{$item.num_iid}']);">
        <i class="icon-taobao icon"></i>淘宝</a>
        <elseif condition="$item.shop_type eq 'B' " /><a biz-itemid="{$item['num_iid']}" isconvert=1 href="/jump/index/iid/{$item['num_iid']}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '宝贝', '{$cate_data[$item['cate_id']]['name']}',(new Date().getHours()),'nid_{$item.num_iid}']);">
        <i class="icon-tmall icon"></i>天猫</a>
        </if>
        <a class="btn_go" biz-itemid="{$item['num_iid']}" isconvert=1 href="/jump/index/iid/{$item['num_iid']}" target="_blank" rel="nofollow" onclick="_czc.push(['_trackEvent', '联盟点击', '宝贝', '{$cate_data[$item['cate_id']]['name']}',(new Date().getHours()),'nid_{$item.num_iid}']);">去看看</a>
      </div>
  </div>

  <!-- like -->
    <if condition="$nav_curr eq 'like'">
    <a href="javascript:" class="my-like" lkid="{$item.id}" gtype="1" lks="0" title="取消收藏"><i class="like-ico l-active"><span class="heart_left"></span><span class="heart_right"></span></i></a>
    <else/>
    <a href="javascript:" class="my-like" lkid="{$item.id}" gtype="1" lks="1" title="加入收藏"><i class="like-ico "><span class="heart_left"></span><span class="heart_right"></span></i></a>
    </if>
    <!-- end like -->
</div>