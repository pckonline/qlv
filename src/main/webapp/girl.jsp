<%@ page import="Dao.cookie.Coolie" %>
<%@ page import="Dao.select.Dandz" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="gb2312">
    <title>夏の花世界-情侣博客模板</title>
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
    <h1><a href="index.jsp">夏の花世界</a></h1>
    <p>冥冥中一种花香扑鼻,令人陶醉于心的静谧,不禁回忆,我们相遇的那一季正是盛夏之花烂漫时...</p>
</header>
<%
    if (request.getSession().getAttribute("count")!=null&&request.getSession().getAttribute("count").equals("one")){
        %>
<script type="text/javascript">
    setTimeout(function(){    window.location.reload();}, 100);
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
        <li><a href="index.jsp">首页</a></li>
        <li><a href="aboutme.jsp">关于我</a></li>
        <li><a href="#">慢生活</a></li>
        <li><a href="#">留言板</a></li>
    </ul>
</div>
<!--nav end-->
<div class="blank"></div>
<div class="banner">
    <ul class="boy_girl">
        <li class="boyimg"><a href="/aboutanother.jsp"><span>关于他</span></a></li>
        <li class="girlimg"><a href="aboutme.jsp"><span>关于我</span></a></li>
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
                <img src="images/girl.jpg">
                <p>网名：<%=Coolie.selectCookie(request, "username")%></p>
                <p>职业：<%=Coolie.selectCookie(request,"profess")%></p>
                <p>爱好：<%=Coolie.selectCookie(request,"hobby")%></p>
            </ul>
        </div>
        <div class="about_he">
            <h2>关于他</h2>
            <ul>
                <a href="girl.jsp"><img src="images/boy.jpg"></a>
                <p>网名：<%=Coolie.selectCookie(request,"anotherUname")%></p>
                <p>职业：<%=Coolie.selectCookie(request,"anotherProfess")%></p>
                <p>爱好：<%=Coolie.selectCookie(request,"anotherHobby")%></p>
            </ul>
        </div>
        <div class="newslist">
            <h2>最新日志</h2>
            <ul>
                <li><a href="/">女孩都有浪漫的小情怀</a></li>
                <li><a href="/">也许下个路口就会遇见希望</a></li>
                <li><a href="/"> 6月毕业季，祝福送给你</a></li>
                <li><a href="/"> 生活常有缺席的-可搞笑从来不缺席</a></li>
                <li><a href="/"> 为了一个不存在的梦，执念了那么多年</a></li>
                <li><a href="/"> 妹妹，明天你就要嫁人啦</a></li>
                <li><a href="/"> 女孩都有浪漫的小情怀</a></li>
                <li><a href="/"> 也许下个路口就会遇见希望</a></li>
                <li><a href="/"> 6月毕业季，祝福送给你</a></li>
            </ul>
        </div>
        <div class="viny">
            <ul>
                <dl>
                    <dt class="art"><img src="images/artwork.png" alt="专辑"></dt>
                    <dd class="icon-song"><span></span>南方姑娘</dd>
                    <dd class="icon-artist"><span></span>歌手：赵雷</dd>
                    <dd class="icon-album"><span></span>专辑：《赵小雷》</dd>
                    <dd class="music">
                        <audio src="images/nf.mp3" controls></audio>
                    </dd>
                    <!--也可以添加loop属性 音频加载到末尾时，会重新播放-->
                </dl>
            </ul>
        </div>
    </div>
    <!--l_box end -->
    <div class="r_box">
        <li> <a href="/"><img src="images/01.jpg"></a>
            <h3><a href="/">你是什么人便会遇上什么人</a></h3>
            <p>有时就为了一句狠话，像心头一口毒钉，永远麻痺着亲密感情交流。恶言，真要慎出，平日多誠心爱语，乃最简易之佈施。</p>
        </li>
        <li> <a href="/"><img src="images/02.jpg"></a>
            <h3><a href="/">爱情没有永远，地老天荒也走不完</a></h3>
            <p>也许，爱情没有永远，地老天荒也走不完，生命终结的末端，苦短情长。站在岁月的边端，那些美丽的定格，心伤的绝恋，都被四季的掩埋，一去不返。徒剩下这荒芜的花好月圆，一路相随，流离天涯背负了谁的思念？</p>
        </li>
        <li> <a href="/"><img src="images/03.jpg"></a>
            <h3><a href="/">女孩都有浪漫的小情怀——浪漫的求婚词</a></h3>
            <p>还在为浪漫的求婚词而烦恼不知道该怎么说吗？女孩子都有着浪漫的小情怀，对于求婚更是抱着满满的浪漫期待，也希望在求婚那一天对方可以给自己一个最浪漫的求婚词。</p>
        </li>
        <li> <a href="/"><img src="images/04.jpg"></a>
            <h3><a href="/">擦肩而过</a></h3>
            <p>《擦肩而过》文/清河鱼 编绘/天朝羽打开一扇窗，我不曾把你想得平常。看季节一一过往。你停留的那个地方，是否依然花儿开放？在夜里守靠着梦中的，想那仿佛前世铭刻进心肠的</p>
        </li>
        <li> <a href="/"><img src="images/01.jpg"></a>
            <h3><a href="/">擦肩而过</a></h3>
            <p>《擦肩而过》文/清河鱼 编绘/天朝羽打开一扇窗，我不曾把你想得平常。看季节一一过往。你停留的那个地方，是否依然花儿开放？在夜里守靠着梦中的，想那仿佛前世铭刻进心肠的</p>
        </li>
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
