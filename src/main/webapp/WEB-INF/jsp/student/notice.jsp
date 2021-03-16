<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>通知公告</title>
    <%@include file="/WEB-INF/jsp/common.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


</head>
<body onload="showDT()">
<header>


    <div class="logo-wrap">
        <div class="container">
            <div style="width: 120%;" class="row justify-content-between align-items-center">

                <div class="col-lg-10 col-md-8 col-sm-12 logo-right ads-banner" style="padding-top: 7px;">
                    <ul class="nav-menu">
                        <li style="color: #838383;" id="theClock"></li>
                        <li style="color: #838383;">欢迎来到渭南师范学院社团管理平台！</li>
                        <li style="color: #838383;">
                            <input style="padding-left: 5px;" type="text" class="form-control "
                                   name="Search-box" id="Search-box" placeholder="社团搜索">

                        </li>
                        <li style="margin-left:10px ;">
                            <svg t="1611654842641" class="icon" viewBox=" 0 0 1024 1024" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" p-id="1093" width="19" height="19"
                                 style="margin-top:4; cursor: pointer;">
                                <path d="M1011.975 960.664 785.583 759.823c28.026-35.029 50.8-73.962 67.876-116.211 22.961-56.813 34.604-117.132 34.604-179.274 0-62.144-11.644-122.459-34.604-179.273-22.211-54.957-54.027-104.332-94.561-146.751-40.643-42.532-88.014-75.944-140.797-99.307C563.323 14.759 505.137 2.464 445.16 2.464c-59.979 0-118.166 12.294-172.944 36.542-52.783 23.363-100.154 56.775-140.797 99.307-40.536 42.421-72.35 91.794-94.563 146.751C13.894 341.877 2.251 402.194 2.251 464.338c0 62.143 11.643 122.461 34.605 179.274 22.211 54.954 54.027 104.329 94.563 146.749 40.643 42.532 88.014 75.944 140.797 99.307 54.779 24.246 112.965 36.541 172.944 36.541 59.977 0 118.164-12.295 172.941-36.541 43.84-19.405 83.932-45.765 119.552-78.504l227.722 202.025c6.686 5.929 15.002 8.846 23.287 8.846 9.691 0 19.336-3.991 26.275-11.811C1027.809 995.72 1026.48 973.532 1011.975 960.664zM445.161 855.992c-205.503 0-372.693-175.696-372.693-391.654 0-215.961 167.189-391.658 372.693-391.658 205.501 0 372.688 175.697 372.688 391.658C817.849 680.298 650.661 855.992 445.161 855.992z"
                                      p-id="1094" fill="#ffffff"></path>
                            </svg>

                        </li>
                        <li style="color: #838383; margin-left:10px ;">
                            <input style="padding-left: 5px;" type="text" class="form-control "
                                   name="Search-box" id="Search-box" placeholder="活动搜索">

                        </li>
                        <li style="margin-left:10px ;">
                            <svg t="1611654842641" class="icon" viewBox=" 0 0 1024 1024" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg" p-id="1093" width="19" height="19"
                                 style="margin-top:4; cursor: pointer;">
                                <path d="M1011.975 960.664 785.583 759.823c28.026-35.029 50.8-73.962 67.876-116.211 22.961-56.813 34.604-117.132 34.604-179.274 0-62.144-11.644-122.459-34.604-179.273-22.211-54.957-54.027-104.332-94.561-146.751-40.643-42.532-88.014-75.944-140.797-99.307C563.323 14.759 505.137 2.464 445.16 2.464c-59.979 0-118.166 12.294-172.944 36.542-52.783 23.363-100.154 56.775-140.797 99.307-40.536 42.421-72.35 91.794-94.563 146.751C13.894 341.877 2.251 402.194 2.251 464.338c0 62.143 11.643 122.461 34.605 179.274 22.211 54.954 54.027 104.329 94.563 146.749 40.643 42.532 88.014 75.944 140.797 99.307 54.779 24.246 112.965 36.541 172.944 36.541 59.977 0 118.164-12.295 172.941-36.541 43.84-19.405 83.932-45.765 119.552-78.504l227.722 202.025c6.686 5.929 15.002 8.846 23.287 8.846 9.691 0 19.336-3.991 26.275-11.811C1027.809 995.72 1026.48 973.532 1011.975 960.664zM445.161 855.992c-205.503 0-372.693-175.696-372.693-391.654 0-215.961 167.189-391.658 372.693-391.658 205.501 0 372.688 175.697 372.688 391.658C817.849 680.298 650.661 855.992 445.161 855.992z"
                                      p-id="1094" fill="#ffffff"></path>
                            </svg>

                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <div class="container main-menu" id="main-menu">
            <div class="row align-items-center justify-content-between">
                <nav id="nav-menu-container">
                    <ul class="nav-menu">


                        <li><a href="index1.html"></a>
                            <img src="/img/logo8.png" alt="">
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
                        <li><a href="index1.html">新闻动态</a></li>
                        <li><a href="index1.html">通知公告</a></li>
                        <li><a href="index1.html">社团创办</a></li>
                        <li><a href="login.html">登录</a></li>


                        </li>
                    </ul>
                </nav><!-- #nav-menu-container -->

            </div>
        </div>
