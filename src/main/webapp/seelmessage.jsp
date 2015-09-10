<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="Dao.select.Dandz" %>
<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.popj.entity.Person" %>
<%@ page import="Dao.popj.entity.Lmessage" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-9-7
  Time: 下午5:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言板</title>
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
<br/>
<br/>
<br/>
<br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-3"><a href="/seelmessageall.jsp?fenye1=0" role="button" class="btn btn-success btn-lg active">查看全部留言</a> </div>
         <div class="col-xs-6">
            <div class="list-group">
    <%
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        Dandz sq = ctx.getBean("dandz",Dandz.class);
        List list=sq.seelmessage(request, Coolie.selectCookie(request, "zhanghao"));
        for(Object ele : list){
    %>

    <%
        Object[] objects = (Object[]) ele;
        Lmessage l = (Lmessage) objects[0];
    %>

        <p style="font-size: 200%" class="list-group-item-success"> <%=l.getLeaveMessage()%></p>

    <%
        }
    %>

            </div>
         </div>
        <div class="col-xs-3"></div>
    </div>
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
%>
</body>
</html>
