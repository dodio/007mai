	<div id="goods">
		<section class="goods" id="goods">
		<ul class="goods-list clear" id="goods_block">
		<volist name="items_list" id="item" key="i">
			<li>
				<a class="goods-a" biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}" target="_blank">
					<img class="lazy" _src="{$item.pic_url}_310x310.jpg" src="__STATIC__/jky/images/blank.gif">            
					<span class="icon new">新品</span>
				</a>
				<a biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}"  target="_blank"><h3>{$item.title}</h3>
				<div class="list-price buy "><span class="price-new"><i>￥</i>{$item.coupon_price}</span><i class="del">￥{$item.price}</i><span class="good-btn"><if condition="$item.shop_type eq 'C' ">去淘宝<elseif condition="$item.shop_type eq 'B' " />去天猫</if></span></div></a>
			</li>
		</volist>
		</ul>
		</section>
		<div class="paging">
			<div class="paging-nav">
			{$page}
			</div>
		</div>
	</div>