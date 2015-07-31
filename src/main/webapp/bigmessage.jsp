<%@ page import="Dao.cookie.Coolie" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-30
  Time: 下午8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>大屏查看文章</title>
    <link href="css/l.css" rel="stylesheet">
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="js/modernizr.js"></script>
</head>
<body>
<%
    String title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"utf-8");
    String body = new String(request.getParameter("body").getBytes("ISO-8859-1"),"utf-8");

%>
<div class="jumbotron">
    <h1><%=title%></h1>
    <p><%=body%></p>
</div>


<div class="d">
    <%if (Coolie.selectCookie(request, "sex")!=null&&Coolie.selectCookie(request,"sex").equals("男")){
    %>
    <a class="dz" href="boy.jsp">返回</a><%}else{
%>
    <a class="dz" href="girl.jsp">返回</a>
    <% } %>
</div>
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
