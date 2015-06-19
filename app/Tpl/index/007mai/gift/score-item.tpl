<div class="show-item show-normal item" id="item_{$item.id}">
  <div class="show-pic">
    <a href="{:U('gift/detail', array('id'=>$item['id']))}" target="_blank">
      <?php if($i < 8 ) { ?>
      <img src='{:attach(str_replace('_s.'.array_pop(explode('.', $item['img'])), '_b.'.array_pop(explode('.', $item['img'])), $item['img']), 'score_item')}' alt="{$item.title}"  />
      <?php }else{ ?>
      <img src='__STATIC__/assets/images/blank.gif' data-original='<img src="{:attach(str_replace('_s.'.array_pop(explode('.', $item['img'])), '_b.'.array_pop(explode('.', $item['img'])), $item['img']), 'score_item')}' alt="{$item.title}" class="lazy"   />
      <?php } ?>
    </a>
  </div>
  <div class="show-name"><a target="_blank" href="{:U('gift/detail', array('id'=>$item['id']))}">{$item.title}</a></div>
  <div class="time-info group">
    <?php if ($start_time > time()): ?>
        <em class="time_count fl" data-time="{$item.start_time}">
          
        </em><span class="label fr start">开始</span>
    <?php else: ?>
      <em class="time_count fl" data-time="{$item.end_time}">
          <span class="d">1</span>天
          <span class="h">20</span>小时
          <span class="mm">30</span>分
          <span class="ss">30</span>秒
        </em><div class="fl tip">之后</div><span class="label fr end">结束</span>
    <?php endif ?>
  </div>

  <div class="item-info group">
    <div class="item-score fl">
      <em>{$item.score}</em><span>情报</span>  
    </div>
    <div class="fr">
      <div class="kucun">库存:{$item.stock}</div>
      <a class="btn-exchange" target="_blank" href="{:U('gift/detail', array('id'=>$item['id']))}">兑换</a>
    </div>
  </div>
</div>