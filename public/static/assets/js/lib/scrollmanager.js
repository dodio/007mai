;(function($){

    var calls = [];

    // var call_obj = {
    //     height:300, //检测的值（只在越过的时候检测）
    //     up:$.noop, 
    //     down:$.noop,
    //     everywhere:false
    // }

    var ot = 0;
    var doc = $(document);
    var conf = {
        delay:50
    }
    function handleScroll(){
        var st = doc.scrollTop();
        if(st === ot)
            return;
        $.each(calls,function(i,o){
            dealCalls(o,st,ot)
        });
        ot = st;
    }

    function dealCalls(o,st,ot,firsttime){
        if(o.height){
            if( st >= o.height){
                if(o.everywhere || !o.last || o.last === "up" || firsttime ){
                    $.isFunction(o.down) && o.down(st,ot);
                    o.last = "down";
                }
                return ;
            }else{
                if(o.everywhere || !o.last || o.last === "down" || firsttime ){
                    $.isFunction(o.up) && o.up(st,ot);
                    o.last = "up";
                }
                return ;
            }
        }

        if(!o.height ){
            if(st >= ot ){
                if(!o.last || o.last === "up"){
                    $.isFunction(o.down) && o.down(st,ot);
                    o.last = "down";
                }
                return ;
            }else{
                if(!o.last || o.last === "down"){
                    $.isFunction(o.up) && o.up(st,ot);
                    o.last = "up";
                }
                return ;
            }
        }

    }

    var thread = 0 ;
    function scroll(){
        clearTimeout(thread);
        setTimeout(function(){
            handleScroll();
        },conf.delay);
    }

    var scrollManager = {
        bind:function(){
            $(window).bind("scroll.scrollManager",scroll);
        },
        unbind:function(){
            $(window).unbind(".scrollManager");
        },
        conf:conf,
        clear:function(){
            calls = [];
        },
        add:function(obj){
            obj = $.extend({
                up:$.noop, 
                down:$.noop,
                everywhere:false},obj
                );

            var st = doc.scrollTop();

            dealCalls(obj,st,ot,true);

            calls.push(obj);
        },
        remove:function(obj){
            for(var i in calls){
                if(calls[i] === obj){
                    return calls.slice(i,1);
                }
            }
        }
    }
    scrollManager.bind();
    $.scrollManager = scrollManager;

  
})(jQuery);
