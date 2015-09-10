<%@ page import="Dao.popj.entity.Person" %>
<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.select.AboutMessage" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-9-9
  Time: 下午2:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看全部的日志</title>
    <link href="css/l.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="js/myJs.js">
    </script>
    <script type="text/javascript" src="js/bootstrap.min.js">
    </script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<%
if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。
%>
<div class="container">
<div class="list-group">

    <%
        int fenye = Integer.parseInt(request.getParameter("fenye"));

    %>
    <%
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        AboutMessage sq = ctx.getBean("aboutmessage",AboutMessage.class);

        List list1 =sq.selfMessageAll(Coolie.selectCookie(request, "zhanghao"),fenye);
        for(Object ele1 : list1){
    %>

    <%

        Object object1 = (Object) ele1;
        Person person1 = (Person) ele1;
    %>

    <a href="bigmessage.jsp?title=<%=person1.getMessage().getTitle()%>" class="list-group-item list-group-item-success"><%=person1.getMessage().getTitle()%></a>

    <%

        }
    %>
    <nav>
        <ul class="pager">
            <li><a href="/slowlifeallmessage.jsp?fenye=<%=fenye-=10%>">Previous</a></li>
            <li><a href="/slowlifeallmessage.jsp?fenye=<%=fenye+=20%>">Next</a></li>
        </ul>
    </nav>

</div>
<div class="d">
    <%if (Coolie.selectCookie(request,"sex")!=null&&Coolie.selectCookie(request,"sex").equals("男")){
    %>
    <a class="btn btn-primary btn-lg" href="boy.jsp" role="button">返回</a><%}else{
%>
    <a class="btn btn-primary btn-lg" href="girl.jsp" role="button">返回</a>
    <% } %>
</div>
<%
}
else
{
%>
<%
request.getRequestDispatcher("/login.jsp").forward(request,response);//当为空时，返回登录界面。
%>
<%
}
%></div>
</body>
</html>
