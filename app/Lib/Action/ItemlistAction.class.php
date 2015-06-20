<?php 
class ItemlistAction extends FirstendAction {
    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('items');
        $this->_cate_mod = D('items_cate');
        $this->_shop_mod = D('shop');
    }
    /**
     * 显示分类下的商品，通用方法
     * @param  [type] $cid [description]
     * @return [type]      [description]
     */
    protected function _common($cid){
      $cinfo = $this->_cate_mod->cate_info($cid);
      $sort = I('sort', 'default', 'trim'); //排序方式
      $order  = 'ordid asc ';
      $order .= getSort( $sort, $cinfo['sort'] );


      mapCinfo($cinfo,$map);

      $price_range = I("price","","trim");
      getPriceRange($price_range,$map);

      if($cinfo['thiscid']==0){
          $id_arr = $this->_cate_mod->get_child_ids($cid, true);
          $map['cate_id'] = array('IN', $id_arr);
      }else{
        $single_id_map = array($cid);
        $map['cate_id'] = array('IN', $single_id_map);
      }
      $this->assign('cid',$cid);
      $this->assign('cinfo',$cinfo);

      $list_info['sort']=$sort;
      $list_info['cid']=$cid;
      $list_info['price'] = $price_range;
      $page_size = C('ftx_index_page_size');
      $p = I('p',1,'intval'); //页码
      $list_info['p']=$p;
      $start = $page_size * ($p - 1) ;

      // 调用自定义筛选条件
      $this->_custom_map($map);

      if(C('ftx_site_cache')){
        $mdarray = array();
        $mdarray['cid'] = $cid;
        $mdarray['sort'] = $sort;
        $mdarray['p'] = $p;
        $mdarray['order'] = $order;
        $mdarray['price'] = $price_range;
        $md_id = md5(implode("-",$mdarray));
        $file = 'cate_'.$md_id;
        if(false === $items = S($file)){
          $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
          $items = $this->_deal_item_list($items_list);
          S($file,$items);
        }
      }else{
        $items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
        $items = $this->_deal_item_list($items_list);
      }

      if(IS_AJAX){
        if(!$items){$this->ajaxReturn(0, '加载完成');}
        $this->assign('items_list', $items['item_list']);
        $resp = $this->fetch('ajax');
        $this->ajaxReturn(1, '', $resp);
      }

      $this->assign('items_list', $items['item_list']);
      $this->assign('seller_arr',$items['seller_arr']);
      $this->assign('list_info',$list_info);

      if(C('ftx_site_cache')){
        $mdarray = array();
        $mdarray['cid'] = $cid;
        $mdarray['price'] = $price_range;
        $md_id = md5(implode("-",$mdarray));
        $file = 'cate_count_'.implode("-", $md_id);
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

      $this->_config_seo(C('ftx_seo_config.cate'), array(
        'cate_name' => $cinfo['name'],
        'seo_title' => $cinfo['seo_title'],
        'seo_keywords' => $cinfo['seo_keys'],
        'seo_description' => $cinfo['seo_desc'],
      ));
      return $items['total'];
    }

    /**
     * 用于子类自定义筛选条件
     * @param  [type] &$map [description]
     * @return [type]       [description]
     */
    protected function _custom_map(&$map){

    }

    /**
     * 处理列表数据
     * 引用传递，节约内存
     */
    protected function _deal_item_list(&$items_list){
        $items = array();
        $seller_arr = array();
        $cate_data = $this->_cate_mod->cate_data_cache();
        $total = 0;
        foreach($items_list as $key=>$val){
          $items['item_list'][$key]     = $val;
          $items['item_list'][$key]['class']  = $this->_mod->status($val['status'],$val['coupon_start_time'],$val['coupon_end_time']);
          //折扣
          $items['item_list'][$key]['zk']   = round(($val['coupon_price']/$val['price'])*10, 1); 
          if(!$val['click_url']){
            $items['item_list'][$key]['click_url']  =U('jump/index',array('id'=>$val['id']));
          }
          //还未开始
          if($val['coupon_start_time']>time()){
            $items['item_list'][$key]['click_url']  =U('item/index',array('id'=>$val['id']));
            $items['item_list'][$key]['timeleft'] = $val['coupon_start_time']-time();
          }else{
            $items['item_list'][$key]['timeleft'] = $val['coupon_end_time']-time();
          }
          $items['item_list'][$key]['cate_name']  = $cate_data[$val['cate_id']]['name'];
          $url = C('ftx_site_url').U('item/index',array('id'=>$val['id']));
          $items['item_list'][$key]['url'] = urlencode($url);
          $items['item_list'][$key]['urltitle'] = urlencode($val['title']);
          $items['item_list'][$key]['price'] = number_format($val['price'],1);
          $items['item_list'][$key]['coupon_price'] = number_format($val['coupon_price'],1);
          $total++;
          if($val['sellerId']){
            $seller_arr[$val['sellerId']] = true;
          }
        }
        $items['total'] = $total;
        $items['seller_arr'] = array_keys($seller_arr);
        return $items;
    }

    /**
     * 获取该分类数据，如果不够则获取父分类充数，直到足够
     * @param  [type]  $cid    [description]
     * @param  integer $amount [description]
     * @return [type]          [description]
     */
    protected function cate_shop($cid,$amount = 18){
      $order = "ordid asc , id desc ";
      if(C('ftx_site_cache')){
        $md_id = md5( $cid . "_" . $amount . "_" .$order);
        $file = 'shop/'.$md_id;
        if(false === $shops = F($file)){

          $cinfo = $this->_cate_mod->cate_info($cid);
          $map = array("status" => 1);
          if($cinfo['spid'] == 0){
            $parents = array($cid);
          }else{
            $parents = array_reverse(explode('|', trim($cinfo['spid'], '|')));
            array_unshift($parents, $cid);
          }
          $pre = 0 ;
          $shops = array();
          foreach ($parents as $cate_id) {
            if($pre >= $amount){
              break;
            }
            $size = $amount - $pre;
            $map['cate_id'] = $cate_id;
            $temp_shop = $this->_shop_mod->where($map)->order($order)->limit(0,$size)->select();
            $count = count($temp_shop);
            $pre+=$count;
            $shops[$cate_id] = $temp_shop;            
          }
          F($file,$shops);
        }
      }else{
        $cinfo = $this->_cate_mod->cate_info($cid);
          $map = array("status" => 1);
          if($cinfo['spid'] == 0){
            $parents = array($cid);
          }else{
            $parents = array_reverse(explode('|', trim($cinfo['spid'], '|')));
            array_unshift($parents, $cid);
          }
          $pre = 0 ;
          $shops = array();
          foreach ($parents as $cate_id) {
            if($pre >= $amount){
              break;
            }
            $size = $amount - $pre;
            $map[$cate_id] = $cate_id;
            $temp_shop = $this->_shop_mod->where($map)->order($order)->limit(0,$size)->select();
            $count = count($temp_shop);
            $pre+=$count;
            $shops[$cate_id] = $temp_shop;            
          }
      }

      return $shops;
    }
}

 ?>