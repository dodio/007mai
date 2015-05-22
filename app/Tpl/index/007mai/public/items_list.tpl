
	<ul class="goods-list {:C('ftx_site_wc')} group">
		<volist name="items_list" id="item" key="i" mod="4">
		<li  class="<eq name="mod" value="3"> last</eq>">
			<div class="sid_{$item.sellerId}  list-good   {$item.class} " id="nid_{$item.num_iid}">
				<div class="good-pic">
					<a biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}"   target="_blank"><img src='/static/assets/images/blank.gif' data-original='{:attach(get_thumb($item['pic_url'], '_b'),'item')}' alt="{$item.title}" class="lazy"   /></a>
					<div class="yhq"> </div>
				</div>
				<h3 class="good-title">
					<if condition="$item.ems eq 1">[包邮]</if><a target="_blank" biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}" class="title">{$item.title}</a>
					<if condition="$item.volume gt 0 "><span class="sold">已售<em>{$item.volume}</em></span><else/><span class="sold">新品上架<em></em></span></if>
				</h3>
				<div class="good-price">
					<span class="price-current"><em>￥</em>{$item.coupon_price}</span>
					<span class="des-other">
						<span class="price-old"><if condition="$item.zk lt 10"><em>¥{$item.price}</em><u>({$item.zk}折)</u> </if></span>
						<span class="discount show">
							<b class="icon_gai" title="拍下改价"></b>
							<notempty name="visitor">
							<if condition="$visitor['username'] eq C('ftx_index_admin')">
							 <a title="不显示" href="javascript:void(0);" data-id="{$item.num_iid}">取消</a> 
							</if>
							</notempty>
						</span>
					</span>
					<div class="btn-new {$item.class}">
						<if condition="$item.class eq 'wait'">
							<a href="javascript:" target="_blank" rel="nofollow"><span>明日</span><b>10:00</b></a>
						<elseif condition="($item.class eq 'end') OR ($item.class eq 'sellout') OR ($item.class eq 'buy')"/>
							<if condition="$item.shop_type eq 'C' ">
							<a biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}"  target="_blank" rel="nofollow"><em class="icon_n"></em><span>淘宝</span></a>
							<elseif condition="$item.shop_type eq 'B' " />
							<a biz-itemid="{$item['num_iid']}" isconvert=1 href="http://detail.tmall.com/item.htm?id={$item['num_iid']}"  target="_blank" rel="nofollow"><em class="icon_t"></em><span>天猫</span></a>
							<elseif condition="$item.shop_type eq 'D' " />
							<a href="{$item.click_url}" target="_blank" rel="nofollow"><em class="icon_j"></em><span>京东</span></a>
							<else /><a href="{:U('jump/'.$item['num_iid'])}" target="_blank" rel="nofollow"><span>去抢购</span></a>
							</if>
						</if>
					</div>
				</div>
				<!-- like -->
				<if condition="$nav_curr eq 'like'">
				<a class="my-like" lkid="{$item.id}" gtype="1" lks="0" title="取消收藏" style="display: block;"><i class="like-ico l-active"><span class="heart_left"></span><span class="heart_right"></span></i></a>
				<else/>
				<a class="my-like" lkid="{$item.id}" gtype="1" lks="1" title="加入收藏"><i class="like-ico "><span class="heart_left"></span><span class="heart_right"></span></i></a>
				</if>
				<!-- end like -->
				<div class="pic-des"> 
					<if condition="$item.class eq 'wait'">
						<h5><em>开始时间：</em><i>{$item.coupon_start_time|date="m月d日 H时i分",###}</i></h5>
					<else />
						<notempty name="item.coupon_end_time">
						<h5><em>结束时间：</em><i>{$item.coupon_end_time|date="m月d日 H时i分",###}</i></h5>
						</notempty>
					</if>
					<if condition="$item.sellerId neq ''"><h6><em>卖家店铺：</em><i><a data-type="1" biz-sellerid="{$item['sellerId']}" data-tmpl="140x190" data-tmplid="3" data-rd="2" data-style="1" data-border="1" href="javascript:">{$item.nick}</a></i></h6>
                    </if>

				</div>
				{$item.coupon_start_time|newicon}
				<if condition="($item.class eq 'sellout') OR ($item.class eq 'end')">
				<div style="display:block" class="box-hd">
				   <div class="mask-bg"></div>
				   <em class="buy-over">抢光了</em>
				</div>
				</if>
			</div>
		</li>
		</volist>
	</ul>
<script>
(function($) {
    
    $("a.my-like").bind('click', 
    function() {
        var pid = $(this).attr("lkid");
        if (!$.ftxia.dialog.islogin()) return;
	var obj = $(this);
        var parent = obj;
        var id = parent.attr('lkid');
        var s = parent.attr('lks');
        var gtype = parent.attr("gtype");

        F_createEle(obj);
        setTimeout(function(){$("#likeico").remove()}, 600);
        if(s == 1) {
            // like success
            parent.attr('lks',0);
            obj.find('i.like-ico').addClass('l-active');
            obj.closest('li').find('.like-ceng').show();
            $("#likeico").removeClass('unliked').addClass('like-big').addClass('demo1');
            parent.css('display','block');
        } else {
            // un like success
            parent.attr('lks',1);
            obj.find('i.like-ico').removeClass('l-active');
            $("#likeico").removeClass('l-active').addClass('unliked').removeClass('demo1');
            obj.closest('li').find('.like-ceng').hide();
            parent.css('display','');
        }

        $.ajax({
            url: FTXIAER.root + '/index.php?m=ajax&a=like',
            type: 'POST',
            data: {
                pid: pid
            },
            dataType: 'json',
            success: function(result) {
                if (result.status == 1) {
                    $.ftxia.tip({
                        content: result.msg,
                        icon: 'success'
                    });
                } else if (result.status == 2) {
                    $.ftxia.tip({
                        content: result.msg,
                        icon: 'error'
                    });
                } else {
                    $.ftxia.tip({
                        content: result.msg,
                        icon: 'error'
                    });
                }
            }
        });
    });
})(jQuery);

 var F_createEle = function(ele){
        var div = document.createElement('div');
        div.id = "likeico";
        div.innerHTML = "<span class='heart_left'></span><span class='heart_right'></span>";
        ele.append(div);
    }

var Mylike_add = function(event) {
	if(!$.ftxia.dialog.islogin()) return !1;
 
        var obj = $(this);
        var parent = obj;
        var id = parent.attr('lkid');
        var s = parent.attr('lks');
        var gtype = parent.attr("gtype");

        F_createEle(obj);
        setTimeout(function(){$("#likeico").remove()}, 600);
        if(s == 1) {
            // like success
            parent.attr('lks',0);
            obj.find('i.like-ico').addClass('l-active');
            obj.closest('li').find('.like-ceng').show();
            $("#likeico").removeClass('unliked').addClass('like-big').addClass('demo1');
            parent.css('display','block');
        } else {
            // un like success
            parent.attr('lks',1);
            obj.find('i.like-ico').removeClass('l-active');
            $("#likeico").removeClass('l-active').addClass('unliked').removeClass('demo1');
            obj.closest('li').find('.like-ceng').hide();
            parent.css('display','');
        }
    }

 var Pause_click = function(){
        $("a.my-like").bind('click', _.throttle( Mylike_add, 300 ) );
        $(".list-good").bind('mouseleave',function(){$('.like-ceng',$(this)).hide();});

        //
        
	var b = [];
        var ss  = $('.my-like').each(function(i){
            var gtype = $(this).attr("gtype");
            var prefix = "";
            //得到商品主键前缀
            if(gtype==3){
                prefix = "t";
            }
            b[i] = prefix + $(this).attr('lkid');
        });
        if(  b.length>0) {
            var sss = b.join(',');

	    $.ajax({
            url: FTXIAER.root + '/index.php?m=ajax&a=like_status',
            type: 'get',
            data: {
                pid: sss
            },
            dataType: 'json',
            success: function(result) {
                if (result.status == 1) 
		{
                    var s = result.data.toString();
                            var newgidArr = s;
                            //for (key in s) {
                            //    newgidArr.push(s[key]);
                            //}
                            $('.my-like').each(function(i){
                                var gtype = $(this).attr("gtype");
                                var prefix = "";
                                //得到商品主键前缀
                                if(gtype==3){
                                    prefix = "t";
                                }
                                var sid = $(this).attr('lkid');
                                var prefixsid = prefix + $(this).attr('lkid');
                                if( newgidArr.indexOf(sid) != -1 || newgidArr.indexOf(prefixsid) != -1 ) {
                                    $(this).css('display','block');
                                    $(this).attr('lks',0);
                                    $('i.like-ico',$(this)).addClass('l-active');
                                }
                            });



                } else if (result.status == 2) {
                    $.ftxia.tip({
                        content: result.msg,
                        icon: 'error'
                    });
                } else {
                    $.ftxia.tip({
                        content: result.msg,
                        icon: 'error'
                    });
                }
            }
        });
	}


    }
     
    //加载完成后读取收藏
    $(function(){
    	 // Pause_click();
    });

    $(function(){
        var F_hidden_zhe = function(){
            $(".goods-list li").each(function(){
                if($(this).find('span.price-old').width() > 60){
                    $(this).find('u').hide();
                }
            })
        }
    F_hidden_zhe();
    })
</script>