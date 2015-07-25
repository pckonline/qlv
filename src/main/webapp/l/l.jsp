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
    <link rel="stylesheet" type="text/css" href="../moon/l.css">
    <link rel="stylesheet" type="text/css" href="../moon/test.css">
    <script src="../moon/jquery.js"></script>
</head>
<body style="background-color: #7afec6">
<%--登录和注册按钮--%>
<%
    if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。
%>
<div>
    <a href="../index.jsp"><img src="../sc/log.gif" alt="爱情旅游聚会" /></a>
</div>
<%--每日一则小短文--%>
<div class="bordr">
    <p class="tit">by test</p>
    <p class="bod">当眼泪流下来,才知道,分开也是另一种明白。</p>
</div>
<%
}
else
{
%>
<%
    request.getRequestDispatcher("/index.jsp").forward(request,response);//当为空时，返回登录界面。
%>
<%
    }
%>
</body>
</html>
