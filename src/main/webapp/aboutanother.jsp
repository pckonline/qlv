<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="Dao.select.Dandz" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-27
  Time: 下午8:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>另一半</title>
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
<%--<%--%>
<%--if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。--%>
<%--%>--%>
<br/>
<br/>
<br/>
<br/>
<br/>
<div class="container-fluid">
    <%
        ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
        Dandz sq = ctx.getBean("dandz",Dandz.class);
        String infor=sq.informationAnother(request, Coolie.selectCookie(request, "zhanghao"));
        String nokong=infor.replaceAll(" ","");
        String[] strs =nokong.split("，");
        for (int i = 0;i<strs.length;i++){
    %>
    <div class="row">
        <div class="col-xs-12" style="text-align: center">
            <p style="color: #9999cc;font-size: 200%"><%=strs[i]%></p>
        </div>
    </div>
    <%
        }
    %>
</div>

<div class="d">
    <%if (Coolie.selectCookie(request,"sex")!=null&&Coolie.selectCookie(request,"sex").equals("男")){
    %>
    <a class="btn btn-primary btn-lg" href="boy.jsp" role="button">返回</a><%}else{
%>
    <a class="btn btn-primary btn-lg" href="girl.jsp" role="button">返回</a>
    <% } %>
</div>

<%--<%--%>
<%--}--%>
<%--else--%>
<%--{--%>
<%--%>--%>
<%--<%--%>
<%--request.getRequestDispatcher("/login.jsp").forward(request,response);//当为空时，返回登录界面。--%>
<%--%>--%>
<%--<%--%>
<%--}--%>
<%--%>--%>
</body>
</html>
