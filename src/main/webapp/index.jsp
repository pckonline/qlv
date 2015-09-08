<%@ page import="java.net.URLDecoder" %>
<%@ page import="Dao.cookie.Coolie" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-20
  Time: 下午7:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>情旅会</title>
    <meta name="keywords" content="情旅会,爱情旅,聚会更方便,love,tourism,party" />
    <meta name="description" content=""/>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/l.css">
    <link rel="stylesheet" type="text/css" href="css/test.css">
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="js/myJs.js">
        </script>
    <script type="text/javascript" src="js/bootstrap.min.js">
    </script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<%
    if (request.getSession().getAttribute("count")!=null&&request.getSession().getAttribute("count").equals("one")){
%>
<script type="text/javascript">
    setTimeout(function(){    window.location.href="/index.jsp";}, 1000);
</script>
<%
    request.getSession().setAttribute("count","two");
%>
<%
    }
%>
    <img src="images/03.jpg" style="width: 100%;height: 100%;border: 0">
<div class="dz">
    <div class="z">
        <a class="dz">注册</a>
    </div>
    <%--点击登录时弹出登录页面  通过使用hide 和show的jquery脚本实现--%>
    <div class="d">
        <a class="dz">登录</a>
    </div>
</div>
<div class="zhuxiao">
    <a class="zhuxiao" href="deleteCookie.jsp">注销</a>
</div>

<div>
    <div class="menu">
        <ul>

            <div>
                <li><a href="index.jsp"><img src="/images/log.gif" alt="爱情旅游聚会" style="height: 70px" /></a></li>
                <%if (Coolie.selectCookie(request,"sex")!=null&&Coolie.selectCookie(request,"sex").equals("男")){
            %>
                <li><a class="change1" href="boy.jsp">情</a></li><%}else{
                %>
                <li><a class="change1" href="girl.jsp">情</a></li>
                <% } %>
                <li><a class="change2">旅</a></li>
                <li><a class="change3">会</a></li>
            </div>
        </ul>
    </div>
</div>

<div class="bordr2">
    <%--登录界面--%>
    <div class="log">
        <form name="log" class="form-horizontal" action="Login_login" method="post">
            <s:actionmessage/><br/>
            <input type="text" class="form-control" id="input1" name="username" placeholder="用户名" /><br/>
            <input type="text" class="form-control" name="password" placeholder="密码" /><br/>
            <input type="text" class="form-control" id="input2"   name="verfi" placeholder="验证码"/><br/>
            <input type="checkbox" name="knowme">记住我
            <input type="submit" class="sub" value="Login"/>
        </form>
        <div class="vali">
            <img style="width:130px;height: 50px" src="Login_img" id="img">
            <a href="javascript:_change()" class="btn btn-default btn-lg active" role="button">change</a>
        </div>
    </div>
    <div class="welcome">welcome__づ￣ 3￣)づ</div>
</div>

<%--注册界面--%>
<div class="bordr3">
    <div>
        <form class="form-horizontal" name="log" action="Regi_regi" method="post">
            <%--<div class="title1">--%>
                <%--<p style="margin: 0">提示：用户名和密码只能为</p>--%>
                <%--<p style="margin: 0">6-12位的数字和字母，</p>--%>
                <%--<p style="margin: 0">无提示处填写密码。</p>--%>
            <%--</div>--%>
            <input type="text" class="form-control" id="input3" name="username" placeholder="用户名" /><br/>
            <input type="password" class="form-control" id="input4"  name="password" placeholder="密码"  /><br/>
            <input type="password" class="form-control" id="input5" name="passwordtoo" placeholder="再次输入"  /><br/>
            <input type="text" class="form-control" id="input6" name="uname" placeholder="昵称" /><br/>
            <input type="text" class="form-control" id="input7" name="information" placeholder="关于我" /><br/>
            <input type="text" class="form-control" id="input8" name="profess" placeholder="职业" /><br/>
            <input type="text" class="form-control" id="input9" name="hobby" placeholder="爱好" /><br/>
            <input type="radio" name="sex" value="男" />男
            <input type="radio" name="sex" value="女" />女
            <input type="text" class="form-control" id="input10"   name="verfi" placeholder="验证码"/>
            <input type="submit" class="sub" value="Regist"/>
        </form>
        <div class="vali">
            <img style="width:130px;height: 50px" src="Regi_img" id="img1">
            <a href="javascript:_change1()" class="btn btn-default btn-lg active" role="button">change</a>
        </div>
    </div>
</div>
<%
    Cookie[] cookies = request.getCookies();
    if (cookies!=null){
%>
<%
    for (Cookie co :cookies){
        if (co.getName().equals("username")){
%>
<%
    String str = URLDecoder.decode(co.getValue(), "utf-8");
    request.getSession().setAttribute("uname",str);
%>
<div style="color: #f9f900;font-size: 150%;position: absolute;left: 0;top: 0;">欢迎您：<%=request.getSession().getAttribute("uname")%></div>
<%
        }
    }
%>
<%} %>

<%--登录出错的提醒--%>
<%
    if (request.getSession().getAttribute("cuowu")!=null){
%>
<%=request.getSession().getAttribute("cuowu")%>
<%--<script type="text/javascript">cuowu("请输入完整的信息！")</script>--%>
<%
    request.getSession().setAttribute("cuowu",null);
%>
<%
    }
%>

</body>
</html>