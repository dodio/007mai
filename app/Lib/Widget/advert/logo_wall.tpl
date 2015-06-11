<div class="logowall group">
    <volist name="ad_list" id="ad" key="i">
      <a class="logo" title="{$ad.desc}" target="_blank" href="{$ad.url}">
        <img class="lazy" src="{:attach($ad['content'],'images')}">
      </a>
    </volist>
</div>
