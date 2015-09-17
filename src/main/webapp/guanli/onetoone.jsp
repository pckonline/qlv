<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="Dao.select.CompletInfor" %>
<%@ page import="java.util.List" %>
<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="Dao.popj.entity.BeforeLove" %>
<%--
  Created by IntelliJ IDEA.
  User: online
  Date: 15-7-27
  Time: 下午9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>我是管理员</title>
</head>
<body>
<%
if (request.getSession().getAttribute("uname").equals("pengchengkai")){//当获得的session不为空时，发送欢迎语句。
%>
<s:form action="Infor_onetoone" name="onetoone">
    <s:textfield name="boy_username" />用户名(男)
    <s:textfield name="girl_username" />用户名(女)
    <s:textfield name="meet_day" />相遇
    <s:textfield name="know_day" />相知
    <s:textfield name="love_day" />相爱
    <s:textfield name="me_u" />申请者
    <s:submit />
</s:form>

<br/>
<br/>
<br/>
<br/>
<br/>

<div class="container-fluid">
    <div class="row">
        <div class="col-xs-3">
            <div class="list-group">

                <%
                    ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-hibernate.xml");
                    CompletInfor sq = ctx.getBean("complete",CompletInfor.class);
                    List list =sq.yesLove(Coolie.selectCookie(request, "zhanghao"));
                    for(Object ele : list){
                %>

                <%
                    Object object = (Object) ele;
                    BeforeLove beforeLove = (BeforeLove) ele;
                %>

                <p  class="list-group-item list-group-item-success" >申请者：<%=beforeLove.getMe_u()%>+同意人：<%=beforeLove.getOther_u()%>+申请者性别：<%=beforeLove.getLoveword()%></p>

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
