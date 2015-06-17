<ul class="bk-list group">
    <volist name="items_list" id="item" key="i" offset="0" length="10" mod="5">
        <li <eq name="mod" value="4">class="mr0"</eq> >
          <div class="baokuan-item" id="nid_{$item.num_iid}">
            <div class="bk-pic">
              <a biz-itemid="{$item['num_iid']}" isconvert=1 href="" target="_blank"><img src='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}"  /></a>
            </div>
            <div class="bk-name"><a biz-itemid="{$item['num_iid']}" isconvert=1 href="" target="_blank">{$item.title}</a></div>
            <div class="mt15">
              <s class="bk-price">¥{$item.price}</s>
              <span class="bk-coupon">¥{$item.coupon_price}</span>
              <span class="bk-sell ml10">已售:{$item.volume}</span>
              <span class="bk-zk ml10">{$item.zk}折</span>
            </div>
            <div class="bk-reason mt15">
              推荐理由：<i class="icon heart3-icon"></i>{$item.intro}
            </div>
            <div class="bk-mask">
              <a href="" biz-itemid="{$item['num_iid']}" isconvert=1 target="_blank" class="bk-link">
                <div class="bk-maimaimai">立即购买</div>
              </a>
            </div>
          </div>
        </li>
    </volist>
</ul>
<ftx:load type="js" href="
__STATIC__/assets/js/lib/cursorMask.js
"/>
<script>
  $(function(){
    $(".baokuan-item").cursorMask();
  });
</script>