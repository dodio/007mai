<?php 

class adminAction extends FirstendAction {

  public function _initialize() {
    parent::_initialize();
  }
  /**
   * 隐藏宝贝
   * @return [type] [description]
   */
  public function noshow(){
    $id = I('id');
    if(!$this->visitor->right('admin_item')){
      $this->ajaxReturn(0,'越权！');
    }
    $mod = M('items');
    $where = array('num_iid'=>$id);
    $isshow = $mod->where($where)->getField('isshow');
    $data = array("isshow"=>($isshow == 1 ? 0 : 1) );
    if($mod->where($where)->save($data)){
      $this->ajaxReturn(1,"操作成功", $data);
    }else{
      $this->ajaxReturn(0,$this->_mod->getError());
    }
  }

  public function topitem(){
    $id = I('id');
    if(!$this->visitor->right('admin_item')){
      $this->ajaxReturn(0,'越权！');
    }
    $mod = M('items');
    $where = array('num_iid'=>$id);
    $ordid = $mod->where($where)->getField('ordid');
    $data = array("ordid"=>($ordid == 9999 ? 1000 : 9999) );
    if($mod->where($where)->save($data)){
      $this->ajaxReturn(1,"操作成功", $data);
    }else{
      $this->ajaxReturn(0,$this->_mod->getError());
    }
  }

  public function _empty(){
    $this->ajaxReturn(0,"sun of the beach!");
  }

}
?>