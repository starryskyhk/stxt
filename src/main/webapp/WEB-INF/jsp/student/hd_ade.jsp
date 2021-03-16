<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>活动详情</title>
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
    <!-- Start latest-post Area -->
    <section class="latest-post-area pb-120">
        <div class="container no-padding">
            <div class="row">
                <div class="col-lg-8 post-list">
                    <!-- Start single-post Area -->
                    <div class="single-post-wrap">
                        <div class="feature-img-thumb relative">
                            <div class="overlay overlay-bg"></div>
                            <img class="img-fluid" src="/img/f1.jpg" alt="">
                        </div>
                        <div class="content-wrap">
                            <a href="#">
                                <h3>全国大学生网络营销知识竞赛</h3>
                            </a>
                            <ul class="meta pb-20">
                                <li><a href="#"><span class="lnr lnr-user"></span>思想政治</a></li>
                                <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-4</a></li>
                                <li><a href="#"><span class="lnr lnr-bubble"></span>3 评论</a></li>
                            </ul>
                            <p>
                                在2020年政府工作报告中指出，我国将深入推进大众创业万众创新，要继续出台支持政策，全面推进“互联网+”，打造数字经济新优势，扶持电商网购、在线服务等行业的发展，
                                其中，网络营销则是新时代尤其重要的宣传，企业以现代营销理论为基础，通过互联网工具开展营销活动，实现营销目标。助力企业发展
                                为增强大学生对网络营销的认识，提升就业能力，知了竞赛、乐卡及全国干所高校学生会、社团等组织共同发起“全国大学 生网络营销知识竞赛”
                                网络营销大赛旨在培养学生网络营销技巧，参与企业网络营销，带动学生网络创业，促进大学生营销推广能力的提高，提升现代大学生就业竞争力，促进大学生互联网营销知识的交流，为大学生搭建一个深入了解互联网营销的平台。
                                </br>活动步骤：</br>
                                1.本次答题平台“最美志愿行”公众号。</br>
                                2.点击营销竞赛开始比赛， 按照推文要求进行比赛。</br>
                                3.电子证书领取方式公众号后台回复“领取证书5"</br>
                                4.此活动需要上传答题截图，公共号恬态回复“成绩上传”</br>
                            </p>
                            <blockquote>
                                主办方：莫斯科艺术学院</br>
                                级别：院系级</br>
                                负责人：刘海夏</br>
                                组织者：今度</br>
                                活动地点：学生家中</br>
                                报名时间：2020-6.22 10:00--6.30 18:00</br>
                                活动时间：2020-7.1 10:00--7.10 18:00</br>

                            </blockquote>

                            <div class="navigation-wrap justify-content-between d-flex">
                                <a class="next" href="#" style="margin-left: 80%; ">我要报名<span
                                        class="lnr lnr-heart"></span></a>
                            </div>

                            <div class="comment-sec-area">
                                <div class="container">
                                    <div class="row flex-column">
                                        <h6>评论区</h6>
                                        <div class="comment-list">
                                            <div class="single-comment justify-content-between d-flex">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="/img/blog/c1.jpg" alt="">
                                                    </div>
                                                    <div class="desc">
                                                        <h5><a href="#">如若</a></h5>
                                                        <p class="date">2020-7-4 </p>
                                                        <p class="comment">
                                                            在哪里交截图
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="reply-btn">
                                                    <a href="" class="btn-reply text-uppercase">回复</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-list left-padding">
                                            <div class="single-comment justify-content-between d-flex">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="/img/blog/c2.jpg" alt="">
                                                    </div>
                                                    <div class="desc">
                                                        <h5><a href="#">方瑞丰</a></h5>
                                                        <p class="date">2020-7-4 </p>
                                                        <p class="comment">
                                                            公众号
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="reply-btn">
                                                    <a href="" class="btn-reply text-uppercase">回复</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="comment-list">
                                            <div class="single-comment justify-content-between d-flex">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="/img/blog/c3.jpg" alt="">
                                                    </div>
                                                    <div class="desc">
                                                        <h5><a href="#">可可</a></h5>
                                                        <p class="date">2020-7-4 </p>
                                                        <p class="comment">
                                                            什么时候录取？
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="reply-btn">
                                                    <a href="" class="btn-reply text-uppercase">回复</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="comment-form">
                            <h4>我要评论</h4>
                            <form>
                                <div class="form-group">
                                    <textarea class="form-control mb-10" rows="5" name="message" placeholder="我要说点.."
                                              onfocus="this.placeholder = ''" onblur="this.placeholder = 'Messege'"
                                              required=""></textarea>
                                </div>
                                <a href="#" class="primary-btn text-uppercase">提交评论</a>
                            </form>
                        </div>
                    </div>
                    <!-- End single-post Area -->
                </div>
                <div class="col-lg-4">
                    <div class="sidebars-area">
                        <div class="single-sidebar-widget editors-pick-widget">
                            <h6 class="title">思想政治活动</h6>
                            <div class="editors-pick-post">
                                <div class="feature-img-wrap relative">
                                    <div class="feature-img relative">
                                        <div class="overlay overlay-bg"></div>
                                        <img class="img-fluid" src="/img/e1.jpg" alt="">
                                    </div>
                                    <ul class="tags">
                                        <li><a href="#">点击详情</a></li>
                                    </ul>
                                </div>
                                <div class="details">
                                    <a href="image-post.html">
                                        <h4 class="mt-20">我们都是收信人</h4>
                                    </a>
                                    <ul class="meta">
                                        <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                        <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                    </ul>
                                    <p class="excert">
                                        教育部思政司拟于5月4日9:00在人民网新媒体平台推出"我们都是收信人”H5小程序，邀请全国高校千万师生共同参与，请咱们同学积极参与分享转发。
                                    </p>
                                </div>
                                <div class="post-lists">
                                    <div class="single-post d-flex flex-row">
                                        <div class="thumb">
                                            <img src="/img/e2.jpg" alt="">
                                        </div>
                                        <div class="detail">
                                            <a href="image-post.html"><h6>让青春为祖国绽放主题团日活动</h6></a>
                                            <ul class="meta">
                                                <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a>
                                                </li>
                                                <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="single-post d-flex flex-row">
                                        <div class="thumb">
                                            <img src="/img/e3.jpg" alt="">
                                        </div>
                                        <div class="detail">
                                            <a href="image-post.html"><h6>弘扬宪法精神。推进依法治校</h6></a>
                                            <ul class="meta">
                                                <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a>
                                                </li>
                                                <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="single-post d-flex flex-row">
                                        <div class="thumb">
                                            <img src="/img/e4.jpg" alt="">
                                        </div>
                                        <div class="detail">
                                            <a href="image-post.html"><h6>积极分子培训班</h6></a>
                                            <ul class="meta">
                                                <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a>
                                                </li>
                                                <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="single-sidebar-widget editors-pick-widget">
                            <h6 class="title">学术科技活动</h6>
                            <div class="editors-pick-post">
                                <div class="feature-img-wrap relative">
                                    <div class="feature-img relative">
                                        <div class="overlay overlay-bg"></div>
                                        <img class="img-fluid" src="/img/e1.jpg" alt="">
                                    </div>
                                    <ul class="tags">
                                        <li><a href="#">点击详情</a></li>
                                    </ul>
                                </div>
                                <div class="details">
                                    <a href="image-post.html">
                                        <h4 class="mt-20">书法比赛</h4>
                                    </a>
                                    <ul class="meta">
                                        <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a></li>
                                        <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                    </ul>
                                    <p class="excert">
                                        在中国共产党领导下，中国人民凭着一股逢山开路、遇水架桥的闯劲，凭着一股滴水穿石的韧劲，成功走出一条中国特色社会主义道路。
                                        为提高国人的整体素质，习近平主席在十九大中提出“做好人读好书写好字”的观点，而且书法已经被纳入中学生的必修课程中，足以看出国家领导人对非物质文化的重视与保护。
                                    </p>
                                </div>
                                <div class="post-lists">
                                    <div class="single-post d-flex flex-row">
                                        <div class="thumb">
                                            <img src="/img/e2.jpg" alt="">
                                        </div>
                                        <div class="detail">
                                            <a href="image-post.html"><h6>大学生防艾知识竞赛</h6></a>
                                            <ul class="meta">
                                                <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a>
                                                </li>
                                                <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="single-post d-flex flex-row">
                                        <div class="thumb">
                                            <img src="/img/e3.jpg" alt="">
                                        </div>
                                        <div class="detail">
                                            <a href="image-post.html"><h6>科技创意制作大赛</h6></a>
                                            <ul class="meta">
                                                <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a>
                                                </li>
                                                <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="single-post d-flex flex-row">
                                        <div class="thumb">
                                            <img src="/img/e4.jpg" alt="">
                                        </div>
                                        <div class="detail">
                                            <a href="image-post.html"><h6>电子创新设计大赛</h6></a>
                                            <ul class="meta">
                                                <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-2</a>
                                                </li>
                                                <li><a href="#"><span class="lnr lnr-bubble"></span>06 评论</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </section>
    <!-- End latest-post Area -->
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
