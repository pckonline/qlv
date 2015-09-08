<%@ page import="Dao.cookie.Coolie" %>
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
</head>
<body>
<%
    if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。
%>
<div class="information1">

</div>
<div class="information1">
    <s:form action="Message_message" name="me">
        <s:textarea name="title" cssClass="information2" label="您要发表的文章标题是～～" labelposition="top"/>
        <s:textarea name="body" cssClass="information" label="您要发表的文章内容是～～" labelposition="top"/>
        <s:submit cssClass="sub" value="yes"/>
    </s:form>
</div>

<div class="d">
    <%if (Coolie.selectCookie(request,"sex")!=null&&Coolie.selectCookie(request,"sex").equals("男")){
    %>
    <a class="dz" href="boy.jsp">返回</a><%}else{
%>
    <a class="dz" href="girl.jsp">返回</a>
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
