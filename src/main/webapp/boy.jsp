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
    <!--[if lt IE 9]>
    <script src="js/modernizr.js"></script>
    <![endif]-->
</head>
<body>
<%--<%--%>
<%--if ((String)request.getSession().getAttribute("uname")!=null){//当获得的session不为空时，发送欢迎语句。--%>
<%--%>--%>
<header>
    <h1><a href="">青涩の初夏</a></h1>
    <p>趁我们都还年轻,多欣赏下沿途的风景，不要错过了流年里温暖的人和物....</p>
</header>
<!--nav begin-->
<div id="nav">
    <ul>
        <li><a href="/index.jsp">首页</a></li>
        <li><a href="#">关于我</a></li>
        <li><a href="#">慢生活</a></li>
        <li><a href="#">留言板</a></li>
    </ul>
</div>
<!--nav end-->
<div class="blank"></div>
<div class="banner">
    <ul class="boy_girl">
        <li class="girlimg"><a href="/l"><span>关于她</span></a></li>
        <li class="boyimg"><a href="/"><span>关于我</span></a></li>
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
            <div class="dateview">2011-06-27</div>
        </li>
        <li class="n3"><a href="/">相知</a>
            <div class="dateview">2012-10-01</div>
        </li>
        <li class="n5"><a href="/">相爱</a>
            <div class="dateview">2014-10-05</div>
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
                <p><%=request.getSession().getAttribute("uname")%></p>
                <p>职业：3DST技术网站长</p>
            </ul>
        </div>
        <div class="about_he">
            <h2>关于她</h2><ul>
            <img src="images/girl.jpg">
            <p>网名：DanceSmile | 即步非烟</p>
            <p>职业：网站设计、网站制作</p>
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
</body>
<%--<%--%>
<%--}--%>
<%--else--%>
<%--{--%>
<%--%>--%>
<%--<%--%>
<%--request.getRequestDispatcher("/login.jsp").forward(request,response);//当为空时，返回登录界面。--%>
<%--%>--%>
<%--<%--%>
<%--}--%>
<%--%>--%>
</html>
