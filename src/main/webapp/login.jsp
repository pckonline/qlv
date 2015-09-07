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
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/l.css">
    <link rel="stylesheet" type="text/css" href="css/test.css">
    <script src="js/jquery.js"></script>
    <script type="text/javascript">
        function _change(){
            var imgEle=document.getElementById("img");
            imgEle.src ="Login_img?a="+new Date().getTime();
        }

    </script>
</head>
<body>
    <%--登录界面--%>
    <div style="width: 400px">
        <div class="log">
            <form name="log" class="form-horizontal" action="Login_login" method="post">
                <s:actionmessage/><br/>
                <input type="text" class="form-control" id="input1" name="username" placeholder="用户名" /><br/>
                <input type="text" class="form-control" name="password" placeholder="密码" /><br/>
                <input type="text" class="form-control" id="input2"   name="verfi" placeholder="验证码"/><br/>
                <input type="checkbox" name="knowme">记住我
                <input type="submit" class="sub" value="Login"/>
            </form>
            <div class="vali">
                <img style="width:130px;height: 50px" src="Login_img" id="img">
                <a href="javascript:_change()" class="btn btn-default btn-lg active" role="button">change</a>
            </div>
        </div>
    </div>

    <div class="welcome">welcome__づ￣ 3￣)づ</div>
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
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
