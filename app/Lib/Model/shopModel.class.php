<?php 
  class shopModel extends RelationModel{
    //关联关系
    protected $_link = array(
        'item_cate' => array(
            'mapping_type' => BELONGS_TO,
            'class_name' => 'item_cate',
            'foreign_key' => 'cate_id'
        )
    );
  }

 ?>