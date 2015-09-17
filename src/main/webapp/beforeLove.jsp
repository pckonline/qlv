<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="Dao.select.CompletInfor" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.popj.entity.BeforeLove" %>
<%@ page import="Dao.popj.entity.Person" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-9-17
  Time: 下午3:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>寻</title>
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


<br/>
<br/>
<br/>
<br/>
<form action="TellLove_tolove" name="me" method="post">
    <textarea name="other_u" class="form-control" rows="2" placeholder="ta的用户名" ></textarea><br/><br/>
    <textarea name="me_loveword" class="form-control" rows="5" placeholder="何时相遇，何时相知，何时相爱。格式如2015-01-01,2015-01-02,2015-01-03" ></textarea>
    <input type="submit" Class="sub" value="yes"/>
</form>
<br/>
<br/>
<br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-3">
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-success">ta</a>
                <%
                    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
                    CompletInfor sq = ctx.getBean("complete",CompletInfor.class);
                    List list =sq.yesBeforeLove(Coolie.selectCookie(request, "zhanghao"));
                    for(Object ele : list){
                %>

                <%
                    Object object = (Object) ele;
                    BeforeLove beforeLove = (BeforeLove) ele;
                %>

                <a href="beforeLoveyes.jsp?me_u=<%=beforeLove.getMe_u()%>" class="list-group-item list-group-item-success" ><%=beforeLove.getMe_u()%>(点击后确认其为你的ta)</a>

                <%
                    }
                %>

            </div>
        </div>
        <div class="col-xs-2">

        </div>
        <div class="col-xs-7">
        </div>
    </div>
</div>

<div class="d">
    <%if (Coolie.selectCookie(request,"sex")!=null&& Coolie.selectCookie(request, "sex").equals("男")){
    %>
    <a class="btn btn-primary btn-lg" href="boy.jsp" role="button">返回</a><%}else{
%>
    <a class="btn btn-primary btn-lg" href="girl.jsp" role="button">返回</a>
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
