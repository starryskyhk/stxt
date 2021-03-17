<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>新闻动态</title>
    <%@include file="/WEB-INF/jsp/common2.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


</head>
<body onload="showDT()">
<%@include file="/WEB-INF/jsp/student/head.jsp" %>

<div class="site-main-container">
    <!-- Start top-post Area -->

    <section class="latest-post-area pb-10">
        <div class="container no-padding">
            <div class="row">
                <div class="col-lg-8 post-list " style="margin-left: 15%;">
                    <!-- Start latest-post Area -->
                    <div class="latest-post-wrap">

                        <!-- End latest-post Area -->

                        <!-- End banner-ads Area -->
                        <!-- End popular-post Area -->
                        <!-- Start relavent-story-post Area -->
                        <div class="relavent-story-post-wrap ">
                            <h4 class="title">新闻动态</h4>
                            <div class="relavent-story-list-wrap">
                                <div class="single-relavent-post row align-items-center">
                                    <div class="col-lg-5 post-left">
                                        <div class="feature-img relative">
                                            <div class="overlay overlay-bg"></div>
                                            <img class="img-fluid" src="/img/r1.jpg" alt="">
                                        </div>
                                        <ul class="tags">
                                            <li><a href="/front/xwad">点击详情</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-7 post-right">
                                        <a href="/front/xwad">
                                            <h4> 渭南师范学院第四次学生代表大会胜利召开</h4>
                                        </a>
                                        <ul class="meta">
                                            <li><a href="#"><span class="lnr lnr-user"></span>马克思主义青年社团</a></li>
                                            <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-4</a></li>
                                            <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                        </ul>
                                        <p class="excert">
                                            服务成长勇担当 砥砺改革写新篇
                                        </p>
                                    </div>
                                </div>
                                <div class="single-relavent-post row align-items-center">
                                    <div class="col-lg-5 post-left">
                                        <div class="feature-img relative">
                                            <div class="overlay overlay-bg"></div>
                                            <img class="img-fluid" src="/img/r2.jpg" alt="">
                                        </div>
                                        <ul class="tags">
                                            <li><a href="/front/xwad">点击详情</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-7 post-right">
                                        <a href="/front/xwad">
                                            <h4>世界等着你去发现</h4>
                                        </a>
                                        <ul class="meta">
                                            <li><a href="#"><span class="lnr lnr-user"></span>摄影社</a></li>
                                            <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                            <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                        </ul>
                                        <p class="excert">
                                            当细细品味每一处美景，你会发觉更多世界的美好等着你去发现！
                                        </p>
                                    </div>
                                </div>
                                <div class="single-relavent-post row align-items-center">
                                    <div class="col-lg-5 post-left">
                                        <div class="feature-img relative">
                                            <div class="overlay overlay-bg"></div>
                                            <img class="img-fluid" src="/img/r3.jpg" alt="">
                                        </div>
                                        <ul class="tags">
                                            <li><a href="/front/xwad">点击详情</a></li>
                                        </ul>
                                    </div>
                                    <div class="col-lg-7 post-right">
                                        <a href="/front/xwad">
                                            <h4>科普！制作视频简历有多难</h4>
                                        </a>
                                        <ul class="meta">
                                            <li><a href="#"><span class="lnr lnr-user"></span>计算机协会</a></li>
                                            <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                            <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                        </ul>
                                        <p class="excert">
                                            作为文字简历/电子简历的一种有益补充，视频简历凭借着客观的影音效果以及丰富的信息量，快速拉近了求职者和应聘单位的距离，使应聘单位能够在较短时间内了解求职者。
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Start popular-post Area -->

                        <!-- End relavent-story-post Area -->
                    </div>

                </div>
            </div>
        </div>
</div>
</section>
</div>

<script>
    var days = ["日", "一", "二", "三", "四", "五", "六"];

    function showDT() {
        var currentDT = new Date();
        var y, m, date, day, hs, ms, ss, theDateStr;
        y = currentDT.getFullYear(); //四位整数表示的年份
        m = currentDT.getMonth() + 1; //月
        date = currentDT.getDate(); //日
        day = currentDT.getDay(); //星期
        theDateStr = y + "年" + m + "月" + date + "日 星期" + days[day];
        document.getElementById("theClock").innerHTML = theDateStr;
        // setTimeout 在执行时,是在载入后延迟指定时间后,去执行一次表达式,仅执行一次
        window.setTimeout(showDT, 1000);
    }

</script>
</body>
</html>
