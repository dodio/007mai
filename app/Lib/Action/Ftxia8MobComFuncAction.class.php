<?php
/**
 * 函数定义
 */
class Ftxia8MobComFuncAction extends Action{

	/**
     * 添加邮件到队列
     */
    protected function _mail_queue($to, $subject, $body, $priority = 1) {
        $to_emails = is_array($to) ? $to : array($to);
        $mails = array();
        $time = time();
        foreach ($to_emails as $_email) {
            $mails[] = array(
                'mail_to' => $_email,
                'mail_subject' => $subject,
                'mail_body' => $body,
                'priority' => $priority,
                'add_time' => $time,
                'lock_expiry' => $time,
            );
        }
        M('mail_queue')->addAll($mails);
        //异步发送邮件
        $this->send_mail(true);
    }

	protected function html($url){
		$ftxia_https = new ftxia_https();
		$ftxia_https->html($url);
		$content = $ftxia_https->results;
		if(!$content){
			$content = $this->http($url);
		}
		return $content;
    }

    public function send_mail($is_sync = true) {
        if (!$is_sync) {
            //异步
            session('async_sendmail', true);
            return true;
        } else {
            //同步
            session('async_sendmail', null);
            return D('mail_queue')->send();
        }
    }

    protected function _upload_init($upload) {
        $allow_max = C('ftx_attr_allow_size'); //读取配置
        $allow_exts = explode(',', C('ftx_attr_allow_exts')); //读取配置
        $allow_max && $upload->maxSize = $allow_max * 1024;   //文件大小限制
        $allow_exts && $upload->allowExts = $allow_exts;  //文件类型限制
        $upload->saveRule = 'uniqid';
        return $upload;
    }

	public function get_desc($iid){

		$res = $this->http("http://zaoshi.uz.taobao.com/api/get_tb.php?num_iid=".$iid);
		$res = iconv('GBK', 'UTF-8//IGNORE', $res);
		if (isset($res)){
			$ress = json_decode($res, true);
			if($ress['tmall'] == 1){
				$deschtml = $this->http("http://www.laicaiji.com/index.php?s=/admin/public/desc/tmall/b/id/".$iid);
			}else{
				$deschtml = $this->http("http://www.laicaiji.com/index.php?s=/admin/public/desc/id/".$iid);
			}
			if($deschtml){
				return $deschtml;
			}
		}

		if (isset($res)){
			$ress = json_decode($res, true);
			if($ress['tmall'] == 1){
				$itemurl = "http://detail.m.tmall.com/item.htm?id=".$iid;
			}else{
				//http://a.m.taobao.com/i43903166984.htm?spm=0.0.0.0&sid=b785427eb8720980&abtest=17&rn=bd4f5c28284d745b2ad6f81139674884
				$itemurl = "http://hws.m.taobao.com/cache/mtop.wdetail.getItemDescx/4.1/?data=%7B%22item_num_id%22%3A%22".$iid."%22%7D";
				$itemhtml	=  $this->http($itemurl);
				$result = json_decode($itemhtml, true);
				$pics = $result['data']['pages'][0];
				if($pics){
					$pics = str_replace("<img>","<img class=ftxia src=",$pics);
					$pics = str_replace("</img>"," />",$pics);
					return $pics;
				}
			}
		}else{
			$itemurl = "http://detail.m.tmall.com/item.htm?id=".$iid;
		}

		$itemhtml	=  $this->http($itemurl);
		$itemhtml = iconv('GBK', 'UTF-8//IGNORE', $itemhtml);
		$descUrl = get_word($itemhtml,'descUrl":"','"');
		if(!$descUrl){$descUrl = get_word($itemhtml,'apiItemDesc":"','"');}
		if($descUrl){
			$deschtml	= $this->http($descUrl);
			$deschtml	= iconv('GBK', 'UTF-8//IGNORE', $deschtml);
			$deschtml	= str_replace("';"," ",$deschtml);
			$deschtml	= str_replace("var desc='"," ",$deschtml);
			$deschtml	= str_replace("\\"," ",$deschtml);
			$deschtml	= str_replace('href="http://item.taobao.com/item.htm','><ftxiacom',$deschtml);
			$deschtml	= str_replace('href="http://detail.tmall.com/item.htm','><ftxiacom',$deschtml);
			$pat = "/<(\/?)(script|i?frame|style|html|body|title|link|a|meta|\?|\%)([^>]*?)>/isU";
			$deschtml	= preg_replace($pat,"",$deschtml);
			$deschtml	= str_replace('width: 0;',' ',$deschtml);
			$deschtml	= str_replace('height: 0;',' ',$deschtml);
			return $deschtml;
		}
		return '';
	}

