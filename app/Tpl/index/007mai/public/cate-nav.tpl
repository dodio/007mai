<div class="cate-nav-wrap">
  <?php 
    $cate = $cate_data[$cid];
    $top_cates = $cate_list['p'];
    if($cate['pid'] == 0){
      //选中的根目录
      $rootid = $cid;
      $subnav = $cate_list['s'][$cid];
      $thiscid = $cid;
      $broid = 0 ;
   ?>

  <include file="public:main-cate-nav"/>
  <include file="public:sub-cate-nav"/>

  <?php }else{
    $parents_id = explode('|', $cate['spid']);
    $level = count($parents_id);
    $parents_id[$level-1] = $cate['id'];
    $rootid = $parents_id[0];
    $subnavs = array();
    for ($i=0; $i < $level ; $i++) {

      $subnavs[] =  array(
          "thiscid" => $parents_id[$i],
          'broid' => $i < $level-1 ? $parents_id[$i+1] : 0,
          'subnav' => $cate_list['s'][$parents_id[$i]]
        );
    } 
  ?>
    <include file="public:main-cate-nav"/>
  <?php 
    ?>
    <volist name="subnavs" id="s">
      <?php 
        $thiscid = $s['thiscid'];
        $broid = $s['broid'];
        $subnav = $s['subnav'];
     ?>
      <include file="public:sub-cate-nav"/>
    </volist>
  <?php 
    
  } ?>
</div>