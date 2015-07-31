<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="Dao.select.Dandz" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="Dao.select.AboutMessage" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.popj.entity.Person" %>
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
    <title>青涩の初夏-情侣博客模板</title>
    <meta name="Keywords" content="博客模板,情侣博客模板" >
    <meta name="Description" content="情侣博客模板" >
    <link href="css/index.css" rel="stylesheet">

    <script src="js/modernizr.js"></script>


</head>
<body>
<%
if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。
%>
<header>
    <h1><a href="">青涩の初夏</a></h1>
    <p>趁我们都还年轻,多欣赏下沿途的风景，不要错过了流年里温暖的人和物....</p>
</header>
<%
    if (request.getSession().getAttribute("count")!=null&&request.getSession().getAttribute("count").equals("one")){
%>
<script type="text/javascript">
    setTimeout(function(){    window.location.reload();}, 1000);
</script>
<%
    request.getSession().setAttribute("count","two");
%>
<%
    }
%>
<!--nav begin-->
<div id="nav">
    <ul>
        <li><a href="/index.jsp">首页</a></li>
        <li><a href="aboutme.jsp">关于我</a></li>
        <li><a href="slowlife.jsp">慢生活</a></li>
        <li><a href="#">留言板</a></li>
    </ul>
</div>
<!--nav end-->
<div class="blank"></div>
<div class="banner">
    <ul class="boy_girl">
        <li class="girlimg"><a href="/aboutanother.jsp"><span>关于她</span></a></li>
        <li class="boyimg"><a href="aboutme.jsp"><span>关于我</span></a></li>
    </ul>
    <ul class="texts">
        <p><img src="images/t-1.png" alt="人生，是一场盛大的遇见"></p>
        <p><img src="images/t-2.png" alt="若你懂得，就请珍惜。"></p>
        <p><img src="images/t-3.png" alt="无论下多久的雨，最后都会有彩虹；无论你多么悲伤，要相信幸福在前方等候"></p>
    </ul>
</div>
<div class="blank"></div>
<div class="memorial_day">
    <div class="time_axis"></div>
    <ul>
        <li class="n1"><a href="/">相遇</a>
            <div class="dateview"><%=Coolie.selectCookie(request,"meet_day")%></div>
        </li>
        <li class="n3"><a href="/">相知</a>
            <div class="dateview"><%=Coolie.selectCookie(request,"know_day")%></div>
        </li>
        <li class="n5"><a href="/">相爱</a>
            <div class="dateview"><%=Coolie.selectCookie(request,"love_day")%></div>
        </li>
    </ul>
</div>
<div class="blank"></div>
<article>
    <div class="l_box">
        <div class="about_me">
            <h2>关于我</h2>
            <ul>
                <img src="images/boy.jpg">
                <p>网名：<%=Coolie.selectCookie(request,"username")%></p>
                <p>职业：<%=Coolie.selectCookie(request,"profess")%></p>
                <p>爱好：<%=Coolie.selectCookie(request,"hobby")%></p>
            </ul>
        </div>
        <div class="about_he">
            <h2>关于她</h2>
            <ul>
            <a href="boy.jsp"><img src="images/girl.jpg"></a>
            <p>网名：<%=Coolie.selectCookie(request,"anotherUname")%></p>
            <p>职业：<%=Coolie.selectCookie(request,"anotherProfess")%></p>
            <p>爱好：<%=Coolie.selectCookie(request,"anotherHobby")%></p>
        </ul>

        </div>
        <div class="newslist">
            <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=3" width="130" height="230" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" ></iframe>
        </div>
    </div>
    <!--l_box end -->
    <div class="r_box">
        <%
            ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
            AboutMessage sq = ctx.getBean("aboutmessage",AboutMessage.class);
            List list =sq.selfMessage(Coolie.selectCookie(request,"zhanghao"));
            for(Object ele : list){
        %>

        <%
                Object object = (Object) ele;
                Person person = (Person) ele;
        %>
        <li> <a href="bigmessage.jsp?title=<%=person.getMessage().getTitle()%>&body=<%=person.getMessage().getBody()%>"><img src="images/01.jpg"></a>
            <h3><a href="bigmessage.jsp?title=<%=person.getMessage().getTitle()%>&body=<%=person.getMessage().getBody()%>">  <%=person.getMessage().getTitle()%></a></h3>
            <p><%=person.getMessage().getBody()%></p>
            </li>
        <%

            }
        %>

    </div>
</article>
<footer>
    <p>Design by DanceSmile</p>
</footer>

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
