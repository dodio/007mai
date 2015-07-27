<div id="shop_{$shop.sellerId}" class="show-item shop mb20">
  <div class="show-pic">
    <a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{:U('shop/index',array('id'=>$shop['id']))}" target="_blank" rel="nofollow">
      <?php if(isset($lazy_shop_num) && $i < $lazy_shop_num) { ?>
      <img src="{:attach($shop['img'],"images")}" alt="{$shop.name}">
      <?php }else{ ?>
      <img src='__STATIC__/assets/images/blank.gif' data-original='{:attach($shop['img'],"images")}' alt="{$shop.name}" class="lazy"   />
      <?php } ?>
    </a>
  </div>
  <div class="show-name group">
    <a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{:U('shop/index',array('id'=>$shop['id']))}" target="_blank" class="fl" rel="nofollow">{$shop.name}</a>
    <if condition="$shop['average_price'] neq '0.00'">
      <span class="fr shop-price">均价: <em>{$shop.average_price}</em></span>
    </if>
  </div>
  
  <if condition="$shop.shop_type eq 'C'">
    <div class="show-info group">
      <div class="taobao fl"><i class="icon icon-taobao"></i>淘宝</div>
      <div class="fr"><div class="taobaorank rank-r{$shop.level}"></div></div>
    </div>
  <elseif condition="$shop.shop_type eq 'B'"/>
    <div class="show-info group">
      <div class="taobao fl"><i class="icon icon-tmall"></i>天猫</div>
      <div class="fr">
        <notempty name="shop.level">
          <i class="heart1-icon icon"></i>{:friend_number($shop['level'])}人关注
        <else/>
          <i class="icon heart3-icon"></i>
        </notempty>
      </div>
    </div>
  </if>
  <block name="reason"></block>
  <a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" class="shop-go mt10" rel="nofollow">进店逛逛</a>
</div>