	private function http( $url, $ua = "" ){
        $opts = array(
            "http" => array(
				'timeout'=>3,
                "header" => "USER-AGENT: Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36,Referer:http://www.taobao.com/",
            )
        );
        $context = stream_context_create( $opts );
        $html = @file_get_contents( $url, FALSE, $context );
        if($html === FALSE){
            $html = @file_get_contents( $url, FALSE, $context );
            if($html === FALSE){
                $html = @file_get_contents( $url, FALSE, $context );
            }
        }
        for($i = 0;$i <3;++$i){
            if(!($html === FALSE)){
                break;
            }
            $html = @file_get_contents( $url, FALSE, $context );
        }
		if($html === FALSE){
			$ch = curl_init(); 
			curl_setopt($ch, CURLOPT_URL, $url); 
			curl_setopt($ch, CURLOPT_HTTPHEADER, array('X-FORWARDED-FOR:58.23.4.141', 'CLIENT-IP:58.23.4.141'));//IP 
			curl_setopt($ch, CURLOPT_REFERER, "http://s.m.taobao.com/h5");   //来路 
			curl_setopt($ch, CURLOPT_HEADER, 1);
			curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5); //timeout on connect
			curl_setopt($ch, CURLOPT_TIMEOUT, 5); //timeout on response
			$html = curl_exec($ch); 
			curl_close($ch);
		}
        return $html;
    }


    /**
     * 上传文件
     */
    protected function _upload($file, $dir = '', $thumb = array(), $save_rule='uniqid') {
        $upload = new UploadFile();
        if ($dir) {
            $upload_path = upload_dir($dir . '/');
            $upload->savePath = $upload_path;
        }
        if ($thumb) {
            $upload->thumb = true;
            $upload->thumbMaxWidth = $thumb['width'];
            $upload->thumbMaxHeight = $thumb['height'];
            $upload->thumbPrefix = '';
            $upload->thumbSuffix = isset($thumb['suffix']) ? $thumb['suffix'] : '_thumb';
            $upload->thumbExt = isset($thumb['ext']) ? $thumb['ext'] : '';
            $upload->thumbRemoveOrigin = isset($thumb['remove_origin']) ? true : false;
        }
        //自定义上传规则
        $upload = $this->_upload_init($upload);
        if( $save_rule!='uniqid' ){
            $upload->saveRule = $save_rule;
        }

        if ($result = $upload->uploadOne($file)) {
            return array('error'=>0, 'info'=>$result);
        } else {
            return array('error'=>1, 'info'=>$upload->getErrorMsg());
        }
    }

	protected function str_mid_replace($string) {
		if (! $string || !isset($string[1])) return $string;
		$len = strlen($string);
		$starNum = floor($len / 2); 
		$noStarNum = $len - $starNum;
		$leftNum = ceil($noStarNum / 2); 
		$starPos = $leftNum;
		for($i=0; $i<$starNum; $i++) $string[$starPos+$i] = '*';

		return $string;
	}

 
    protected function ajaxReturn($status=1, $msg='', $data='', $dialog='') {
        parent::ajaxReturn(array(
            'status' => $status,
            'msg' => $msg,
            'data' => $data,
            'dialog' => $dialog,
        ));
    }

	protected function jsonReturn($data,$type='JSON'){
    	header('Content-Type:application/json; charset=utf-8');
    	exit(json_encode($data));
    }



    protected function jump_hidden_referer( $url, $wait = 0 ){

        $base_url = '<script language="javascript">var iurl="'.$url.'";document.write("<meta http-equiv=\"refresh\" content=\"0;url="+iurl+"\" />");</script>';
        if( false !== strpos("Gecko", $_SERVER["HTTP_USER_AGENT"]) || false !== strpos("WebKit", $_SERVER["HTTP_USER_AGENT"]) ){
            $script_url = '<script language="javascript">var iurl="data:text/html;base64,'.base64_encode($base_url).'";document.write("<meta http-equiv=\"refresh\" content=\"0;url="+iurl+"\" />");</script>';
        }else{
            $script_url = $base_url;
        }
        $script_url = str_replace( "\"0;", "\"".$wait.";", $script_url );
        
        echo $script_url;
        exit();
    }
}