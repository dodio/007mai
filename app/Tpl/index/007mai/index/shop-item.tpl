<div id="shop_{$shop.sellerId}" class="show-item shop mb20">
  <div class="show-pic">
    <a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank"><img src="{:attach($shop['img'],"images")}" alt=""></a>
  </div>
  <div class="show-name group">
    <a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" class="fl">{$shop.name}</a>
    <notempty name="shop.average_price">
      <span class="fr shop-price">均价: <em>{$shop.average_price}</em></span>
    </notempty>
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
          <i class="heart1-icon icon"></i>{$shop.level}人关注
        <else/>
          <i class="icon heart3-icon"></i>
        </notempty>
      </div>
    </div>
  </if>
  <block name="reason"></block>
  <a data-type="1" biz-sellerid="{$shop['sellerId']}" isconvert=1 href="{$shop.url}" target="_blank" class="shop-go mt10">进店逛逛</a>
</div>