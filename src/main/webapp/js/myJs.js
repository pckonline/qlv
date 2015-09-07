$(document).ready(function(){
    $(".bordr3").hide(0,function(){
        $(".z").click(function(){
            $(".bordr2").hide(500,function(){
                $(".bordr3").toggle(500);
            });
        });
    });
    $(".bordr2").hide(0,function(){
        $(".d").click(function(){
            $(".bordr3").hide(500,function(){
                $(".bordr2").toggle(500);
            });
        });
    });
});
function _change(){
    var imgEle=document.getElementById("img");
    imgEle.src ="Login_img?a="+new Date().getTime();
}
function _change1(){
    var imgEle=document.getElementById("img1");
    imgEle.src ="Regi_img?a="+new Date().getTime();
}
function cuowu(a){
    $(".bordr3").hide(0);
    $(".bordr2").hide(0);
    alert(a);
}