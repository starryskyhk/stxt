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
                                <li><a href="/front/stad/19/171340139">点击详情</a></li>
                            </ul>
                            <a href="/front/stad/19/171340139">
                                <h4>英语社团</h4>
                            </a>
                            <ul class="meta" id="info">
                                <li><a href="#"><span class="lnr lnr-user"></span>校级</a></li>
                                <li><a href="#"><span class="lnr lnr-bubble"></span>简介：学习英语的。</a>
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
                                <li><a href="/front/stad/19/171340139">点击详情</a></li>
                            </ul>
                            <a href="/front/stad/19/171340139">
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
</div>
</body>
</html>
