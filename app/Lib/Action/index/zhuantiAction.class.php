<?php
class zhuantiAction extends FirstendAction {
		public function _initialize() {
			parent::_initialize();
	    $this->_mod = D('items');
	    $this->_cate_mod = D('zc_cate');
			$this->assign('nav_curr', 'index');
    	$this->visited_page();//访问页面任务
	  }
    
    public function _empty($name){
    	$zc = $this->_cate_mod->where(array('ename'=>$name))->find();
    	if($zc){
				$file = 'zc_cate_'.$zc['id'];
				$zcmap['status'] = '1';
				$zcmap['pid'] = '0';
				$zcmap['id'] = array('neq',$zc['id']);
				if(C('ftx_site_cache')){
					if(false === $zc_cate =S($file)){
						$zc_cate = $this->_cate_mod->where($zcmap)->limit('0,3')->order('ordid asc')->select();
						S($file,$zc_cate);
					}
				}else{
					$zc_cate = $this->_cate_mod->where($zcmap)->limit('0,3')->order('ordid asc')->select();
				}
				$this->assign('mzc_cate', $zc_cate);

			$zc_cate = $this->_cate_mod->where(array('pid'=>$zc['id'],'status'=>'1'))->select();
			if($zc['pid']=='0' && $zc_cate){
				$this->assign('zc_cate',$zc_cate);
				$this->assign('zc',$zc);
				$this->_config_seo(array(
						'title' => '【'.$zc['name'].'】	- ' . C('ftx_site_name' ).'专场活动',
						'keywords' => $zc['name'].',专场活动',
						'description' => '【'.$zc['name'].'】!	' . C('ftx_site_name' ).'专场活动',
					));
				$this->display('index');
			}else{
				$where['pass'] = 1;
				$where['isshow'] = '1';
				$where['zc_id'] = $zc['id'];
				//$where['coupon_end_time'] = array('egt',time()-86400) ;
				$order = 'coupon_start_time DESC ';
				$page_size = '150';
				$pagecount = 0;
				$p = $this->_get('p', 'intval', 1); //页码
				$start = $page_size * ($p - 1) ;
				$items_list = $this->_mod->where($where)->order($order)->limit($start . ',' . $page_size)->select();
				$items = array();
					foreach($items_list as $key=>$val){
						$items['item_list'][$key]			= $val;
						$items['item_list'][$key]['class']	= $this->_mod->status($val['status'],$val['coupon_start_time'],$val['coupon_end_time']);
						$items['item_list'][$key]['zk']		= round(($val['coupon_price']/$val['price'])*10, 1); 
						if(!$val['click_url']){
							$items['item_list'][$key]['click_url']	=U('jump/index',array('id'=>$val['id']));
						}
						if($val['coupon_start_time']>time()){
							$items['item_list'][$key]['click_url']	=U('item/index',array('id'=>$val['id']));
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
						$pagecount++;
					}
			
				$this->assign('zc',$zc);
				$this->assign('pagecount', $pagecount);
				$this->assign('items_list',$items['item_list']);
				$this->_config_seo(array(
						'title' => '【'.$zc['name'].'】- ' . C('ftx_site_name' ).'专场活动',
						'keywords' => $zc['name'].',专场活动',
						'description' => '【'.$zc['name'].'】!	' . C('ftx_site_name' ).'专场活动',
					));
				$this->display('index');
			}
    	}else{
    		redirect(U('index/index')); 
    	}
    	
    }
   
}