<?php
class indexAction extends FirstendAction {
	public function _initialize() {
        parent::_initialize();
        $this->_mod = D('items');
        $this->_cate_mod = D('items_cate');
    }
	public function _empty(){
    	$this->index();
    }
    /**
	 ** 首页（全部）
	 **/
    public function index() { 
		$p		= I('p',1 ,'intval'); //页码
		$sort	= I('sort', 'default', 'trim'); //排序
		$status = I('status', 'all', 'trim'); //排序
		$today_str = mktime(0,0,0,date("m"),date("d"),date("Y"));
		$tomorr_str = mktime(0,0,0,date("m"),date("d")+1,date("Y"));
		$today_wh['coupon_start_time'] = array(array('egt',$today_str),array('elt',$tomorr_str)) ;
		$today_wh['pass'] = '1';
		$today_wh['isshow'] = '1';
		$today_wh['coupon_rate'] = array('lt',10000);

		$tomorrow_wh['coupon_start_time'] = array('egt',$tomorr_str);
		$tomorrow_wh['pass'] = '1';
		$tomorrow_wh['isshow'] = '1';

		$md_id = md5(implode("-",$today_wh));
		$file = 'index_today_item_'.$md_id;
		if(C('ftx_site_cache')){
			if(false === $today_item = S($file)){
				$today_item = $this->_mod->where($today_wh)->count();
				S($file,$today_item);
			}
		}else{
			$today_item = $this->_mod->where($today_wh)->count();
		}
		$this->assign('today_item', $today_item);

		$md_id = md5(implode("-",$tomorrow_wh));
		$file = 'index_tomorrow_item_'.$md_id;
		if(C('ftx_site_cache')){
			if(false === $tomorrow_item = S($file)){
				$tomorrow_item = $this->_mod->where($tomorrow_wh)->count();
				S($file,$tomorrow_item);
			}
		}else{
			$tomorrow_item = $this->_mod->where($tomorrow_wh)->count();
		}
		$this->assign('tomorrow_item', $tomorrow_item);

		$order = 'ordid asc';
		switch ($sort){
    		case 'new':
				$order.= ', coupon_start_time DESC';
				break;
			case 'price':
				$order.= ', price DESC';
				break;
			case 'rate':
				$order.= ', coupon_rate ASC';
				break;
			case 'hot':
				$order.= ', volume DESC';
				break;
			case 'default':
				if('magic' == C('ftx_index_sort')){
					$order.= ', astime DESC, pic_url asc';
				}else{
					$order.= ', '.C('ftx_index_sort');
				}
		}

		switch ($status){
            case 'all':
                //$where['status']="underway";
                break;
            case 'underway':
                $where['status']="underway";
                break;
			case 'sellout':
				$where['status']="sellout";
				break;
        }

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
		$index_info['sort']=$sort;
		$index_info['status']=$status;
		$page_size = C('ftx_index_page_size');
		$index_info['p']=$p;

        $start = $page_size * ($p - 1) ;

		if(false === $cate_list = F('cate_list')) {
			$cate_list = D('items_cate')->cate_cache();
		}
		$this->assign('cate_list', $cate_list); //分类

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
				$items = array();
				$seller_arr = array();
				$sellers = '';
				foreach($items_list as $key=>$val){
					$items['item_list'][$key]			= $val;
					$items['item_list'][$key]['class']	= $this->_mod->status($val['status'],$val['coupon_start_time'],$val['coupon_end_time']);
					$items['item_list'][$key]['zk']		= round(($val['coupon_price']/$val['price'])*10, 1); 
					if(!$val['click_url']){
						$items['item_list'][$key]['click_url']	=U('jump/index',array('id'=>$val['id']));
					}
					if($val['coupon_start_time']>time()){
						$items['item_list'][$key]['click_url']	=U('item/index',array('id'=>$val['id']));
						$items['item_list'][$key]['timeleft'] = $val['coupon_start_time']-time();
					}else{
						$items['item_list'][$key]['timeleft'] = $val['coupon_end_time']-time();
					}
					$items['item_list'][$key]['cate_name']		=$cate_list['p'][$val['cate_id']]['name']; 
					$url = C('ftx_site_url').U('item/index',array('id'=>$val['id']));
					$items['item_list'][$key]['url'] = urlencode($url);
					$items['item_list'][$key]['urltitle'] = urlencode($val['title']);
					$items['item_list'][$key]['price'] = number_format($val['price'],1);
					$items['item_list'][$key]['coupon_price'] = number_format($val['coupon_price'],1);
					if($val['sellerId']){
						$items['seller_arr'][] = $val['sellerId'];
					}
				}
				S($file,$items);
			}
		}else{
			$items_list = $this->_mod->where($where)->order($order)->limit($start . ',' . $page_size)->select();
			$items = array();
			$seller_arr = array();
			$sellers = '';
			foreach($items_list as $key=>$val){
				$items['item_list'][$key]			= $val;
				$items['item_list'][$key]['class']	= $this->_mod->status($val['status'],$val['coupon_start_time'],$val['coupon_end_time']);
				$items['item_list'][$key]['zk']		= round(($val['coupon_price']/$val['price'])*10, 1); 
				if(!$val['click_url']){
					$items['item_list'][$key]['click_url']	=U('jump/index',array('id'=>$val['id']));
				}
				if($val['coupon_start_time']>time()){
					$items['item_list'][$key]['click_url']	=U('item/index',array('id'=>$val['id']));
					$items['item_list'][$key]['timeleft'] = $val['coupon_start_time']-time();
				}else{
					$items['item_list'][$key]['timeleft'] = $val['coupon_end_time']-time();
				}
				$items['item_list'][$key]['cate_name']		=$cate_list['p'][$val['cate_id']]['name']; 
				$url = C('ftx_site_url').U('item/index',array('id'=>$val['id']));
				$items['item_list'][$key]['url'] = urlencode($url);
				$items['item_list'][$key]['urltitle'] = urlencode($val['title']);
				$items['item_list'][$key]['price'] = number_format($val['price'],1);
				$items['item_list'][$key]['coupon_price'] = number_format($val['coupon_price'],1);
				if($val['sellerId']){
					$items['seller_arr'][] = $val['sellerId'];
				}
			}
		}
		
		$seller_arr = array_unique($items['seller_arr']);
		$sellers = implode(",",$seller_arr);
		if(IS_AJAX){
			if(!$items){$this->ajaxReturn(0, '加载完成');}
			$this->assign('items_list', $items['item_list']);
			$resp = $this->fetch('ajax');
            $this->ajaxReturn(1, '', $resp);
		}
		$this->assign('sellers', $sellers);

		$this->assign('items_list', $items['item_list']);
		$this->assign('index_info',$index_info);
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


		$today_str = mktime(0,0,0,date("m"),date("d"),date("Y"));
		$tomorr_str = mktime(0,0,0,date("m"),date("d")+1,date("Y"));
		
		$jiumap['coupon_price'] = array('lt','10');
		$jiumap['coupon_start_time'] = array(array('egt',$today_str),array('elt',$tomorr_str));
		$shimap['coupon_price'] = array(array('egt',10),array('elt',20),'and');
		$shimap['coupon_start_time'] = array(array('egt',$today_str),array('elt',$tomorr_str));
		if(C('ftx_site_cache')){
			$file = 'today_jiu_count';
			if(false === $today_jiu_count = S($file)){
				$today_jiu_count = $this->_mod->where($jiumap)->count();
				S($file,$today_jiu_count);
			}
		}else{
			$today_jiu_count = $this->_mod->where($jiumap)->count();
		}
		$this->assign('today_jiu_count',$today_jiu_count);


		if(C('ftx_site_cache')){
			$file = 'today_shi_count';
			if(false === $today_shi_count = S($file)){
				$today_shi_count = $this->_mod->where($shimap)->count();
				S($file,$today_shi_count);
			}
		}else{
			$today_shi_count = $this->_mod->where($shimap)->count();
		}
		$this->assign('today_shi_count',$today_shi_count);

 
		$this->assign('pager','index');
		$this->assign('ajaxurl',U('index/index',array('p'=>$index_info['p'],'sort'=>$index_info['sort'])));
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
 
		$cinfo = $this->_cate_mod->cate_info($cid);

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

		// $today_str = mktime(0,0,0,date("m"),date("d"),date("Y"));
		// 不要今日新增
		// $tomorr_str = mktime(0,0,0,date("m"),date("d")+1,date("Y"));

		// $today_wh['add_time'] = array(array('egt',$today_str),array('elt',$tomorr_str)) ;
		// $today_wh['pass'] = '1';
		// $today_wh['isshow'] = '1';

		// if(C('ftx_site_cache')){
		// 	$md_id = md5(implode("-",$today_wh));
		// 	$file = 'cate_today_item_'.$md_id;
		// 	if(false === $today_item = S($file)){
		// 		$today_item = $this->_mod->where($today_wh)->count();
		// 		S($file,$today_item);
		// 	}
		// }else{
		// 	$today_item = $this->_mod->where($today_wh)->count();
		// }

		// $this->assign('today_item', $today_item);
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
					$items['item_list'][$key]			= $val;
					$items['item_list'][$key]['class']	= $this->_mod->status($val['status'],$val['coupon_start_time'],$val['coupon_end_time']);
					$items['item_list'][$key]['zk']		= round(($val['coupon_price']/$val['price'])*10, 1); 
					if(!$val['click_url']){
						$items['item_list'][$key]['click_url']	=U('jump/index',array('id'=>$val['id']));
					}
					if($val['coupon_start_time']>time()){
						$items['item_list'][$key]['click_url']	=U('item/index',array('id'=>$val['id']));
						$items['item_list'][$key]['timeleft'] = $val['coupon_start_time']-time();
					}else{
						$items['item_list'][$key]['timeleft'] = $val['coupon_end_time']-time();
					}
					$items['item_list'][$key]['cate_name']		=$cate_list['p'][$val['cate_id']]['name'];
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
				$items['item_list'][$key]			= $val;
				$items['item_list'][$key]['class']	= $this->_mod->status($val['status'],$val['coupon_start_time'],$val['coupon_end_time']);
				$items['item_list'][$key]['zk']		= round(($val['coupon_price']/$val['price'])*10, 1); 
				if(!$val['click_url']){
					$items['item_list'][$key]['click_url']	=U('jump/index',array('id'=>$val['id']));
				}
				if($val['coupon_start_time']>time()){
					$items['item_list'][$key]['click_url']	=U('item/index',array('id'=>$val['id']));
					$items['item_list'][$key]['timeleft'] = $val['coupon_start_time']-time();
				}else{
					$items['item_list'][$key]['timeleft'] = $val['coupon_end_time']-time();
				}
				$items['item_list'][$key]['cate_name']		=$cate_list['p'][$val['cate_id']]['name'];
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