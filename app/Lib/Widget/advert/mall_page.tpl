<notempty name="ad_list">
<div class="group" style="background-color:{$board_info.description};">
  <?php
    $big_banner = array_shift($ad_list);
   ?>
  <div class="group mall_banner">
    <div class="top-tms-container">
      <div class="img-wrap">
          <a href="/advert/tgo/id/{$big_banner.id}" target="_blank"><img src="{:attach($big_banner['content'],'images')}"></a>
      </div>
    </div>
  </div>
  
  <?php 
    $ad_group = array();
    $length = count($ad_list);
    $tmp = array();
    for ($i = 0; $i < $length ; $i++) { 
      if($ad_list[$i]['type'] == "text"){
        if(!empty($tmp)){
          $ad_group[] = $tmp;
          $tmp = array();
        }
        $tmp[] = $ad_list[$i];
      }else if($ad_list[$i]['type'] == "image"){
        $tmp[] = $ad_list[$i];
      }
    }
    if(!empty($tmp)){
      $ad_group[] = $tmp;
    }
   ?>

  <div class="group l-floor container">
    <?php 
    foreach ($ad_group as $group) {
      $title = array_shift($group);
     ?>
     <div class="l-f-title">{$title.name}</div>
     <div class="ju-itemlist"> 
      <ul class="group">
       <?php 
       foreach ($group as $ad) {
        ?>
       <li class="brand-mid-v2" title="{$ad.description}"> 
         <a href="/advert/tgo/id/{$ad.id}" target="_blank"> <img class="brand-pic" src="{:attach($ad['content'],'images')}" />
         </a> 
        </li> 
        <?php
          }
        ?>
      </ul> 
     </div> 

    <?php 
    }
     ?>
  </div>
  <style>
    .footer{
      margin-top: 0;
    }
  </style>
</div>
</notempty>
