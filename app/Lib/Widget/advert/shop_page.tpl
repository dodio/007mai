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
    <div class="top-tms-container"><div class="img-wrap"><img src="{:attach($big_banner['content'],'advert')}"/></div></div>
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
     <?php if($title['content'] != ""){ ?> <div class="l-title_bar" style="background:url('{$title.desc}') repeat-x;" >
       <div class="page007mai middle" style="background:url('{$title.content}') center center no-repeat;height:100%;"></div>
     </div><?php } ?>
     <div class="group middle l-floor page007mai">
       <div class="ju-itemlist"> 
        <ul class="group">
         <?php 
         foreach ($group as $ad) {
          ?>
         <li class="l-f-shop" title="{$ad.description}"> 
           <a href="{$ad.url}" target="_blank"> <img class="brand-pic" src="{:attach($ad['content'],'advert')}" />
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
