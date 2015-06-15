<?php 
  defined('THINK_PATH') or exit();
  
  class score_changeBehavior extends Behavior{

    public function run(&$_data){
      
        $option = array('expire'=>60);
        $actions = C("score_action");
        if(!isset($actions[$_data['action']]))
          return;
        $data = array(
          "action" => $actions[$_data['action']]['lang'],
          "score" => $_data['score']
          );
        cookie("score_change",$data,$option);
    }
  }
 ?>