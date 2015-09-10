<%@ page import="Dao.cookie.Coolie" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-9-7
  Time: 下午4:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>写留言</title>
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
            <form action="Infor_lmessage" method="post">
                <textarea name="lmessage" class="form-control" rows="3" placeholder="输入留言内容"></textarea>
                <input type="submit"  value="yes"/>
            </form>
        </div>

    </div>
    <br/>
    <br/>
    <br/>

    <div class="d">
        <%if (Coolie.selectCookie(request, "sex")!=null&&Coolie.selectCookie(request,"sex").equals("男")){
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
