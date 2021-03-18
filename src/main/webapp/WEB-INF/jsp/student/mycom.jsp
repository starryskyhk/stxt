<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>个人社团</title>
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
    }


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
                        <h4 class="cat-title">我创建的社团</h4>
                        <div class="site-main-container">
                            <!-- Start top-post Area -->
                            <section class="top-post-area pt-10">
                                <div class="container no-padding">
                                    <div class="row small-gutters">
                                        <c:forEach items="${userCreate}" var="ass">
                                            <div class="col-lg-4 top-post-right">
                                                <div class="single-top-post">
                                                    <div class="feature-image-thumb relative">
                                                        <div class="overlay overlay-bg"></div>
                                                        <img class="img-fluid" src="${ass.association.imgUrl}" alt="">
                                                    </div>
                                                    <div class="top-post-details">
                                                        <ul class="tags">
                                                            <li><a href="/front/stad/${ass.association.id}/${sessionScope.user.id}">点击详情</a>
                                                            </li>
                                                        </ul>
                                                        <a href="/front/stad/${ass.association.id}/${sessionScope.user.id}">
                                                            <h4>${ass.association.name}</h4>
                                                        </a>
                                                        <ul class="meta" id="">
                                                            <li><a href="/front/stad/${ass.association.id}/${sessionScope.user.id}"><span
                                                                    class="lnr "></span>${ass.association.id}</a></li>
                                                            <li><a href="/front/stad/${ass.association.id}/${sessionScope.user.id}"><span
                                                                    class="lnr lnr-bookmark"></span>${ass.type}</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>

                    <div class="latest-post-wrap">
                        <h4 class="cat-title">我参加的社团</h4>
                        <div class="site-main-container">
                            <!-- Start top-post Area -->
                            <section class="top-post-area pt-10">
                                <div class="container no-padding">
                                    <div class="row small-gutters">
                                        <c:forEach items="${userJoin}" var="ass">
                                            <div class="col-lg-4 top-post-right">
                                                <div class="single-top-post">
                                                    <div class="feature-image-thumb relative">
                                                        <div class="overlay overlay-bg"></div>
                                                        <img class="img-fluid" src="${ass.association.imgUrl}" alt="">
                                                    </div>
                                                    <div class="top-post-details">
                                                        <ul class="tags">
                                                            <li><a href="/front/stad/${ass.association.id}/${sessionScope.user.id}">点击详情</a>
                                                            </li>
                                                        </ul>
                                                        <a href="/front/stad/${ass.association.id}/${sessionScope.user.id}">
                                                            <h4>${ass.association.name}</h4>
                                                        </a>
                                                        <ul class="meta">
                                                            <li><a href="/front/stad/${ass.association.id}/${sessionScope.user.id}"><span
                                                                    class="lnr "></span>${ass.association.id}</a></li>
                                                            <li><a href="/front/stad/${ass.association.id}/${sessionScope.user.id}"><span
                                                                    class="lnr lnr-bookmark"></span>${ass.type}</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</div>
</section>
</div>

</body>
</html>
