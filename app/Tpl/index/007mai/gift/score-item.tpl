<div class="show-item show-normal score-item" id="scoreitem_{$item.id}">
  <div class="show-pic">
    <a href="{:U('gift/detail', array('id'=>$item['id']))}" target="_blank">
      <?php if($i < $lazy_score_num ) { ?>
      <img src='{:attach(str_replace('_s.'.array_pop(explode('.', $item['img'])), '_b.'.array_pop(explode('.', $item['img'])), $item['img']), 'score_item')}' alt="{$item.title}"  />
      <?php }else{ ?>
      <img src='__STATIC__/assets/images/blank.gif' data-original='{:attach(str_replace('_s.'.array_pop(explode('.', $item['img'])), '_b.'.array_pop(explode('.', $item['img'])), $item['img']), 'score_item')}' alt="{$item.title}" class="lazy"   />
      <?php } ?>
    </a>
  </div>
  <div class="show-name"><a target="_blank" href="{:U('gift/detail', array('id'=>$item['id']))}">{$item.title}</a></div>
  <div class="time-info group">
  <?php if ($item['start_time'] > time()): ?>
      <em class="time_count fl" data-time="{$item.start_time}"></em>
      <div class="fl tip">之后</div>
      <span class="label fr start">开始</span>
  <?php else: ?>
    <em class="time_count fl" data-time="{$item.end_time}"></em>
    <div class="fl tip">之后</div>
    <span class="label fr end">结束</span>
  <?php endif ?>
  </div>

  <div class="item-info group">
    <div class="item-score fl">
      <em>{$item.score}</em><span>情报</span>  
    </div>
    <div class="fr">
      <div class="kucun">库存:{$item.stock}</div>
      <?php if ($item['stock'] < 1): ?>
        <a class="btn-exchange disable" target="_blank" href="{:U('gift/detail', array('id'=>$item['id']))}">已兑光</a>
      <?php else: ?>
        <a class="btn-exchange" target="_blank" href="{:U('gift/detail', array('id'=>$item['id']))}"><?php if ($item['start_time'] > time()): ?>查看 <?php else: ?>兑换 <?php endif ?> </a>
      <?php endif ?>
      
    </div>
  </div>
</div>