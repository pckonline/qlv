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
    <%--导入js和css文本，便于管理代码--%>
    <link rel="stylesheet" type="text/css" href="moon/l.css">
    <link rel="stylesheet" type="text/css" href="moon/test.css">
    <script src="moon/jquery.js"></script>
    <script type="text/javascript">
        <%--这是登录和注册页面的交替--%>
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
            imgEle.src ="Regist_img?a="+new Date().getTime();
        }

//        实现了一个文本框的变化  如果没有输入  点击里面会清空原value  点击外面会出现原value
        var pl;
        function i1(a){
            if(a.value=="u&p"){
                pl= a.value;
                a.value="";
            }
        }
        function i2(a){
            if(a.value=="validation"){
                pl= a.value;
                a.value="";
            }
        }
        function i3(a){
            if(a.value=="用户名"){
                pl= a.value;
                a.value="";
            }
        }
        function i4(a){
            if(a.value=="密码"){
                pl= a.value;
                a.value="";
            }
        }
        function i5(a){
            if(a.value=="昵称"){
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
            alert(a);
        }
    </script>
</head>
<body style="background-color: #7afec6">
<%--登录和注册按钮--%>
<div class="dz">
    <div class="z">
        <a class="dz">注册</a>
    </div>
    <%--点击登录时弹出登录页面  通过使用hide 和show的jquery脚本实现--%>
    <div class="d">
        <a class="dz">登录</a>
    </div>
</div>
<%--每日一则小短文--%>
<div class="bordr">
    <p class="tit">by test</p>
    <p class="bod">当眼泪流下来,才知道,分开也是另一种明白。</p>
</div>
    <div class="bordr2">
        <%--登录界面--%>
            <div class="log">
                <s:form name="log" action="Login_login">
                    <s:actionmessage/><br/>
                    <s:textfield cssClass="input" id="input1" onfocus="i1(this)" onblur="b(this)" name="username" value="u&p" /><br/>
                    <s:password cssClass="input" name="password" /><br/>
                    <s:textfield cssClass="input" id="input2" onfocus="i2(this)" onblur="b(this)"  name="verfi" value="validation"/>
                    <s:submit cssClass="sub" value="Login"/>
                </s:form>
                <div class="vali">
                    <img style="width:130px;height: 50px" src="Login_img" id="img">
                    <a class="change" href="javascript:_change()">change</a>
                </div>
            </div>
        <div class="welcome">welcome__づ￣ 3￣)づ</div>
    </div>

<%--注册界面--%>
<div class="bordr3">
    <div class="log">
        <s:form name="log" action="Regist_regist">
            <s:actionmessage/><br/>
            <s:textfield cssClass="input" id="input3" onfocus="i3(this)" onblur="b(this)" name="username" value="用户名" /><br/>
            <s:textfield cssClass="input" id="input5"  name="password" onfocus="i4(this)" onblur="b(this)" value="密码" /><br/>
            <s:textfield cssClass="input" id="input6" onfocus="i5(this)" onblur="b(this)" name="uname" value="昵称" /><br/>
            <s:textfield cssClass="input" id="input4" onfocus="i2(this)" onblur="b(this)"  name="verfi" value="validation"/>
            <s:submit cssClass="sub" value="Regist"/>
        </s:form>
        <div class="vali">
            <img style="width:130px;height: 50px" src="Regist_img" id="img1">
            <a class="change" href="javascript:_change1()">change</a>
        </div>
    </div>
</div>
<%--登录出错的提醒--%>
<%
    if (request.getSession().getAttribute("cuowu")!=null){
%>
<%=request.getSession().getAttribute("cuowu")%>
<%--<script type="text/javascript">cuowu("请输入完整的信息！")</script>--%>
<%
    request.getSession().setAttribute("cuowu",null);
%>
<%
    }
%>
</body>
</html>
