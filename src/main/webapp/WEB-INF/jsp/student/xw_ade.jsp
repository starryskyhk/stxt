<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>新闻详情</title>
    <%@include file="/WEB-INF/jsp/common2.jsp" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


</head>
<body onload="showDT()">
<%@include file="/WEB-INF/jsp/student/head.jsp" %>
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
                            <img class="img-fluid" src="/img/banner-03.png" alt="">
                        </div>
                        <div class="content-wrap">
                            <a href="#">
                                <h3>渭南师范学院第四次学生代表大会胜利召开</h3>
                            </a>
                            <ul class="meta pb-20">
                                <li><a href="#"><span class="lnr lnr-user"></span></a>马克思主义青年社团</li>
                                <li><a href="#"><span class="lnr lnr-calendar-full"></span>2020-7-4</a></li>
                            </ul>
                            <p>
                                &nbsp;&nbsp;&nbsp;&nbsp;12月19日晚，渭南师范学院第四次学生代表大会预备会议在朝阳校区召开，预备会议富平分会场代表通过网络直播同步参与。会议听取并审议了《大会筹备工作报告》、《代表资格审查报告（草案）》、《正式大会议程（草案）》、《大会主席团、秘书长名单（草案）》等重要文件，
                                为大会的正式召开做以充分准备。    </br>
                                &nbsp;&nbsp;&nbsp;&nbsp;12月20日，渭南师范学院第四次学生代表大会在朝阳校区演艺厅隆重召开。本次大会以“高举中国特色社会主义伟大旗帜，以习近平新时代中国特色社会主义思想为指导，深入学习贯彻习近平总书记系列重要讲话精神和全国学联二十七大、省学联十大精神。
                                全面总结近年来我校学生会组织所取得的成绩，研究确定今后学生会工作的指导思想和主要任务，团结带领全校学生为建设特色鲜明的地方高水平师范大学贡献青春力量”为主要任务。校党委副书记任健，学工部部长陈景西，保卫处处长马利涛，校团委书记、大会秘书长姚明亮，校团委副书记
                                大会副秘书长肖飞、刘娟宁，兄弟院校代表、西安电子科技大学学生会执行主席江艺康出席大会，各二级学院团总支书记、全体学代会代表、特邀代表与列席代表参与活动。会议由校学生会执行主席、大会主席团成员乔磊主持。
                            </p>


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
