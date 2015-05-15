<notempty name="ad_list">
<div class="area">
	<ul class="banner">
	<volist name="ad_list" id="ad" key="i">
		<li><a title="{$ad.desc}" href="{$ad.url}"><img class="lazy" _src="{:attach($ad['content'],'advert')}" src="http://s.juancdn.com/juanpi/img/blank.gif"></a></li>
	</volist>
	</ul>
	<div class="adType"></div>
</div>
</notempty>