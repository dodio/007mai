<ul class="bk-list group">
    <volist name="jingxuan_list" id="item" key="i" offset="0" length="10" mod="5">
        <li <eq name="mod" value="4">class="mr0"</eq> >
          <div class="baokuan-item" id="nid_{$item.num_iid}">
            <div class="bk-pic">
                <if condition="$item.pic_urls neq ''">
                <img src='{:attach($item['pic_urls'],'item')}' alt="{$item.title}"  />
                <else/>
                <img src='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}"  />
                </if>
              </a>
            </div>
            <div class="mt15">
              <!-- <s class="bk-price">¥{$item.price}</s> -->
              <span class="bk-coupon">¥{$item.coupon_price}</span>
              <span class="bk-sell ml5">已售:{:friend_number($item['volume'])}</span>
              <!-- <span class="bk-zk ml5">{$item.zk}折</span> -->
            </div>
            <!-- <div class="bk-reason mt15">
              推荐理由：<i class="icon heart3-icon"></i>
            </div>
            <div class="bk-reason mt10">{$item.intro}</div> -->
            <div class="bk-mask">
                <div class="bk-maimaimai">立即购买</div>
              </a>
            </div>
            <!-- like -->
            <if condition="$nav_curr eq 'like'">
            <a href="javascript:" class="my-like" lkid="{$item.id}" gtype="1" lks="0" title="取消收藏"><i class="like-ico l-active"><span class="heart_left"></span><span class="heart_right"></span></i></a>
            <else/>
            <a href="javascript:" class="my-like" lkid="{$item.id}" gtype="1" lks="1" title="加入收藏"><i class="like-ico "><span class="heart_left"></span><span class="heart_right"></span></i></a>
            </if>
            <!-- end like -->
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