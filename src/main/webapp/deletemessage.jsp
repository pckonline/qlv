<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="Dao.select.AboutMessage" %>
<%@ page import="Dao.cookie.Coolie" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-9-14
  Time: 上午10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <%
        String title = new String(request.getParameter("deletemessage").getBytes("ISO-8859-1"),"utf-8");
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        AboutMessage sq = ctx.getBean("aboutmessage",AboutMessage.class);
        sq.deletemessage(title);
        request.getRequestDispatcher("/slowlife.jsp").forward(request,response);
    %>
</body>
</html>
