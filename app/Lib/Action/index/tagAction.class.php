<?php
class tagAction extends ItemlistAction {
	public function _initialize() {
        parent::_initialize();
        $this->_mod = D('items');
        $this->_cate_mod = D('items_cate');
    }

	public function _empty($name){
    $tag_mod = D("tag");
		if($name){
      $tag = $tag_mod ->where(array(
        "name"=>$name
        ))->find();

      if($tag){
        $page_seo = array(
          'title' => !empty($tag['seo_title']) ? $tag['seo_title'] :  $tag['name'] ,
          'keywords' => $tag['seo_keys'],
          'description'=>$tag['seo_desc']
        );
      }else{
         $page_seo=array(
          'title' => $k.'什么牌子好,'.$k.'哪里有卖 - '.C('ftx_site_name')
        );
      }
      $this->assign('page_seo', $page_seo);
      $this->assign('tag',$tag);
      $this->assign('name',$name);
			$this->so($name);
		}else{
			$this->_404();
		}
	}
 
	public function so($k) {
    if(!$k){
      $this->redirect("/");
    }
		$order	= 'ordid asc ,id desc , coupon_rate desc';
		
		if($k){
			$where['title'] = array('like', '%' . $k . '%');
			$this->assign('k',$k);
		}

		$where['pass'] = '1';
		$where['isshow'] = '1';
    $item_mod = M('items');
    $tmp = $item_mod->where($where)->order($order)->limit(48)->select();
    $items = $this->_deal_item_list($tmp);

		$this->assign('sellers', $items['seller_arr']);
		$this->assign('items_list', $items['item_list']);
    $this->assign('nav_curr', 'index');
    $this->display('index');
  }
}