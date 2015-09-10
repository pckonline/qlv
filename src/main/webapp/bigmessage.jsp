<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="Dao.popj.entity.Person" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.select.AboutMessage" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="js/myJs.js">
    </script>
    <script type="text/javascript" src="js/bootstrap.min.js">
    </script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<div CLASS="container">
<%
    String title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"utf-8");
%>
<div class="panel panel-default">
    <div class="panel-body">
        <h2 style="text-align: center"><%=title%></h2>
    </div>

    <%
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        AboutMessage sq = ctx.getBean("aboutmessage",AboutMessage.class);
        List list =sq.selfMessageBody(Coolie.selectCookie(request,"zhanghao"),title);
        for(Object ele : list){
    %>

    <%
        Object object = (Object) ele;
        Person person = (Person) ele;
    %>
        <div class="panel-footer"><h3><%=person.getMessage().getBody()%></h3></div>
    <%

        }
    %>
</div>
<div class="d">
    <%if (Coolie.selectCookie(request, "sex")!=null&&Coolie.selectCookie(request,"sex").equals("男")){
    %>
    <a class="dz" href="boy.jsp">返回</a><%}else{
%>
    <a class="dz" href="girl.jsp">返回</a>
    <% } %>
</div>

</div>
</body>
</html>