</header>

<div class="site-main-container">
    <!-- Start top-post Area -->

    <section class="latest-post-area pb-10">
        <div class="container no-padding">
            <div class="row">
                <div class="col-lg-8 post-list " style="margin-left: 15%;">
                    <!-- Start latest-post Area -->
                    <div class="latest-post-wrap">
                        <h4 class="cat-title">公告</h4>


                        <div class="single-latest-post row align-items-center">
                            <div class="col-lg-7 post-right">
                                <a href="image-post.html">
                                    <h4>关于系统更新通知</h4>
                                </a>
                                <ul class="meta">
                                    <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                </ul>
                                <p class="excert">
                                    -优化模块，为同学们提供更多服务</br>
                                    -优化模块，为同学们提供更多服务</br>-优化模块，为同学们提供更多服务</br>-优化模块，为同学们提供更多服务</br>
                                </p>
                                <hr align="center" width="177%" style="border: 1 dashed #777777;">
                            </div>
                        </div>


                        <div class="single-latest-post row align-items-center">
                            <div class="col-lg-7 post-right">
                                <a href="image-post.html">
                                    <h4>关于系统更新通知</h4>
                                </a>
                                <ul class="meta">
                                    <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                </ul>
                                <p class="excert">
                                    -优化模块，为同学们提供更多服务</br>
                                    -优化模块，为同学们提供更多服务</br>-优化模块，为同学们提供更多服务</br>-优化模块，为同学们提供更多服务</br>
                                </p>
                                <hr align="center" width="177%" style="border: 1 dashed #777777;">
                            </div>
                        </div>

                        <div class="single-latest-post row align-items-center">
                            <div class="col-lg-7 post-right">
                                <a href="image-post.html">
                                    <h4>关于系统更新通知</h4>
                                </a>
                                <ul class="meta">
                                    <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                </ul>
                                <p class="excert">
                                    -优化模块，为同学们提供更多服务</br>
                                    -优化模块，为同学们提供更多服务</br>-优化模块，为同学们提供更多服务</br>-优化模块，为同学们提供更多服务</br>
                                </p>
                                <hr align="center" width="177%" style="border: 1 dashed #777777;">
                            </div>
                        </div>

                        <div class="single-latest-post row align-items-center">
                            <div class="col-lg-7 post-right">
                                <a href="image-post.html">
                                    <h4>关于系统更新通知</h4>
                                </a>
                                <ul class="meta">
                                    <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                </ul>
                                <p class="excert">
                                    -优化模块，为同学们提供更多服务</br>
                                    -优化模块，为同学们提供更多服务</br>-优化模块，为同学们提供更多服务</br>-优化模块，为同学们提供更多服务</br>
                                </p>
                                <hr align="center" width="177%" style="border: 1 dashed #777777;">
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
