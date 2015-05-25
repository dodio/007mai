<notempty name="ad_list">
 <div class="top_bar">
	<ul id="banner_list" class="banner">
	<volist name="ad_list" id="ad" key="i">
		<li style="background:url({:attach($ad['content'],'advert')}) no-repeat center center;" ><a  title="{$ad.desc}"   target="_blank" href="{$ad.url}" class="pic"></a></li>
	</volist>
	</ul>
</div>
  <div class="top_wrap {:C('ftx_site_wc')}">
    <div class="top_box">
      <div class="round">
          <div class="adType"></div>
      </div>
      <div style="display:none;" class="banner_arrow" data-banner="arrow">
          <a href="javascript:;" class="arrow_prev" data-arrow="prev"><i></i></a>
          <a href="javascript:;" class="arrow_next" data-arrow="next"><i></i></a>
      </div>
    </div>
  </div>
</notempty>