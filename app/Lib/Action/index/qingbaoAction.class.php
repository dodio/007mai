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
      $this->display();
    }

    private function _item_group($chanel_id){
      $order  = 'ordid asc ';

      $map = array();

      $cinfo = $this->_cate_mod->cate_info($chanel_id);
      mapCinfo($cinfo,$map);

      $map['cate_id'] = array('IN',$this->_cate_mod->get_child_ids($chanel_id));

      $cate_list = $this->_cate_mod->cate_cache(true);

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
    
  }

 ?>