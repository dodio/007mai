<notempty name="ad_list">
<ul class="spi-list">
  <volist name="ad_list" id="ad" key="i">
   <li><a href="{$ad.url}" title="{$ad.desc}" target="_blank"><span></span><img src="{:attach($ad['content'],'images')}" alt="" /></a></li>
  </volist>
</ul>
</notempty>