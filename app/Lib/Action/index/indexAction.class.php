<?php
class indexAction extends ItemlistAction {
	
	public function _empty(){
    	$this->index();
    }
    /**
	 ** 首页（全部）
	 **/
    public function index() { 
		$p		= I('p',1 ,'intval'); //页码
		$sort	= I('sort', 'default', 'trim'); //排序

		$order = 'ordid asc';
		$order.= getSort($sort,C('ftx_index_sort'));

		$where = array();

		if(C('ftx_index_not_text')){
			$not_arr = explode(",",C('ftx_index_not_text'));
			$arrs =array();
			foreach($not_arr as $key =>$value){
				$arrs[] = '%'.$value.'%';
			}
			$where['title'] =array('notlike',$arrs,'AND');
		}

		if(C('ftx_index_cids')){
			$where['cate_id'] =  array('in',C('ftx_index_cids'));
		}

		if(C('ftx_wait_time') == '1'){
			$where['coupon_start_time'] = array('egt',time());
		}elseif(C('ftx_wait_time') =='2'){
			$where['coupon_start_time'] = array('elt',time());
		}

		if(C('ftx_end_time') == '1'){
			$where['coupon_end_time'] = array('egt',time());
		}
		if(C('ftx_index_ems') == '1'){
			$where['ems'] = '1';
		}
		
		if(C('ftx_index_shop_type')){$where['shop_type'] = C('ftx_index_shop_type');}
		if(C('ftx_index_mix_price')>0){$where['coupon_price'] = array('egt',C('ftx_index_mix_price'));}
		if(C('ftx_index_max_price')>0){$where['coupon_price'] = array('elt',C('ftx_index_max_price'));}
		if(C('ftx_index_mix_price')>0 && C('ftx_index_max_price')>0){$where['coupon_price'] = array(array('egt',C('ftx_index_mix_price')),array('elt',C('ftx_index_max_price')),'and');}
		if(C('ftx_index_mix_volume')>0){$where['volume'] = array('egt',C('ftx_index_mix_volume'));}
		if(C('ftx_index_max_volume')>0){$where['volume'] = array('elt',C('ftx_index_max_volume'));}
		if(C('ftx_index_mix_volume')>0 && C('ftx_index_max_volume')>0){$where['volume'] = array(array('egt',C('ftx_index_mix_volume')),array('elt',C('ftx_index_max_volume')),'and');}

		$where['pass'] = '1';
		$where['isshow'] = '1';
		$list_info['sort']= $sort;

		$page_size = C('ftx_index_page_size');
		$list_info['p']=$p;
    $start = $page_size * ($p - 1) ;

		$mdarray = $where;
		$mdarray['sort'] = $sort;
		$mdarray['status'] = $status;
		$mdarray['order'] = $order;
		$mdarray['p'] = $p; 
		$md_id = md5(implode("-",$mdarray));
		$file = 'index_'.$md_id;
 
		if(C('ftx_site_cache')){
			if(false === $items = S($file)){
				$items_list = $this->_mod->where($where)->order($order)->limit($start . ',' . $page_size)->select();
				$items = $this->_deal_item_list($items_list);
				S($file,$items);
			}
		}else{
			$items_list = $this->_mod->where($where)->order($order)->limit($start . ',' . $page_size)->select();
			$items = $this->_deal_item_list($items_list);
		}
		

		if(IS_AJAX){
			if(!$items){$this->ajaxReturn(0, '加载完成');}
			$this->assign('items_list', $items['item_list']);
			$resp = $this->fetch('ajax');
            $this->ajaxReturn(1, '', $resp);
		}

		$this->assign('items_list', $items['item_list']);
		$this->assign('list_info',$list_info);
		if(C('ftx_site_cache')){
			$file = 'index_count';
			if(false === $count = S($file)){
				$count = $this->_mod->where($where)->count();
				S($file,$count);
			}
		}else{
			$count = $this->_mod->where($where)->count();
		}

		$pager = $this->_pager($count, $page_size);
		$this->assign('page', $pager->kshow());
		$this->assign('total_item',$count);
 
  	$this->assign('nav_curr', 'index');
  	$this->_config_seo(C('ftx_seo_config.index'));
		$this->display();

  }

	public function shortcut(){
		$Shortcut = "[InternetShortcut] 
		URL=".C('ftx_site_url')." 
		IDList= 
		[{000214A0-0000-0000-C000-000000000046}] 
		Prop3=19,2 
		"; 
		Header("Content-type: application/octet-stream"); 
		header("Content-Disposition: attachment; filename=".C('ftx_site_name').".url;"); 
		echo $Shortcut; 
	}

  /**
	  * 分类
	  */
	public function cate(){
		$cid	=	I('cid','', 'intval');
		$sort	=	I('sort', 'default', 'trim'); //排序
		$order	=	'ordid asc ';
		if(!$cid) redirect(U('index/index'));
 		$this->_common($cid);
 		$this->assign("nav_curr","cate");
		$this->display();
	}

	public function subcates(){
		$cid = I("cid",'','intval');
		$cate_list = $this->_cate_mod->cate_cache(true);
		if(isset($cate_list['s'][$cid])){
			$cate = $cate_list['s'][$cid];

			foreach ($cate as $value) {
				echo "<li><a href=\"/index/cate/cid/{$value['id']}\" target=\"_blank\">{$value['name']}</a></li>\n";
			}
		}
		
	}
}