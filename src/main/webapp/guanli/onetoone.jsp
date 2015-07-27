<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-27
  Time: 下午9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>我是管理员</title>
</head>
<body>
<%
if (request.getSession().getAttribute("uname").equals("小白")){//当获得的session不为空时，发送欢迎语句。
%>
<s:form action="Infor_onetoone" name="onetoone">
    <s:textfield name="boy_id" />
    <s:textfield name="girl_id" />
    <s:submit />
</s:form>
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
