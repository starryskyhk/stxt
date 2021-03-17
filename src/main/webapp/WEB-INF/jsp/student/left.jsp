<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <li><a href="#"><span class="lnr lnr-user"></span>用户名：${user.name}</a></li>
                        <li><a href="#"><span class="lnr "></span>ID：${user.id}</a></li>

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
                            <a href="/front/mycom/${sessionScope.user.id}"><h6>我的社团</h6></a>
                        </div>
                    </div>

                    <div class="single-post d-flex flex-row">
                        <div class="detail" style="padding-left:34%;">
                            <a href="#"><h6>我的活动</h6></a>
                        </div>
                    </div>

                    <div class="single-post d-flex flex-row">
                        <div class="detail" style="padding-left:34%;">
                            <a href="/exit"><h6>退出登录</h6></a>
                        </div>
                    </div>


                </div>
            </div>
        </div>

    </div>
</div>