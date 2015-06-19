<?php
class baAction extends ItemlistAction {
	public function index(){
		$cid	=	"15";
		$sort	=	I('sort', 'default', 'trim'); //排序
		$status =	I('status', 'all', 'trim'); //排序
		$order	=	'ordid asc ';
		$tag	=	I('cid');

		$cinfo = $this->_cate_mod->cate_info($cid);
		$order .= getSort($sort,$cinfo['sort']);

    mapCinfo($cinfo,$map);
	
		if (false === $cate_list = S('cate_list')) {
			$cate_list = $this->_cate_mod->cate_cache();
		}
		if (false === $cate_data = S('cate_data')) {
			$cate_data = $this->_cate_mod->cate_data_cache();
		}

		if($tag){
			$taginfo = $cate_data[$tag];
			$id_arr = $this->_cate_mod->get_child_ids($tag, true);
    	$map['cate_id'] = array('IN', $id_arr);
			if($cate_list['s'][$tag]){
				$tag_list = $cate_list['s'][$tag];
			}else{
				if($cate_list['s'][$taginfo['pid']]){
					$tag_list = $cate_list['s'][$taginfo['pid']];
				}else{
					$tag_list = $cate_list['p'];
				}
			}
		}else{
			$tag_list = $cate_list['p'];
		}
		
		if(!$tag){
			$tag=1;
		}

		$list_info['cid']=$tag;
		$this->assign('tag',$tag);

		$this->assign('cid',$tag);
		$this->assign('taginfo',$taginfo);
		$this->assign('cinfo',$cinfo);
		$list_info['sort']=$sort;
		$list_info['status']=$status;

		$page_size = C('ftx_index_page_size');
		$p = I('p',1, 'intval'); //页码
		$list_info['p']=$p;
		$start = $page_size * ($p - 1) ;

		
		
		if(C('ftx_site_cache')){
			$mdarray = $map;
			$mdarray['sort'] = $sort;
			$mdarray['tag'] = $tag;
			$mdarray['p'] = $p;
			$mdarray['order'] = $order;
			$md_id = md5(implode("-",$mdarray));
			$file = 'ba_'.$md_id;
			if(false === $items = S($file)){
				$items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
				$items = $this->_deal_item_list($items_list);
				S($file,$items);
			}
		}else{
			$items_list = $this->_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
			$items = $this->_deal_item_list($items_list);
		}

		
		$this->assign('items_list', $items['item_list']);
		$this->assign('seller_arr', $items['seller_arr']);

		$this->assign('list_info',$list_info);

		if(C('ftx_site_cache')){
			$mdarray = $map;
			$mdarray['sort'] = $sort;
			$mdarray['tag'] = $tag;
			$mdarray['status'] = $status;
			$mdarray['p'] = $p;
			$mdarray['order'] = $order;
			$md_id = md5(implode("-",$mdarray));
			$file = 'ba_count_'.$md_id;
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
    $this->assign('nav_curr', 'ba');
    $this->_config_seo(C('ftx_seo_config.cate'), array(
      'cate_name' => '【'.$cinfo['name'].'专区】',
      'seo_title' => $cinfo['seo_title'],
			'seo_keywords' => $cinfo['seo_keys'],
			'seo_description' => $cinfo['seo_desc'],
		    ));
		$this->display();
	}
}