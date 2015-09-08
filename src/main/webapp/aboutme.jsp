<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="Dao.select.Dandz" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-26
  Time: 上午10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>关于我</title>
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
        <div class="col-xs-12">
            <form action="Infor_me" name="me" method="post">
                <textarea name="infor" class="form-control" rows="5" placeholder="自我描述吧～以中文逗号为分割"></textarea>
                <input type="submit"  value="yes"/>
            </form>
        </div>

    </div>
    <br/>
    <br/>
    <br/>
    <%
    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
    Dandz sq = ctx.getBean("dandz",Dandz.class);
    String infor=sq.information(Coolie.selectCookie(request,"zhanghao"));
    String nokong=infor.replaceAll(" ", "");
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
