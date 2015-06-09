<?php 
  class qingbaoAction extends FirstendAction {
    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('items');
        $this->_cate_mod = D('items_cate');
    }
    public function _empty(){
      $this->redirect("/");
    }

    public function qinglv(){
      $this->_common(27);
    }



    private function _common($cid){
      $cinfo = $this->_cate_mod->cate_info($cid);
      $sort = I('sort', 'default', 'trim'); //排序方式
      $order  = 'ordid asc ';

      $order .= getSort( $sort, $cinfo['sort'] );
      mapCinfo($cinfo,$map);

      if($cinfo['thiscid']==0){
          $id_arr = $this->_cate_mod->get_child_ids($cid, true);
          $map['cate_id'] = array('IN', $id_arr);
        // $today_wh['cate_id'] = array('IN', $id_arr);
      }else{
        $single_id_map = array($cid);
        $map['cate_id'] = array('IN', $single_id_map);
        // $today_wh['cate_id'] = array('IN', $single_id_map);
      }


      $this->assign('cid',$cid);
      $this->assign('pager','cate');
      $this->assign('cinfo',$cinfo);

      $index_info['sort']=$sort;
      $index_info['cid']=$cid;
      $page_size = C('ftx_index_page_size');
      $p = I('p',1,'intval'); //页码
      $index_info['p']=$p;
      $start = $page_size * ($p - 1) ;

      if(C('ftx_site_cache')){
        $mdarray['cid'] = $cid;
        $mdarray['sort'] = $sort;
        $mdarray['p'] = $p;
        $mdarray['order'] = $order;
        $md_id = md5(implode("-",$mdarray));
        $file = 'cate_'.$md_id;
        if(false === $items = S($file)){

          $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
          $items = array();
          $pagecount = 0;
          $seller_arr = array();
          $sellers = '';
          foreach($items_list as $key=>$val){
            $items['item_list'][$key]     = $val;
            $items['item_list'][$key]['class']  = $this->_mod->status($val['status'],$val['coupon_start_time'],$val['coupon_end_time']);
            $items['item_list'][$key]['zk']   = round(($val['coupon_price']/$val['price'])*10, 1); 
            if(!$val['click_url']){
              $items['item_list'][$key]['click_url']  =U('jump/index',array('id'=>$val['id']));
            }
            if($val['coupon_start_time']>time()){
              $items['item_list'][$key]['click_url']  =U('item/index',array('id'=>$val['id']));
              $items['item_list'][$key]['timeleft'] = $val['coupon_start_time']-time();
            }else{
              $items['item_list'][$key]['timeleft'] = $val['coupon_end_time']-time();
            }
            $items['item_list'][$key]['cate_name']    =$cate_list['p'][$val['cate_id']]['name'];
            $url = C('ftx_site_url').U('item/index',array('id'=>$val['id']));
            $items['item_list'][$key]['url'] = urlencode($url);
            $items['item_list'][$key]['urltitle'] = urlencode($val['title']);
            $items['item_list'][$key]['price'] = number_format($val['price'],1);
            $items['item_list'][$key]['coupon_price'] = number_format($val['coupon_price'],1);
            $pagecount++;
            if($val['sellerId']){
              $items['seller_arr'][] = $val['sellerId'];
            }
          }
          
          S($file,$items);
        }
      }else{

        $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
        $items = array();
        $pagecount = 0;
        $seller_arr = array();
        $sellers = '';
        foreach($items_list as $key=>$val){
          $items['item_list'][$key]     = $val;
          $items['item_list'][$key]['class']  = $this->_mod->status($val['status'],$val['coupon_start_time'],$val['coupon_end_time']);
          $items['item_list'][$key]['zk']   = round(($val['coupon_price']/$val['price'])*10, 1); 
          if(!$val['click_url']){
            $items['item_list'][$key]['click_url']  =U('jump/index',array('id'=>$val['id']));
          }
          if($val['coupon_start_time']>time()){
            $items['item_list'][$key]['click_url']  =U('item/index',array('id'=>$val['id']));
            $items['item_list'][$key]['timeleft'] = $val['coupon_start_time']-time();
          }else{
            $items['item_list'][$key]['timeleft'] = $val['coupon_end_time']-time();
          }
          $items['item_list'][$key]['cate_name']    =$cate_list['p'][$val['cate_id']]['name'];
          $url = C('ftx_site_url').U('item/index',array('id'=>$val['id']));
          $items['item_list'][$key]['url'] = urlencode($url);
          $items['item_list'][$key]['urltitle'] = urlencode($val['title']);
          $items['item_list'][$key]['price'] = number_format($val['price'],1);
          $items['item_list'][$key]['coupon_price'] = number_format($val['coupon_price'],1);
          $pagecount++;
          if($val['sellerId']){
            $items['seller_arr'][] = $val['sellerId'];
          }
          
        }

      }

      $seller_arr = array_unique($items['seller_arr']);
      $sellers = implode(",",$seller_arr);
      $this->assign('sellers', $sellers);
      if(IS_AJAX){
        if(!$items){$this->ajaxReturn(0, '加载完成');}
        $this->assign('items_list', $items['item_list']);
        $resp = $this->fetch('ajax');
        $this->ajaxReturn(1, '', $resp);
      }
      $this->assign('pagecount', $pagecount);


      $this->assign('items_list', $items['item_list']);
      $this->assign('index_info',$index_info);

      if(C('ftx_site_cache')){
        $file = 'cate_count_'.$cid;
        if(false === $count = S($file)){
          $count = $this->_mod->where($map)->count();
          S($file,$count);
        }
      }else{
        $count = $this->_mod->where($map)->count();
      }

      $pager = $this->_pager($count, $page_size);
      $this->assign('page', $pager->kshow());
      $this->assign('total_item',$count);
      $this->assign('ajaxurl',U('index/cate',array('cid'=>$cid,'p'=>$index_info['p'],'sort'=>$index_info['sort'])));

      $this->assign('nav_curr', 'index');
      $this->_config_seo(C('ftx_seo_config.cate'), array(
        'cate_name' => $cinfo['name'],
        'seo_title' => $cinfo['seo_title'],
        'seo_keywords' => $cinfo['seo_keys'],
        'seo_description' => $cinfo['seo_desc'],
          ));
      $this->display();
    }
  }

 ?>