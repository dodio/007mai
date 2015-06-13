<?php 
class shopAction extends BackendAction {

  public function _initialize() {
        parent::_initialize();
        $this->_mod = D('shop');

        $levels = array(
          "50b2e721a6c1e.jpg"=>"三星"
          );


        $this->assign("levels",$levels);
  }
  public function _search(){
    $map = array();
    ($start_time_min = $this->_request('start_time_min', 'trim')) && $map['start_time'][] = array('egt', strtotime($start_time_min));
    ($start_time_max = $this->_request('start_time_max', 'trim')) && $map['start_time'][] = array('elt', strtotime($start_time_max)+(24*60*60-1));
    ($end_time_min = $this->_request('end_time_min', 'trim')) && $map['end_time'][] = array('egt', strtotime($end_time_min));
    ($end_time_max = $this->_request('end_time_max', 'trim')) && $map['end_time'][] = array('elt', strtotime($end_time_max)+(24*60*60-1));
    $cate_id = $this->_request('cate_id', 'intval');
    ($name = $this->_request('name', 'trim')) && $map['name'] = array('like', '%'.$name.'%');
    $spid = 0;
    $items_cate_mod = D("items_cate");
    if($cate_id){
      $cinfo =  $items_cate_mod->cate_info($cate_id);
      $spid = $cinfo['spid'];
      if( $spid==0 ){
          $spid = $cate_id;
      }else{
          $spid .= $cate_id;
      }
      $map["cate_id"] = array("IN",$items_cate_mod->get_child_ids($cate_id,true));
    }
    // dump($map);
    $this->assign('search', array(
        'start_time_min' => $start_time_min,
        'start_time_max' => $start_time_max,
        'end_time_min' => $end_time_min,
        'end_time_max' => $end_time_max,
        "selected_ids"=>$spid,
        "cate_id"=>$cate_id,
        'name' => $name
    ));
    return $map;
  }

  public function _before_index(){
    $cate_data = D("items_cate")->cate_data_cache();
    $this->assign("cate_data",$cate_data);
  }

  public function _before_edit_show($info){
    $mod = D("items_cate");
    $cate_id = $info['cate_id'];
    $cinfo = $mod->cate_info($cate_id);
    $spid = $cinfo['spid'];
    if( $spid==0 ){
        $spid = $cate_id;
    }else{
        $spid .= $cate_id;
    }
    $this->assign("selected_ids",$spid);
    return $info;
  }

  public function _before_insert($data){
    $data['add_time'] = time();
    $data['start_time'] = strtotime($data["start_time"]);
    $data['end_time'] = strtotime($data["end_time"]);
    return $data;
  }

  public function _before_update($data){
    $data['start_time'] = strtotime($data["start_time"]);
    $data['end_time'] = strtotime($data["end_time"]);
    return $data;
  }



  public function set_time(){
    $ids = I("ids","","trim");
    $start_time = I("start_time","","trim");
    $end_time = I("end_time","","trim");
    if($ids == ""){
        $this->ajaxReturn(0,"ID 错误");
    }
    if($start_time == "" && $end_time == ""){
        $this->ajaxReturn(0,"没有时间参数");
    }

    $ids = explode(",", $ids);
    $data = array();
    $data["id"] = array("IN",$ids);
    if($start_time!=""){
        $data['start_time'] = strtotime($start_time);
    }
    if($end_time!=""){
        $data['end_time'] = strtotime($end_time);
    }

    if(false !== $this->_mod->save($data)){
        $this->ajaxReturn(1,"设置成功");
    }else{
        $this->ajaxReturn(0,"没有成功");
    }
  }
}

 ?>