<%@ page import="Dao.cookie.Coolie" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-25
  Time: 下午4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
</head>

<body>
<%
    if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。
%>
<%
    Coolie coolie = new Coolie();
    coolie.deleteCookie(response,"username");
    coolie.deleteCookie(response,"information");
    coolie.deleteCookie(response,"profess");
    coolie.deleteCookie(response,"hobby");
    coolie.deleteCookie(response,"zhanghao");
    request.getSession().setAttribute("uname", null);
%>
<script type="text/javascript">
    window.location.href="index.jsp"
</script>
<%
}
else
{
%>
<%
    request.getRequestDispatcher("login.jsp").forward(request,response);//当为空时，返回登录界面。
%>
<%
    }
%>
</body>
</html>
