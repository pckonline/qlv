<%@ page import="Dao.cookie.Coolie" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-26
  Time: 上午10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>天真岁月不忍欺，青春荒唐我不负你。</title>
    <meta name="Keywords" content="这里你有你和他（她）" >
    <meta name="Description" content="" >

    <link rel="stylesheet" type="text/css" href="css/l.css">
    <link rel="stylesheet" type="text/css" href="css/test.css">
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
<header>
    <ul class="nav nav-pills">
        <li><a href="/index.jsp"><h3>首页</h3></a></li>
        <li><a href="aboutme.jsp"><h3>关于我</h3></a></li>
        <li><a href="slowlife.jsp"><h3>慢生活</h3></a></li>
        <li><a href="messageboard.jsp"><h3>写给她</h3></a></li>
        <li><a href="seelmessage.jsp"><h3>留言板</h3></a></li>
        <li><iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2&num=2" width="330" height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></li>
    </ul>
</header>
<br/>
<br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-2"></div>
        <div class="col-xs-8">
            <i>
                <p class="text-info" style="font-size: 200%">
            花开的太晚，相遇太晚，却偏偏还是交错。栀子花下的年华太过美好，那幼稚的思绪却那么执着，悄悄的犯下不能修改的错误。月下憔悴的红颜，依旧等待月盈时，君的归期。
                </p>
            </i>
        </div>
        <div class="col-xs-2"></div>
    </div>
    <br/>
    <br/>
    <div class="row">
        <div class="col-xs-1"></div>
        <div class="col-xs-2 "><a href="aboutanother.jsp"><img src="images/04.jpg" alt="关于她" /></a></div>
        <div class="col-xs-3"><ul>

            <p>网名：<%=Coolie.selectCookie(request,"anotherUname")%></p>
            <p>职业：<%=Coolie.selectCookie(request,"anotherProfess")%></p>
            <p>爱好：<%=Coolie.selectCookie(request,"anotherHobby")%></p>
        </ul></div>
        <div class="col-xs-2"><a href="aboutme.jsp"><img src="images/05.jpg" alt="关于我"/></a></div>
        <div class="col-xs-4"><ul>
            <p>网名：<%=Coolie.selectCookie(request,"username")%></p>
            <p>职业：<%=Coolie.selectCookie(request,"profess")%></p>
            <p>爱好：<%=Coolie.selectCookie(request,"hobby")%></p>
        </ul></div>
    </div>
    <br/>
    <br/>
    <div class="row">
        <div class="col-xs-1"></div>
        <div class="col-xs-1"><div class="jundu"></div></div>
        <div class="col-xs-3"><h3 style="color: #ffffff">相遇:<%=Coolie.selectCookie(request,"meet_day")%></h3></div>
        <div class="col-xs-3"><h3 style="color: #ffffff">相知:<%=Coolie.selectCookie(request,"know_day")%></h3></div>
        <div class="col-xs-4"><h3 style="color: #ffffff" >相爱:<%=Coolie.selectCookie(request,"love_day")%></h3></div>
    </div>
    <div class="row">

    </div>
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
