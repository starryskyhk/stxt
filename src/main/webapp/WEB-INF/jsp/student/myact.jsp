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
                <div class="col-lg-3">
                    <div class="sidebars-area">
                        <div class="single-sidebar-widget editors-pick-widget">
                            <div class="editors-pick-post">
                                <div class="feature-img-wrap relative">
                                    <div class="feature-img relative" style="padding-left: 27%;">
                                        <img id="d1" src="/img/about/user1.png" alt="">
                                    </div>
                                </div>
                                <div class="details">
                                    <a href="#">
                                    </a>
                                    <ul class="meta">
                                        <li><a href="#"><span class="lnr lnr-user"></span>用户名：yhm</a></li>
                                        <li><a href="#"><span class="lnr "></span>ID：21313</a></li>

                                    </ul>
                                    <p class="excert">
                                        个人简介：还什么都没有写哦~
                                    </p>
                                </div>

                                <div class="post-lists">
                                    <div class="single-post d-flex flex-row">
                                        <div class="detail" style="padding-left:34%;">
                                            <a href="#"><h6>基本资料</h6></a>
                                        </div>
                                    </div>

                                    <div class="single-post d-flex flex-row">
                                        <div class="detail" style="padding-left:34%;">
                                            <a href="#"><h6>我的社团</h6></a>
                                        </div>
                                    </div>

                                    <div class="single-post d-flex flex-row">
                                        <div class="detail" style="padding-left:34%;">
                                            <a href="#"><h6>我的活动</h6></a>
                                        </div>
                                    </div>

                                    <div class="single-post d-flex flex-row">
                                        <div class="detail" style="padding-left:34%;">
                                            <a href="#"><h6>退出登录</h6></a>
                                        </div>
                                    </div>


                                </div>
                            </div>
                        </div>

                    </div>
                </div>
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
                                    <li><a href="adetails.html">点击详情</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-7 post-right">
                                <a href="image-post.html">
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
                                    <img class="img-fluid" src="/img/l2.jpg" alt="">
                                </div>
                                <ul class="tags">
                                    <li><a href="adetails.html">点击详情</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-7 post-right">
                                <a href="image-post.html">
                                    <h4>学生诚信教育主题活动</h4>
                                </a>
                                <ul class="meta">
                                    <li><a href="#"><span class="lnr lnr-user"></span>知识竞赛</a></li>
                                    <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                    <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                </ul>
                                <p>
                                    现如今各个高校努力将诚信教育融入人才培养的各个方面，通过开展诚信教育、预防诈骗教育，远离不良贷、套路贷警示教育等，在学生中普及征信知识、金融知识、防诈骗知识，引导广大学生珍爱信用、理性消费，提高学生诚信意识、风险意识、法律意识和责任意识，帮助学生树立正确的人生观、价值观、消费观。
                                </p>
                            </div>
                        </div>
                        <div class="single-latest-post row align-items-center">
                            <div class="col-lg-5 post-left">
                                <div class="feature-img relative">
                                    <div class="overlay overlay-bg"></div>
                                    <img class="img-fluid" src="/img/l3.jpg" alt="">
                                </div>
                                <ul class="tags">
                                    <li><a href="adetails.html">点击详情</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-7 post-right">
                                <a href="image-post.html">
                                    <h4>历史文化推送征文</h4>
                                </a>
                                <ul class="meta">
                                    <li><a href="#"><span class="lnr lnr-user"></span>文艺活动</a></li>
                                    <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                    <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                </ul>
                                <p>
                                    认真完成关于历史文化的文章内容，要确保有一定的历史文化，可以让读者增加对历史的兴趣，试读者对历史有着更加深入的了解。为了增强大学生对历史文化的了解，增强对历史的热爱之心。
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
                                    <li><a href="#">点击详情</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-7 post-right">
                                <a href="image-post.html">
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
