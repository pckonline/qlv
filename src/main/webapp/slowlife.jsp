<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="Dao.select.AboutMessage" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.popj.entity.Person" %>
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
    <title>慢生活</title>
    <link href="css/l.css" rel="stylesheet">
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
    <form action="Message_message" name="me" method="post">
        <textarea name="title" class="form-control" rows="2" placeholder="您要发表的文章标题是～～" ></textarea><br/><br/>
        <textarea name="body" class="form-control" rows="5" placeholder="您要发表的文章内容是～～" ></textarea>
        <input type="submit" Class="sub" value="yes"/>
    </form>
<br/>
<br/>
<br/>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-3">
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-success">最新日志</a>
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

                <a href="bigmessage.jsp?title=<%=person.getMessage().getTitle()%>" class="list-group-item list-group-item-success" ><%=person.getMessage().getTitle()%></a>
            <%
                }
            %>

            </div>
        </div>
        <div class="col-xs-2">

        </div>
        <div class="col-xs-7">
            <a href="/slowlifeallmessage.jsp?fenye=0" class="btn btn-primary btn-lg active" role="button">查看全部日志</a>
        </div>
    </div>
</div>
<div class="d">
    <%if (Coolie.selectCookie(request,"sex")!=null&&Coolie.selectCookie(request,"sex").equals("男")){
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
