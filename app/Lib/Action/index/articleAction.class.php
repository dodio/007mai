<?php
class articleAction extends FirstendAction {

	public function _initialize() {
        parent::_initialize();
		$this->cats_mod = D('article_cate');
		$this->article_mod = M('article');
		$this->cats_list = $this->cats_mod->get_cats();
        $this->assign('acats', $this->cats_list);
    }

	public function index(){
        $this->cate();
	}

	public function cate(){
		$cid = I('id','', 'trim');
		$title = '文章阅读';
		$p = I('p',1, 'intval');
		$map['status']="1";
		if($cid){
            $map['cate_id'] = $cid;
			$title = $this->cats_list[$cid]['name'];
			$cat = $this->cats_mod->find($cid);
        }else{
			$cat['name'] = '文章中心';
		}
		$page_size = 20;
		$start = $page_size * ($p - 1) ;
		$order = 'ordid asc ';
		$order.= ', id DESC';
		
        $article_list = $this->article_mod->where($map)->order($order)->limit($start . ',' . $page_size)->select();
		$this->assign('cid',$cid);
		$this->assign('article_list',$article_list);
		$count = $this->article_mod->where($map)->count();
        $pager = $this->_pager($count, $page_size);
        $this->assign('page', $pager->fshow());
		$this->_config_seo(C('ftx_seo_config.article_cate'), array(
			'title' => $cat['name'],
			'cate_name' => $cat['name'],
            'seo_title' => $cat['seo_title'],
            'seo_keywords' => $cat['seo_keys'],
            'seo_description' => $cat['seo_desc'],
        ));
        $this->display('index');
	}

	public function read(){
		$id = I('id','', 'intval');
        !$id && $this->_404(); 
		D('article')->hits($id);
        $article = $this->article_mod->find($id);
		$this->_config_seo(C('ftx_seo_config.article'), array(
			'title' => $article['title'],
            'seo_title' => $article['seo_title'],
            'seo_keywords' => $article['seo_keys'],
            'seo_description' => $article['seo_desc'],
        ));
        $this->assign('article',$article); //分类选中
        $this->display();
	}

}