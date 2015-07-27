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
    <link href="css/index.css" rel="stylesheet">
    <link href="css/l.css" rel="stylesheet">
    <script src="js/modernizr.js"></script>
</head>
<body>
<div class="information1">
    <s:form action="Infor_me" name="me">
        <s:textarea name="infor" cssClass="information" label="自我描述吧～以中文逗号为分割，且只能显示六项" labelposition="top"/>
        <s:submit cssClass="sub" value="yes"/>
    </s:form>
</div>




<div class="information1">
    <ul class="texts">
        <%
            String infor=Coolie.selectCookie(request,"information");
            String nokong=infor.replaceAll(" ","");
            String[] strs =nokong.split("，");
            for (int i = 0;i<strs.length;i++){
                %>
        <p><%=strs[i]%></p>
        <%
            }
        %>
    </ul>
</div>

</body>
</html>
