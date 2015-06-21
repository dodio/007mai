<?php
class indexAction extends ItemlistAction {
	public function _initialize(){
		parent::_initialize();
    $api_config = M('items_site')->where(array('code' => 'ftxia'))->getField('config');
    $this->_tbconfig = unserialize($api_config);
	}
	public function _empty(){
    	$this->index();
    }
    /**
	 ** 首页（全部）
	 **/
    public function index() {
    // 首页选到列表id
		$where = array();
		if(C('ftx_index_not_text')){
			$not_arr = explode(",",C('ftx_index_not_text'));
			$arrs =array();
			foreach($not_arr as $key =>$value){
				$arrs[] = '%'.$value.'%';
			}
			$where['title'] =array('notlike',$arrs,'AND');
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
		$page_size = 8;
		
		// 首页分类展示
		if(C('ftx_index_cids')){
			$index_cates = C('ftx_index_cids');
		}else{
			$index_cates =array();
		}
		$cate_items = array();
		foreach ($index_cates as $cid) {
			$cate_items[$cid] = $this->cate_item($cid,$page_size,$where);
		}
		$this->assign("cate_items",$cate_items);

		//情报精选
		$jingxuan_id = 264;
		$this->assign('jingxuan_list', $this->cate_item($jingxuan_id,10));
    
 		$shops = $this->cate_shop(1,8);
 		$this->assign("shops",$shops);
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
		if ($this->visitor->is_login) {
			$user = $this->visitor->info;
			$arg = array(
				"uid" => $user['id'],
				"uname" => $user['username'],
				"action" => "download_shortcut"
				);
			tag("download_shortcut",$arg);
    }
		echo $Shortcut; 
	}

  /**
	  * 分类
	  */
	public function cate(){
		$cid	=	I('cid','', 'intval');
		$sort	=	I('sort', 'default', 'trim'); //排序
		$order	=	'ordid asc ';
		if(!$cid){
			// 可以通过分类名字进入分类
			$name = I("cname","","trim");
			$cinfo = $this->_cate_mod->cate_info_byname($name);
			if($cinfo){
				$cid = $cinfo['id'];
			}
		}

		if(!$cid) redirect(U('index/index'));

 		$total = $this->_common($cid);
 		$this->assign("nav_curr","cate");
 		//一行4个宝贝，尽量让店铺高度与宝贝列表高度一致
 		$shop_amount = ceil( $total/4 );
		$shops = $this->cate_shop($cid,$shop_amount);
		$this->assign("shops",$shops);
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
	private function _get_top() {
      vendor('Ftxia.TopClient');
      vendor('Ftxia.RequestCheckUtil');
      vendor('Ftxia.Logger');
      $top = new TopClient;
      $top->appkey = $this->_tbconfig['app_key'];
      $top->secretKey = $this->_tbconfig['app_secret'];
      return $top;
  }
}