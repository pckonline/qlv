<%@ page import="Dao.cookie.Coolie" %>
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
</head>
<body>
<%--<%--%>
<%--if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。--%>
<%--%>--%>

<div class="information1">

</div>
<div class="information1">
    <ul class="texts">
        <%
            String infor= Coolie.selectCookie(request, "informationanother");
            String nokong=infor.replaceAll(" ","");
            String[] strs =nokong.split("，");
            for (int i = 0;i<strs.length;i++){
        %>
        <p style="color: #9999cc"><%=strs[i]%></p>
        <%
            }
        %>
    </ul>
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
