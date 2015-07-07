<?php 
  class qingbaoAction extends ItemlistAction {



    public function _empty(){
      $this->redirect("/");
    }
    /**
     * 情侣必备
     * @return [type] [description]
     */
    public function qinglv(){
      $chanel_id = 27;
      $this->_item_group($chanel_id);
      $this->assign('nav_curr', 'qinglv');
      $this->display();
    }
    /**
     * 明星同款
     * @return [type] [description]
     */
    public function tongkuan(){
      $chanel_id = 285;
      $cid = I("cid",$chanel_id,"intval");
      $this->_common($cid);

      $cate_list = $this->_cate_mod->cate_cache(true);
      $subnav = $cate_list['s'][$chanel_id];
      $this->assign('nav_curr', 'tongkuan');
      $this->assign('subnav', $subnav);
      $this->assign("chanel_id",$chanel_id);
      $this->display();
    }
    /**
     * 约会神器
     * @return [type] [description]
     */
    public function yuehui(){
      $chanel_id = 286;
      $this->_item_group($chanel_id);
      $this->assign('nav_curr', 'yuehui');
      $ip = get_client_ip();
      $ipinfo = object_to_array(getIpInfo($ip));

      $this->assign("ipinfo",$ipinfo['data']);
      $this->display();
    }


    private function _item_group($chanel_id){
      $order  = 'ordid asc ';

      $map = array();

      $cinfo = $this->_cate_mod->cate_info($chanel_id);
      mapCinfo($cinfo,$map);

      $map['cate_id'] = array('IN',$this->_cate_mod->get_child_ids($chanel_id));

      $cate_list = $this->_cate_mod->cate_cache();

      if(C('ftx_site_cache')){
        $md_id = md5($chanel_id);
        $file = 'channel_'.$md_id;
        if(false === $item_groups = S($file)){
          $list =  $this->_mod->where($map)->order($order)->select();
          $items = $this->_deal_item_list($list);
          $item_groups = array();
          foreach ($items['item_list'] as $value) {
            $item_groups[$value['cate_id']][] = $value;
          };
          S($file,$item_groups);
        }
      }else{
        $list =  $this->_mod->where($map)->order($order)->select();
        $items = $this->_deal_item_list($list);
        $item_groups = array();
        foreach ($items['item_list'] as $value) {
          $item_groups[$value['cate_id']][] = $value;
        };
      }
      
      $this->assign('item_groups',$item_groups);
      $this->assign("chanel_id",$chanel_id);
      $subnav = $cate_list['s'][$chanel_id];
      $this->assign('subnav', $subnav);
      $this->_config_seo(C('ftx_seo_config.cate'), array(
        'cate_name' => $cinfo['name'],
        'seo_title' => $cinfo['seo_title'],
        'seo_keywords' => $cinfo['seo_keys'],
        'seo_description' => $cinfo['seo_desc'],
      ));
    }



/**
 * 八块八
 * @return [type] [description]
 */
    public function ba(){
      $cid  = "15";
      $sort = I('sort', 'default', 'trim'); //排序
      $order  = 'ordid asc ';
      $tag  = I('cid',1,'intval');

      $cinfo = $this->_cate_mod->cate_info($cid);
      $order .= getSort($sort,$cinfo['sort']);

      mapCinfo($cinfo,$map);
    
      if (false === $cate_list = S('cate_list')) {
        $cate_list = $this->_cate_mod->cate_cache();
      }
      if (false === $cate_data = S('cate_data')) {
        $cate_data = $this->_cate_mod->cate_data_cache();
      }

      if($tag){
        $taginfo = $cate_data[$tag];
        $id_arr = $this->_cate_mod->get_child_ids($tag, true);
        $map['cate_id'] = array('IN', $id_arr);
        if($cate_list['s'][$tag]){
          $tag_list = $cate_list['s'][$tag];
        }else{
          if($cate_list['s'][$taginfo['pid']]){
            $tag_list = $cate_list['s'][$taginfo['pid']];
          }else{
            $tag_list = $cate_list['p'];
          }
        }
      }else{
        $tag_list = $cate_list['p'];
      }

      $list_info['cid']=$tag;
      $this->assign('tag',$tag);

      $this->assign('cid',$tag);
      $this->assign('taginfo',$taginfo);
      $this->assign('cinfo',$cinfo);
      $list_info['sort']=$sort;

      $page_size = C('ftx_index_page_size');
      $p = I('p',1, 'intval'); //页码
      $list_info['p']=$p;
      $start = $page_size * ($p - 1) ;

      
      
      if(C('ftx_site_cache')){
        $mdarray = $map;
        $mdarray['sort'] = $sort;
        $mdarray['tag'] = $tag;
        $mdarray['p'] = $p;
        $mdarray['order'] = $order;
        $md_id = md5(implode("-",$mdarray));
        $file = 'ba_'.$md_id;
        if(false === $items = S($file)){
          $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
          $items = $this->_deal_item_list($items_list);
          S($file,$items);
        }
      }else{
        $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
        $items = $this->_deal_item_list($items_list);
      }

      
      $this->assign('items_list', $items['item_list']);
      $this->assign('seller_arr', $items['seller_arr']);

      $this->assign('list_info',$list_info);

      if(C('ftx_site_cache')){
        $mdarray = $map;
        $mdarray['sort'] = $sort;
        $mdarray['tag'] = $tag;
        $mdarray['p'] = $p;
        $mdarray['order'] = $order;
        $md_id = md5(implode("-",$mdarray));
        $file = 'ba_count_'.$md_id;
        if(false === $count = S($file)){
          $count = $this->_mod->where($map)->count();
          S($file,$count);
        }
      }else{
        $count = $this->_mod->where($map)->count();
      }


      $root_id = get_root_cate_id($taginfo['spid'],$tag);
      $map['cate_id'] = array("IN",$this->_cate_mod->get_child_ids($root_id));
      if(C('ftx_site_cache')){
        $md_id = md5("root_" . $root_id);
        $file = 'ba_group_'.$md_id;
        if(false === $cate_count = S($file)){
          $cate_count = $this->_mod->field("cate_id,count(cate_id)")->where($map)->group('cate_id')->select();
          S($file,$cate_count);
        }
      }else{
        $cate_count = $this->_mod->field("cate_id,count(cate_id)")->where($map)->group('cate_id')->select();
      }
      $this->assign("cate_count",$cate_count);
      
      $total = $items['total'];
      $shop_amount = ceil( $total/4 );
      $shops = $this->cate_shop($tag,$shop_amount);
      $this->assign("shops",$shops);

      $pager = $this->_pager($count, $page_size);
      $this->assign('page', $pager->kshow());
      $this->assign('total_item',$count);
      $this->assign('nav_curr', 'mai');
      $this->_config_seo(C('ftx_seo_config.cate'), array(
        'cate_name' => '【'.$cinfo['name'].'专区】',
        'seo_title' => $cinfo['seo_title'],
        'seo_keywords' => $cinfo['seo_keys'],
        'seo_description' => $cinfo['seo_desc'],
          ));
      $this->display();
  }


  public function shiba(){
    $cid  = "16";
    $sort = I('sort', 'default', 'trim'); //排序
    $order  = 'ordid asc ';
    $tag  = I('cid',1,'intval');

    $cinfo = $this->_cate_mod->cate_info($cid);
    $order .= getSort($sort,$cinfo['sort']);
    mapCinfo($cinfo,$map);
  
    if (false === $cate_list = S('cate_list')) {
      $cate_list = $this->_cate_mod->cate_cache();
    }
    if (false === $cate_data = S('cate_data')) {
      $cate_data = $this->_cate_mod->cate_data_cache();
    }

    if($tag){
      $taginfo = $cate_data[$tag];
      $id_arr = $this->_cate_mod->get_child_ids($tag, true);
      $map['cate_id'] = array('IN', $id_arr);
      if($cate_list['s'][$tag]){
        $tag_list = $cate_list['s'][$tag];
      }else{
        if($cate_list['s'][$taginfo['pid']]){
          $tag_list = $cate_list['s'][$taginfo['pid']];
        }else{
          $tag_list = $cate_list['p'];
        }
      }
    }else{
      $tag_list = $cate_list['p'];
    }

    $list_info['cid']=$tag;
    $this->assign('tag',$tag);
    $this->assign('cid',$tag);

    $this->assign('taginfo',$taginfo);
    $this->assign('cinfo',$cinfo);

    $list_info['sort']=$sort;

    $page_size = C('ftx_index_page_size');
    $p = I('p',1, 'intval'); //页码
    $list_info['p']=$p;
    $start = $page_size * ($p - 1) ;

    
    if(C('ftx_site_cache')){
      $mdarray = $map;
      $mdarray['sort'] = $sort;
      $mdarray['tag'] = $tag;
      $mdarray['p'] = $p;
      $mdarray['order'] = $order;
      $md_id = md5(implode("-",$mdarray));
      $file = 'shiba_'.$md_id;
      if(false === $items = S($file)){
        $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
        $items = $this->_deal_item_list($items_list);
        S($file,$items);
      }
    }else{
      $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
      $items = $this->_deal_item_list($items_list);
    }

    $this->assign('items_list', $items['item_list']);
    $this->assign('seller_arr', $items['seller_arr']);

    $this->assign('list_info',$list_info);

    if(C('ftx_site_cache')){
      $mdarray = $map;
      $mdarray['sort'] = $sort;
      $mdarray['tag'] = $tag;
      $mdarray['p'] = $p;
      $mdarray['order'] = $order;
      $md_id = md5(implode("-",$mdarray));
      $file = 'shiba_count_'.$md_id;
      if(false === $count = S($file)){
        $count = $this->_mod->where($map)->count();
        S($file,$count);
      }
    }else{
      $count = $this->_mod->where($map)->count();
    }

    $root_id = get_root_cate_id($taginfo['spid'],$tag);
    $map['cate_id'] = array("IN",$this->_cate_mod->get_child_ids($root_id));
    if(C('ftx_site_cache')){
      $md_id = md5("root_" . $root_id);
      $file = 'shiba_group_'.$md_id;
      if(false === $cate_count = S($file)){
        $cate_count = $this->_mod->field("cate_id,count(cate_id)")->where($map)->group('cate_id')->select();
        S($file,$cate_count);
      }
    }else{
      $cate_count = $this->_mod->field("cate_id,count(cate_id)")->where($map)->group('cate_id')->select();
    }
    $this->assign("cate_count",$cate_count);
    
    $total = $items['total'];
    $shop_amount = ceil( $total/4 );
    $shops = $this->cate_shop($tag,$shop_amount);
    $this->assign("shops",$shops);

 
    $pager = $this->_pager($count, $page_size);
    $this->assign('page', $pager->kshow());
    $this->assign('total_item',$count);
    $this->assign('nav_curr', 'mai');
    $this->_config_seo(C('ftx_seo_config.cate'), array(
      'cate_name' => '【'.$cinfo['name'].'专区】',
      'seo_title' => $cinfo['seo_title'],
      'seo_keywords' => $cinfo['seo_keys'],
      'seo_description' => $cinfo['seo_desc'],
        ));
    $this->display("ba");
  }


  public function san38(){
    $cid  = "549";
    $sort = I('sort', 'default', 'trim'); //排序
    $order  = 'ordid asc ';
    $tag  = I('cid',1,'intval');

    $cinfo = $this->_cate_mod->cate_info($cid);
    $order .= getSort($sort,$cinfo['sort']);
    mapCinfo($cinfo,$map);
  
    if (false === $cate_list = S('cate_list')) {
      $cate_list = $this->_cate_mod->cate_cache();
    }
    if (false === $cate_data = S('cate_data')) {
      $cate_data = $this->_cate_mod->cate_data_cache();
    }

    if($tag){
      $taginfo = $cate_data[$tag];
      $id_arr = $this->_cate_mod->get_child_ids($tag, true);
      $map['cate_id'] = array('IN', $id_arr);
      if($cate_list['s'][$tag]){
        $tag_list = $cate_list['s'][$tag];
      }else{
        if($cate_list['s'][$taginfo['pid']]){
          $tag_list = $cate_list['s'][$taginfo['pid']];
        }else{
          $tag_list = $cate_list['p'];
        }
      }
    }else{
      $tag_list = $cate_list['p'];
    }

    $list_info['cid']=$tag;
    $this->assign('tag',$tag);
    $this->assign('cid',$tag);

    $this->assign('taginfo',$taginfo);
    $this->assign('cinfo',$cinfo);

    $list_info['sort']=$sort;

    $page_size = C('ftx_index_page_size');
    $p = I('p',1, 'intval'); //页码
    $list_info['p']=$p;
    $start = $page_size * ($p - 1) ;

    
    if(C('ftx_site_cache')){
      $mdarray = $map;
      $mdarray['sort'] = $sort;
      $mdarray['tag'] = $tag;
      $mdarray['p'] = $p;
      $mdarray['order'] = $order;
      $md_id = md5(implode("-",$mdarray));
      $file = 'shiba_'.$md_id;
      if(false === $items = S($file)){
        $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
        $items = $this->_deal_item_list($items_list);
        S($file,$items);
      }
    }else{
      $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
      $items = $this->_deal_item_list($items_list);
    }

    $this->assign('items_list', $items['item_list']);
    $this->assign('seller_arr', $items['seller_arr']);

    $this->assign('list_info',$list_info);

    if(C('ftx_site_cache')){
      $mdarray = $map;
      $mdarray['sort'] = $sort;
      $mdarray['tag'] = $tag;
      $mdarray['p'] = $p;
      $mdarray['order'] = $order;
      $md_id = md5(implode("-",$mdarray));
      $file = 'shiba_count_'.$md_id;
      if(false === $count = S($file)){
        $count = $this->_mod->where($map)->count();
        S($file,$count);
      }
    }else{
      $count = $this->_mod->where($map)->count();
    }

    $root_id = get_root_cate_id($taginfo['spid'],$tag);
    $map['cate_id'] = array("IN",$this->_cate_mod->get_child_ids($root_id));
    if(C('ftx_site_cache')){
      $md_id = md5("root_" . $root_id);
      $file = 'shiba_group_'.$md_id;
      if(false === $cate_count = S($file)){
        $cate_count = $this->_mod->field("cate_id,count(cate_id)")->where($map)->group('cate_id')->select();
        S($file,$cate_count);
      }
    }else{
      $cate_count = $this->_mod->field("cate_id,count(cate_id)")->where($map)->group('cate_id')->select();
    }
    $this->assign("cate_count",$cate_count);
    
    $total = $items['total'];
    $shop_amount = ceil( $total/4 );
    $shops = $this->cate_shop($tag,$shop_amount);
    $this->assign("shops",$shops);

 
    $pager = $this->_pager($count, $page_size);
    $this->assign('page', $pager->kshow());
    $this->assign('total_item',$count);
    $this->assign('nav_curr', 'mai');
    $this->_config_seo(C('ftx_seo_config.cate'), array(
      'cate_name' => '【'.$cinfo['name'].'专区】',
      'seo_title' => $cinfo['seo_title'],
      'seo_keywords' => $cinfo['seo_keys'],
      'seo_description' => $cinfo['seo_desc'],
        ));
    $this->display("ba");
  }
}

 ?>