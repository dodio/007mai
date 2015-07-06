<?php
class shibaAction extends ItemlistAction {
	public function index()
	{
    $sort = I('sort', 'default', 'trim'); //排序
    $tag  = I('cid',1,'intval');

    redirct_301( U("qingbao/shiba",array(
    	"cid"=>$tag,
    	"sort" => $sort
    	) ) );
	}
}