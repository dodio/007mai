<?php
class sitemapModel extends Model {
/*百度sitemap*/	
    public function get_last_data() {
        $day_start = strtotime(date('Y-m-d', time())) - 86400;
        $day_end = $day_start + 86399;
        $sql = "SELECT id,title,add_time FROM " . C('DB_PREFIX') . "items WHERE id ORDER BY id DESC limit 2000";
        $result = $this->query($sql);
        return $result;
    }
    public function get_cat_list() {
        $sql = "SELECT id,add_time FROM " . C('DB_PREFIX') . "items_cate WHERE pid = 0 ";
        return $this->query($sql);
    }
    public function get_article() {
        $add_time_start = strtotime(date('Y-m-d', time())) - 86400;
        $add_time_end = $add_time_start + 86399;
        $sql = "SELECT id,add_time FROM " . C('DB_PREFIX') . "article WHERE id ORDER BY id DESC limit 1000";
        return $this->query($sql);
    }
/*自动内链地图*/		
    public function getcate() {
        return D('items_cate')->cate_data_cache();
    }
    public function hottag($limit = 100) {
        $hotword = M('setting')->where(array(
            'name' => 'hot_tag'
        ))->getField('data');
        $wordlists = explode('|', $hotword);
        $limit_word = array_slice($wordlists, 0, $limit);
        return $limit_word;
    }
    public function article($limit = 20) {
        $cate = D('article_cate')->where(array(
            'status' => 1
        ))->field('id,name')->select();
        $where = array(
            'status' => 1
        );
        $order = ' ordid asc,last_time desc ';
        $article = array();
        foreach ($cate as $k => $v) {
            $where['cate_id'] = $v['id'];
            $article[$k]['art'] = D('article')->where($where)->field('id,title,add_time')->order($order)->limit($limit)->select();
            $article[$k]['cate'] = $v;
        }
        return $article;
    }
    public function deal($data = array() , $url, $iq = '1.0', $pl = 'daily', $t = 'item') {
        if (empty($data)) return false;
        $rz = array();
        $rz1 = array();
        if ($t == 'item') {
            foreach ($data as $k => $v) {
                $rz[$k]['url']['loc'] = $this->url($url, 'index/cate', array(
                        'id' => $v['id']
                    ));
                $rz[$k]['url']['changefreq'] = $pl;
                $rz[$k]['url']['priority'] = $iq;
                $rz[$k]['url']['lastmod'] = date('Y-m-d', time());
            }
        } elseif ($t == 'article') {
            
        }
        return $rz;
    }
    public function url($url, $flag, $id) {
        return $url . U($flag, $id);
    }
    public function arr2xml($arr = array()) {
        if (empty($arr)) return false;
        $xml = new DOMDocument('1.0', 'utf-8');
        $urlset = $xml->createElement('urlset');
        $xml->appendChild($urlset);
        foreach ($arr as $k => $v) {
            // dump($v);
            $url = $xml->createElement('url');
            $loc = $xml->createElement('loc');
            $locc = $xml->createTextNode($v['url']['loc']);
            $loc->appendChild($locc);
            $lastmod = $xml->createElement('lastmod');
            $lastmodd = $xml->createTextNode($v['url']['lastmod']);
            $lastmod->appendChild($lastmodd);
            $changefreq = $xml->createElement('changefreq');
            $changefreqq = $xml->createTextNode($v['url']['changefreq']);
            $changefreq->appendChild($changefreqq);
            $priority = $xml->createElement('priority');
            $priorityy = $xml->createTextNode($v['url']['priority']);
            $priority->appendChild($priorityy);
            $url->appendChild($loc);
            $url->appendChild($lastmod);
            $url->appendChild($changefreq);
            $url->appendChild($priority);
            $urlset->appendChild($url);
        }
        return $xml->saveXML();
    }
}
?>
