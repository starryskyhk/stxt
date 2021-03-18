<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>个人活动</title>
    <%@include file="/WEB-INF/jsp/common2.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<style type="text/css">
    #d1 {
        width: 100px;
        height: 100px;
        border: 1px solid #F6214B;
        border-radius: 100%;
        overflow: hidden;
    }

    img {
        max-height: 100%;


</style>
</head>
<body onload="showDT()">
<%@include file="/WEB-INF/jsp/student/head.jsp" %>
<div class="site-main-container">
    <!-- Start top-post Area -->
    <section class="latest-post-area pb-120">
        <div class="container no-padding">
            <div class="row">
                <%@include file="/WEB-INF/jsp/student/left.jsp" %>
                <div class="col-lg-9 post-list">
                    <!-- Start latest-post Area -->
                    <div class="latest-post-wrap">
                        <h4 class="cat-title">我的活动</h4>

                        <div class="single-latest-post row align-items-center">
                            <div class="col-lg-5 post-left">
                                <div class="feature-img relative">
                                    <div class="overlay overlay-bg"></div>
                                    <img class="img-fluid" src="/img/l1.jpg" alt="">
                                </div>
                                <ul class="tags">
                                    <li><a href="/front/hdad">点击详情</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-7 post-right">
                                <a href="/front/hdad">
                                    <h4>第二届网络征文暨摄影大赛</h4>
                                </a>
                                <ul class="meta">
                                    <li><a href="#"><span class="lnr lnr-user"></span>文艺活动</a></li>
                                    <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                    <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                </ul>
                                <p class="excert">
                                    时隔一年，第二届网络征文暨摄影大赛开启，新一轮文人墨客的汇聚，新一代才子的逐角，风云再起，谁谱春秋！
                                </p>
                            </div>
                        </div>
                        <div class="single-latest-post row align-items-center">
                            <div class="col-lg-5 post-left">
                                <div class="feature-img relative">
                                    <div class="overlay overlay-bg"></div>
                                    <img class="img-fluid" src="/img/l4.jpg" alt="">
                                </div>
                                <ul class="tags">
                                    <li><a href="/front/hdad">点击详情</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-7 post-right">
                                <a href="/front/hdad">
                                    <h4>悦享经典，阅读打卡</h4>
                                </a>
                                <ul class="meta">
                                    <li><a href="#"><span class="lnr lnr-user"></span>日常实践</a></li>
                                    <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                    <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                </ul>
                                <p>
                                    阅读是大学文化建设和个人心理建设的重要方式，阅读经典可以使人优化知识结构、培养科学思维、拓宽学术视野、滋养精神世界。此模块欢迎各位同学将每日所读所感打卡分享。
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- End latest-post Area -->

                    <!-- End banner-ads Area -->
                    <!-- Start popular-post Area -->

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
