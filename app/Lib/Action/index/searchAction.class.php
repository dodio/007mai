<?php
class searchAction extends ItemlistAction {

	public function _empty(){
		$this->index();
	}

	public function index() {
		$sort	= I('sort', 'new', 'trim'); //排序
		$k		= I('key');
		$order	= 'ordid asc ,id desc';
    if(!$k){
      $this->redirect("/","请输入查询条件.",2);
      exit();
    }
    $order.= getSort($sort);

    $where['title'] = array('like', '%' . $k . '%');
    $this->assign('k',$k);

		$where['pass'] = '1';
		$list_info['sort']=$sort;
		$list_info['status']=$status;
		$page_size = C('ftx_index_page_size');
        $p = I('p',1, 'intval'); //页码
		$list_info['p']=$p;

    $start = $page_size * ($p - 1) ;

    $item_mod = M('items');
    $items_list = $item_mod->where($where)->order($order)->limit($start . ',' . $page_size)->select();
    $goaitao = I("aitao","","trim");
    if($goaitao != "" || empty($items_list) || count($items_list)< 8){
      //内部跳转搜索 pid
      $this->assign("pid",'mm_108982726_9740782_33494184');
      $this->display("ai_search");
      exit();
    }

		$items = $this->_deal_item_list($items_list);

		$this->assign('items_list', $items['item_list']);
		$this->assign('list_info',$list_info);

		$count = $item_mod->where($where)->count();
		$pager = $this->_pager($count, $page_size);
		$this->assign('page', $pager->kshow());
		$this->assign('total_item',$count);
		$this->assign('nav_curr', 'search');
		$page_seo = array(
			'title' => '搜索"'.$k.'"的宝贝结果 ',
		);
		$this->assign('page_seo', $page_seo);
		$this->display('index');
    }
 
}