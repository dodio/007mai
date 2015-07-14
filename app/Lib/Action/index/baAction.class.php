<?php
class baAction extends ItemlistAction {
	public function index(){
    $sort = I('sort', 'default', 'trim'); //排序
    $tag  = I('cid',1,'intval');

    redirect_301( U("qingbao/ba",array(
    	"cid"=>$tag,
    	"sort" => $sort
    	) ) );
	}
}