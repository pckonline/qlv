<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="Dao.select.CompletInfor" %>
<%@ page import="Dao.cookie.Coolie" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-9-17
  Time: 下午4:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>确定其为ta</title>
</head>
<body>
<%
    String me_u = new String(request.getParameter("me_u").getBytes("ISO-8859-1"),"utf-8");
    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
    CompletInfor sq = ctx.getBean("complete",CompletInfor.class);
    sq.yestwo(Coolie.selectCookie(request, "zhanghao"),me_u);
    request.getRequestDispatcher("/beforeLove.jsp").forward(request,response);
%>
</body>
</html>
