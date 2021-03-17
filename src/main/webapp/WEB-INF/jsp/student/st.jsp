<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>社团</title>
    <%@include file="/WEB-INF/jsp/common2.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


</head>
<style type="text/css">
    #info {
        height: 90px;
    }
</style>
</head>
<body onload="showDT()">
<%@include file="/WEB-INF/jsp/student/head.jsp" %>

<div class="site-main-container">
    <!-- Start top-post Area -->

    <section class="top-post-area pt-10">
        <div class="container no-padding">
            <div class="row small-gutters">
                <div class="col-lg-12">
                    <div class="news-tracker-wrap">
                        <h6><span>思想政治类:</span> <a href="#">找找有哪些社团吧~</a></h6>
                    </div>
                </div>

                <div class="col-lg-4 top-post-right">
                    <div class="single-top-post">
                        <div class="feature-image-thumb relative">
                            <div class="overlay overlay-bg"></div>
                            <img class="img-fluid" src="/img/top-post2.jpg" alt="">
                        </div>
                        <div class="top-post-details">
                            <ul class="tags">
                                <li><a href="adetails.html">点击详情</a></li>
                            </ul>
                            <a href="image-post.html">
                                <h4>大学生心理健康协会</h4>
                            </a>
                            <ul class="meta" id="info">
                                <li><a href="#"><span class="lnr lnr-user"></span>校级</a></li>
                                <li><a href="#"><span class="lnr lnr-bubble"></span>简介：大学生心理健康协会是在校团委和大学生心理健康指导中心的指导下，隶属于教育科学学院，一个面向全校大学生的思想政治性质的社团组织。</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="col-lg-4 top-post-right">
                    <div class="single-top-post">
                        <div class="feature-image-thumb relative">
                            <div class="overlay overlay-bg"></div>
                            <img class="img-fluid" src="/img/top-post2.jpg" alt="">
                        </div>
                        <div class="top-post-details">
                            <ul class="tags">
                                <li><a href="adetails.html">点击详情</a></li>
                            </ul>
                            <a href="image-post.html">
                                <h4>马克思主义青年社团</h4>
                            </a>
                            <ul class="meta" id="info">
                                <li><a href="#"><span class="lnr lnr-user"></span>校级</a></li>
                                <li><a href="#"><span class="lnr lnr-bubble"></span>简介：学习马克思理论</a></li>
                            </ul>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>
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
