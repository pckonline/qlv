<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="Dao.select.AboutMessage" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="Dao.popj.entity.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-9-10
  Time: 下午6:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>知识的聚会</title>
    <link rel="stylesheet" type="text/css" href="/css/l.css">
    <link rel="stylesheet" type="text/css" href="/css/test.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <script src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/myJs.js">
    </script>
    <script type="text/javascript" src="/js/bootstrap.min.js">
    </script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
</head>
<body>
<%
    if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。
%>
    <div class="container">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-3">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-success">最新日志</a>
                        <%
                            ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
                            AboutMessage sq = ctx.getBean("aboutmessage",AboutMessage.class);
                            List list =sq.selfMessage("online");
                            for(Object ele : list){
                        %>

                        <%
                            Object object = (Object) ele;
                            Person person = (Person) ele;
                        %>

                        <a href="/hui/big.jsp?title=<%=person.getMessage().getTitle()%>" class="list-group-item list-group-item-success" ><%=person.getMessage().getTitle()%></a>
                        <%
                            }
                        %>

                    </div>
                </div>
                <div class="col-xs-2">

                </div>
                <div class="col-xs-7">
                    <a href="/slowlifeallmessage.jsp?fenye=0" class="btn btn-primary btn-lg active" role="button">查看全部日志</a>
                </div>
            </div>
        </div>
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
    %>
</body>
</html>
