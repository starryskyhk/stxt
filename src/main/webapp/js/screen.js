
var screenw = window.screen.width;
function screenMin(){
    // 是否属于小设备
    return screenw < 1000
}

function screenStyle(){
    if (screenMin()) {
    	
    	
        // 小屏幕  <!-- 引入 css  --> <link rel="stylesheet" href="'+ baseurl +'/commons/mobile/mobile_css/index.css"> <link rel="stylesheet" type="text/css" href="'+ baseurl +'/commons/mobile/mobile_css/public.css" /><link rel="stylesheet" type="text/css" href="'+ baseurl +'/commons/mobile/mobile_css/mobile.css" />
        document.write('<!-- 引入js --><script src="'+ baseurl +'/commons/mobile/mobile_js/rem.js"></script><script src="'+ baseurl +'/commons/mobile/mobile_js/vant.min.js"></script><script src="'+ baseurl +'/commons/mobile/mobile_js/touch-emulator.js"></script>')
        
        
        setTimeout(function(){
            var textArea = document.querySelectorAll('.ub-text-area')
            textArea.forEach(function(item){
                makeExpandingArea(item);
            })
        },1000)
    }else{
       // document.write('<!-- 引入 css  --> <link rel="stylesheet" href="'+ baseurl +'/commons/statics/styles/ub.css"></link>')
    }
}
screenStyle()

function makeExpandingArea(el) {
            var timer = null;
            //由于ie8有溢出堆栈问题，故调整了这里
            var setStyle = function(el, auto) {
                if (auto) el.style.height = 'auto';
                el.style.height = el.scrollHeight + 'px';
            }
            var delayedResize = function(el) {
                if (timer) {
                    clearTimeout(timer);
                    timer = null;
                }
                timer = setTimeout(function() {
                    setStyle(el)
                }, 200);
            }
            if (el.addEventListener) {
                el.addEventListener('input', function() {
                    setStyle(el, 1);
                }, false);
                setStyle(el)
            } else if (el.attachEvent) {
                el.attachEvent('onpropertychange', function() {
                    setStyle(el)
                })
                setStyle(el)
            }
            if (window.VBArray && window.addEventListener) { //IE9
                el.attachEvent("onkeydown", function() {
                    var key = window.event.keyCode;
                    if (key == 8 || key == 46) delayedResize(el);
        
                });
                el.attachEvent("oncut", function() {
                    delayedResize(el);
                }); //处理粘贴
            }
        }