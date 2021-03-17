<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>


    <div class="logo-wrap">
        <div class="container main-menu" id="main-menu">
            <div class="row align-items-center justify-content-between">
                <nav id="nav-menu-container">
                    <ul class="nav-menu">

                        <li style="color: #838383; padding-top: 10px" id = "theClock"></li>

                        <li ><a style="padding-bottom: 10px"  href="/front/index" >
                            <img  src="/img/logo8.png" alt=""></a>
                        </li>
                        <li class="menu-has-children "><a href="">多彩社团</a>
                            <ul>
                                <li><a href="#">思想政治类</a></li>
                                <li><a href="#">学术科技类</a></li>
                                <li><a href="#">创新创业类</a></li>
                                <li><a href="#">文化体育类</a></li>
                                <li><a href="#">志愿公益类</a></li>
                                <li><a href="#">自律互助类</a></li>
                            </ul>

                        <li class="menu-has-children "><a href="">精彩活动</a>
                            <ul>
                                <li><a href="#">思想政治类</a></li>
                                <li><a href="#">学术科技类</a></li>
                                <li><a href="#">创新创业类</a></li>
                                <li><a href="#">文化体育类</a></li>
                                <li><a href="#">志愿公益类</a></li>
                                <li><a href="#">自律互助类</a></li>
                            </ul>
                        </li>
                        <li><a href="/front/xwdt">新闻动态</a></li>
                        <li><a href="/front/notice">通知公告</a></li>
                        <li><a href="/front/createst">社团创办</a></li>
                        <c:if test="${sessionScope.user==null}">
                            <li><a href="/front/login">登录</a></li>
                        </c:if>
                        <c:if test="${sessionScope.user!=null}">
                            <li><a href="/front/myinfo/${sessionScope.user.id}">${sessionScope.user.name}</a></li>
                            <li><a href="/exit">退出</a></li>
                        </c:if>



                        </li>
                    </ul>
                </nav><!-- #nav-menu-container -->

            </div>
        </div>
    </div>

</header>
<script>
    var days = new Array("日","一","二","三","四","五","六");
    function showDT() {
        var currentDT = new Date();
        var y,m,date,day,hs,ms,ss,theDateStr;
        y = currentDT.getFullYear(); //四位整数表示的年份
        m = currentDT.getMonth()+1; //月
        date = currentDT.getDate(); //日
        day = currentDT.getDay(); //星期
        theDateStr = y+"年"+  m +"月"+date+"日 星期"+days[day];
        document.getElementById("theClock"). innerHTML =theDateStr;
        // setTimeout 在执行时,是在载入后延迟指定时间后,去执行一次表达式,仅执行一次
        window.setTimeout( showDT, 1000);
    }

</script>