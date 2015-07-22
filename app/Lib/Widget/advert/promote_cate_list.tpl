<notempty name="ad_list">
  <dl>
    <?php $ad = array_shift($ad_list); ?>
  <dt><a href="{$ad.url}" target="blank">{$ad.name}<em>{$ad.desc}</em></a></dt>
  <volist name="ad_list" id="ad">
    <dd><a href="/advert/tgo/id/{$ad.id}" target="_blank" <?php if ($ad['extval']==1): ?>    class="highlight"<?php endif ?>>{$ad.name}</a></dd>
  </volist>
</dl>
</notempty>