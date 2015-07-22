<div class="logowall group">
    <volist name="ad_list" id="ad" key="i">
      <a class="logo" title="{$ad.desc}" target="_blank" href="/advert/tgo/id/{$ad.id}">
        <img class="lazy" src="{:attach($ad['content'],'images')}">
      </a>
    </volist>
</div>
