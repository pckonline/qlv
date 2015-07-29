<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-25
  Time: 下午3:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>登录</title>

    <script src="l/blog/js/jquery.js"></script>
    <script type="text/javascript">
        function _change(){
            var imgEle=document.getElementById("img");
            imgEle.src ="Login_img?a="+new Date().getTime();
        }
        var pl;
        function i2(a){
            if(a.value=="验证码"){
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
    </script>
</head>
<body>
<div class="bordr2">
    <%--登录界面--%>
    <div class="log">
        <s:form name="log" action="Login_login">
            <s:actionmessage/><br/>
            <s:textfield cssClass="input" id="input1" onfocus="i3(this)" onblur="b(this)" name="username" value="用户名" /><br/>
            <s:password cssClass="input" name="password" /><br/>
            <s:textfield cssClass="input" id="input2" onfocus="i2(this)" onblur="b(this)"  name="verfi" value="验证码"/>
            <s:radio list="{'记住我'}" name="knowme" />
            <s:submit cssClass="sub" value="Login"/>
        </s:form>
        <div class="vali">
            <img style="width:130px;height: 50px" src="Login_img" id="img">
            <a class="change" href="javascript:_change()">change</a>
        </div>
    </div>
    <div class="welcome">welcome__づ￣ 3￣)づ</div>
</div>
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
