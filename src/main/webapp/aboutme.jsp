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
    <link href="css/index.css" rel="stylesheet">
    <link href="css/l.css" rel="stylesheet">
    <script src="js/modernizr.js"></script>
</head>
<body>
<%
    if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。
%>
<div class="information1">
    <s:form action="Infor_me" name="me">
        <s:textarea name="infor" cssClass="information" label="自我描述吧～以中文逗号为分割" labelposition="top"/>
        <s:submit cssClass="sub" value="yes"/>
    </s:form>
</div>

<div class="information1">
    <ul class="texts">
        <%
            ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
            Dandz sq = ctx.getBean("dandz",Dandz.class);
            String infor=sq.information(Coolie.selectCookie(request,"zhanghao"));
            String nokong=infor.replaceAll(" ", "");
            String[] strs =nokong.split("，");
            for (int i = 0;i<strs.length;i++){
                %>
        <p style="color: #9999cc"><%=strs[i]%></p>
        <%
            }
        %>
    </ul>
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
