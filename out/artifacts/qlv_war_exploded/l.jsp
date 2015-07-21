<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-20
  Time: 下午7:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>情</title>
    <link rel="stylesheet" type="text/css" href="moon/l.css">
    <link rel="stylesheet" type="text/css" href="moon/test.css">
    <script src="moon/jquery.js"></script>
    <script type="text/javascript">
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
    </script>
</head>
<body style="background-color: #7afec6">
<div class="dz">
    <div class="z">
        <a class="dz">注册</a>
    </div>
    <div class="d">
        <a class="dz">登录</a>
    </div>
</div>
<div class="bordr">
    <p class="tit">dffffff</p>
    <p class="bod">萨克激发了将萨拉咖啡的建立卡萨节点三大类反馈急啊上来看将大幅来可是记得了符空间阿三来看待将弗兰克时间啊登录咖啡机拉萨可将</p>
</div>
    <div class="bordr2">
        <%--登录界面--%>
            <div class="log">
                <s:form name="log" action="Login_login">
                    <s:actionmessage/><br/>
                    <s:textfield cssClass="input" name="username" value="u&p" /><br/>
                    <s:password cssClass="input" name="password" /><br/>
                    <s:textfield cssClass="input" name="verfi" value="validation"/>
                    <s:submit cssClass="sub" value="Login"/>
                </s:form>
                <div class="vali">
                    <img style="width:130px;height: 50px" src="Login_img" id="img">
                    <a class="change" href="javascript:_change()">换一张</a>
                </div>
            </div>
        <div class="welcome">welcome__づ￣ 3￣)づ</div>
    </div>
<div class="bordr3">
<%--注册界面--%>
</div>
</body>
</html>
