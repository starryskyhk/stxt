<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>社团详情</title>
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
                                <h3>${assInfo.association.name}</h3>

                            </a>
                            <ul class="meta pb-20">
                                <li><a href="#"><span class="lnr "></span>ID：${assInfo.association.id}</a></li>
                                <li><a href="#"><span class="lnr lnr-bookmark"></span>${association.type}</a></li>
                                <li><a href="#"><span class="lnr lnr-user"></span>社团成员人数：${assInfo.association.num}</a>
                                </li>
                                <li>


                                </li>
                            </ul>
                            <blockquote>
                                社团公告：</br>
                            </blockquote>
                            <p>
                                如果想加入我们协会，请加QQ群详细咨询</p>
                            <blockquote>
                                社团简介：</br>
                            </blockquote>
                            <p>
                                ${assInfo.association.brief} </br>
                            </p>

                            <blockquote>
                                成立时间： ${assInfo.association.createTime} </br>
                                社长： ${assInfo.userName}</br>
                                社团官方qq群： ${assInfo.association.qq}</br>
                                社团邮箱： ${assInfo.association.email}</br>
                            </blockquote>

                            <div class="navigation-wrap justify-content-between d-flex">
                                <c:if test="${status==null}">
                                    <a id="join" class="next"  style="margin-left: 80%; ">我要加入<span
                                            class="lnr lnr-plus-circle"></span></a>
                                </c:if>

                                <c:if test="${status==0}">
                                    <a  class="next" href="" style="margin-left: 80%; background-color: grey ">已加入<span
                                            class="lnr lnr-plus-circle"></span></a>
                                </c:if>
                                <c:if test="${status==1}">
                                    <a  class="next" href="" style="margin-left: 80%; background-color: grey">正在审核中<span
                                            class="lnr lnr-plus-circle"></span></a>
                                </c:if>

                            </div>

                        </div>
                    </div>
                    <!-- End single-post Area -->
                </div>
                <div class="col-lg-4">
                    <div class="sidebars-area">
                        <div class="single-sidebar-widget editors-pick-widget">
                            <h6 class="title">社团活动</h6>
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

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End latest-post Area -->
</div>


<script>
    $("#join").click(function () {
        $.ajax({
            url: "/sys/member",
            type: 'put',
            data:{
                "status":1,
                "userId": ${sessionScope.user.id},
                "associationId":${assInfo.association.id}
            },
            success: function (response) {
                if (response.code == 0) {
                    //成功，显示提示消息，并刷新表格
                    layer.alert("申请成功，请等待审核");
                    setTimeout(function () {
                       location.reload();
                    }, 2000);
                } else {
                    layer.alert(response.msg, {icon: 5, anim: 6});
                }
            }
        })
    })
</script>
</body>
</html>
