<style>
  .w1005 .page007mai{
    left: 0;
  }
</style>
<notempty name="ad_list">
<div class="group" style="background-color:{$board_info.description};">
  <?php
    $big_banner = array_shift($ad_list);
   ?>
  <div class="group mall_banner">
    <div class="top-tms-container">
      <div class="img-wrap">
          <a href="{$big_banner.url}" target="_blank"><img src="{:attach($big_banner['content'],'advert')}"></a>
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

  <div class="group middle l-floor page007mai">
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
         <a href="{$ad.url}" target="_blank"> <img class="brand-pic" src="{:attach($ad['content'],'advert')}" />
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
</div>
</notempty>
