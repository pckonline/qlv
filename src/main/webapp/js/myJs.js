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

//        实现了一个文本框的变化  如果没有输入  点击里面会清空原value  点击外面会出现原value
var pl;

function i1(a){
    if(a.value=="用户名"){
        pl= a.value;
        a.value="";
    }
}
function i2(a){
    if(a.value=="昵称"){
        pl= a.value;
        a.value="";
    }
}
function i3(a){
    if(a.value=="自我介绍"){
        pl= a.value;
        a.value="";
    }
}
function i4(a){
    if(a.value=="职业"){
        pl= a.value;
        a.value="";
    }
}
function i5(a){
    if(a.value=="爱好"){
        pl= a.value;
        a.value="";
    }
}
function i6(a){
    if(a.value=="验证码"){
        pl= a.value;
        a.value="";
    }
}
function b(a){
    if(a.value==""){
        a.value=pl;
    }
}
function cuowu(a){
    $(".bordr3").hide(0);
    $(".bordr2").hide(0);
    alert(a);
}