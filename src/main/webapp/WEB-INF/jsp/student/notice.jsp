<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <title>通知公告</title>
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
                        <h4 class="cat-title">公告</h4>

                    <c:forEach items="${notices}" var="notice" >
                        <div class="single-latest-post row align-items-center">
                            <div class="col-lg-7 post-right">
                                <a href="#">
                                    <h4>${notice.title}</h4>
                                </a>
                                <ul class="meta">
                                    <li><a href="#">${notice.id}"><span class="lnr lnr-calendar-full"></span>${notice.createTime}</a></li>
                                </ul>
                                <p class="excert">
                                   ${notice.content}
                                </p>
                                <hr align="center" width="177%" style="border: 1 dashed #777777;">
                            </div>
                        </div>
                    </c:forEach>
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
