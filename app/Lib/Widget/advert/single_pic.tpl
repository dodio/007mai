<notempty name="ad_list">
<div class="mai007-picad">
  <?php $ad = $ad_list[0]; ?>
  <a title="{$ad.name}" href="{$ad.url}" target="_blank"><img src="{:attach($ad['content'],'images')}"></a>
</div>
</notempty>