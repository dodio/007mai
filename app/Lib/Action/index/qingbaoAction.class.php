<?php 
  class qingbaoAction extends ItemlistAction {

    public function _empty(){
      $this->redirect("/");
    }
    /**
     * 情侣必备
     * @return [type] [description]
     */
    public function qinglv(){
      $chanel_id = 27;
      $cid = I("cid",$chanel_id,"intval");
      $this->_common($cid);

      $cate_list = $this->_cate_mod->cate_cache(true);
      
      $subnav = $cate_list['s'][$chanel_id];
      $this->assign('nav_curr', 'qinglv');
      $this->assign('subnav', $subnav);
      $this->assign("chanel_id",$chanel_id);
      $this->display();
    }
    /**
     * 明星同款
     * @return [type] [description]
     */
    public function tongkuan(){
      $chanel_id = 285;
      $cid = I("cid",$chanel_id,"intval");
      $this->_common($cid);

      $cate_list = $this->_cate_mod->cate_cache(true);
      $subnav = $cate_list['s'][$chanel_id];
      $this->assign('nav_curr', 'tongkuan');
      $this->assign('subnav', $subnav);
      $this->assign("chanel_id",$chanel_id);
      $this->display();
    }
    /**
     * 约会神器
     * @return [type] [description]
     */
    public function yuehui(){
      $chanel_id = 286;
      $cid = I("cid",$chanel_id,"intval");
      $this->_common($cid);

      $cate_list = $this->_cate_mod->cate_cache(true);
      $subnav = $cate_list['s'][$chanel_id];

      $this->assign('nav_curr', 'yuehui');
      $this->assign('subnav', $subnav);
      $this->assign("chanel_id",$chanel_id);
      $this->display();
    }
    
  }

 ?>