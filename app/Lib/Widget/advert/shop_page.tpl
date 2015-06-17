<style>
  .w1005 .page007mai{
    left: 0;
  }
</style>
<notempty name="ad_list">
<div class="group" style="{:background($board_info['description'],'images')}">
  <?php
    $big_banner = array_shift($ad_list);
   ?>
  <div class="group mall_banner" style="{:background($big_banner['desc'],'images')} height: 320px;">
    <div class="top-tms-container"><div class="img-wrap"><img src="{:attach($big_banner['content'],'images')}"/></div></div>
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
  
  <style>
    .l-title_bar{
      height: 60px;
      overflow: hidden;
      width: 100%;
    }
  </style>
  <div class="group">
    <?php 
    foreach ($ad_group as $group) {
      $title = array_shift($group);
     ?>
     <?php if($title['content'] != ""){ ?> <div class="l-title_bar" style="{:background($title['desc'],'images')}" >
       <div class="container" style="{:background($title['content'],'images')} height:100%;"></div>
     </div><?php } ?>
     <div class="group container l-floor">
       <div class="ju-itemlist"> 
        <ul class="group">
         <?php 
         foreach ($group as $ad) {
          ?>
         <li class="l-f-shop" title="{$ad.description}"> 
           <a href="{$ad.url}" target="_blank"> <img class="brand-pic" src="{:attach($ad['content'],'images')}" />
           </a> 
          </li> 
          <?php
            }
          ?>
        </ul> 
       </div>
     </div>

    <?php 
    }
     ?>
  </div>
</div>
</notempty>
