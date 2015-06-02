<notempty name="ad_list">
<div class="img_4column">
  <ul>
    <volist name="ad_list" id="ad" key="i">
      <li><a title="{$ad.desc}" href="{$ad.url}" target="_blank"><img src="{:attach($ad['content'],'advert')}"></a></li>
    </volist>
  </ul>
</div>
</notempty>