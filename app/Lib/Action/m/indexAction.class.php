<?php
class indexAction extends FirstendAction {
	
	public function _initialize() {
		parent::_initialize();
		$this->_mod = D("items");
		$this->_cate_mod = D('items_cate');
		if (false === $cate_list = F('cate_list')) {
			$cate_list = $this->_cate_mod->cate_cache();
		}
		//p($cate_list);
		$this->assign('cate_list', $cate_list); //ио└Я
	}
	
	public function _empty(){
		$this->index();
	}

	public function index() {
		$cid = $this->_get('cid');
		$k = $this->_get('keyword');
		if($k){$where['title'] = array('like','%'.$k.'%');}
		$order = 'ordid asc ';
		

		if($cid){
			$this->assign('cid',$cid);
			$cinfo = $this->_cate_mod->where(array('id'=>$cid))->find();
			if($cinfo['shop_type']){$where['shop_type'] = $cinfo['shop_type'];}
				if($cinfo['mix_price']>0){$where['coupon_price'] = array('egt',$cinfo['mix_price']);}
				if($cinfo['max_price']>0){$where['coupon_price'] = array('elt',$cinfo['max_price']);}
				if($cinfo['max_price']>0 && $cinfo['mix_price']>0){$where['coupon_price'] = array(array('egt',$cinfo['mix_price']),array('elt',$cinfo['max_price']),'and');}
				if($cinfo['mix_volume']>0){$where['volume'] = array('egt',$cinfo['mix_volume']);}
				if($cinfo['max_volume']>0){$where['volume'] = array('elt',$cinfo['max_volume']);}
				if($cinfo['max_volume']>0 && $cinfo['mix_volume']>0){$where['volume'] = array(array('egt',$cinfo['mix_volume']),array('elt',$cinfo['max_volume']),'and');}
				if($cinfo['thiscid']==0){
			  $id_arr = $this->_cate_mod->get_child_ids($cid, true);
			  $where['cate_id'] = array('IN', $id_arr);
					$today_wh['cate_id'] = array('IN', $id_arr);
			}

			if($cinfo['wait_time'] == '1'){
				$where['coupon_start_time'] = array('egt',time());
			}elseif($cinfo['wait_time'] =='2'){
				$where['coupon_start_time'] = array('elt',time());
			}
			if($cinfo['end_time'] == '1'){
				$where['coupon_end_time'] = array('egt',time());
			}
			if($cinfo['ems'] == '1'){
				$where['ems'] = '1';
			}
			$where['pass']="1";
			$where['isshow'] = '1';

			$order.= ', '.$cinfo['sort'];
		}else{
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

			if('magic' == C('ftx_index_sort')){
				$order.= ', astime DESC, pic_url asc';
			}else{
				$order.= ', '.C('ftx_index_sort');
			}
		}
		 
		$page_size = C('ftx_index_page_size');
		$p = $this->_get('p','intval', 1); //м│┬в
		$start = $page_size * ($p - 1) ;
		$items_list = $this->_mod->where($where)->order($order)->limit($start . ',' . $page_size)->select();
		$this->assign('items_list', $items_list);
		$count = $this->_mod->where($where)->count();
		$pager = $this->_pager($count, $page_size);
		$this->assign('page', $pager->mshow());
		$this->display('index');
	  }

}