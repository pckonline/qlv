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
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/l.css">
    <link rel="stylesheet" type="text/css" href="css/test.css">
    <script src="js/jquery.js"></script>
    <script type="text/javascript" src="js/myJs.js">
    </script>
</head>
<body style="background-color: #caffff">
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
                <li><a href="index.jsp"><img src="images/log.gif" alt="爱情旅游聚会" /></a></li>
            </div>
            <div><%if (Coolie.selectCookie(request,"sex")!=null&&Coolie.selectCookie(request,"sex").equals("男")){
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
</div>
<div class="bordr2">
    <%--登录界面--%>
    <div class="log">
        <s:form name="log" action="Login_login">
            <s:actionmessage/><br/>
            <s:textfield cssClass="input" id="input1" onfocus="i1(this)" onblur="b(this)" name="username" value="用户名" /><br/>
            <s:password cssClass="input" name="password" /><br/>
            <s:textfield cssClass="input" id="input2" onfocus="i6(this)" onblur="b(this)"  name="verfi" value="验证码"/>
            <s:radio list="{'记住我'}" name="knowme" />
            <s:submit cssClass="sub" value="Login"/>
        </s:form>
        <div class="vali">
            <img style="width:130px;height: 50px" src="Login_img" id="img">
            <a class="change" href="javascript:_change()">change</a>
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
            <a class="change" href="javascript:_change1()">change</a>
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
<div style="color: #8080C0;font-size: 150%">欢迎您：<%=request.getSession().getAttribute("uname")%></div>
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
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>