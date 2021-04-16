<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>社团管理系统</title>

    <meta name="keywords" content="">
    <meta name="description" content="">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.jsp"/>
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                                    <span class="block m-t-xs" style="font-size:20px;">
                                        <i class="fa fa-area-chart"></i>
                                        <strong class="font-bold">社团管理系统</strong>
                                    </span>
                                </span>
                        </a>
                    </div>
                    <div class="logo-element">社团管理系统
                    </div>
                </li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">数据统计</span>
                </li>
                <li>
                    <a class="J_menuItem" href="/back/home">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">主页</span>
                    </a>
                </li>
                <li>
                    <a class="J_menuItem">
                        <i class="fa fa-building"></i>
                        <span class="nav-label">社团管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/back/assList">社团列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="J_menuItem">
                        <i class="fa fa-building"></i>
                        <span class="nav-label">审核管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/back/assCheck">创建社团审核</a>
                        </li>
                        <li><a class="J_menuItem" href="/back/activityCheck">创建活动审核</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="J_menuItem">
                        <i class="fa fa-building"></i>
                        <span class="nav-label">场地管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/back/spaceList">场地列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="J_menuItem">
                        <i class="fa fa-building"></i>
                        <span class="nav-label">用戶管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/back/userList">学生列表</a>
                        </li>
                        <li><a class="J_menuItem" href="/back/adminList">管理员列表</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="J_menuItem">
                        <i class="fa fa-building"></i>
                        <span class="nav-label">公告管理</span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li><a class="J_menuItem" href="/back/noticeList">公告列表</a>
                        </li>
                    </ul>
                </li>
                <li class="line dk"></li>
                <li class="line dk"></li>
                <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                    <span class="ng-scope">个人管理</span>
                </li>
                <li>
                    <a class="J_menuItem" href="/back/editInfo"><i class="fa fa-archive"></i> <span
                            class="nav-label">信息修改</span></a>

                </li>

            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-info " href="#"><i
                        class="fa fa-bars"></i> </a>

                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                        <b>
                            <p style="font-size: 18px;color:black;font-family: '黑体';padding-top: 13px">系统管理员:${sessionScope.user.name}老师,您好<a style="font-size: 18px;color:blue;font-family: '黑体';padding-top: 13px" href="/exit">退出</a></p>
                        </b>
                    </li>


                </ul>
                </li>

                </ul>
            </nav>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe id="J_iframe" width="100%" height="100%" src="/back/home" frameborder="0"
                    seamless></iframe>
        </div>
    </div>
    <!--右侧部分结束-->
</div>

<!-- 全局js -->
<script src="/js/jquery.min.js?v=2.1.4"></script>
<script src="/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="/js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="/js/hAdmin.js?v=4.1.0"></script>
<script type="text/javascript" src="/js/index.js"></script>

<!-- 第三方插件 -->
<script src="/js/plugins/pace/pace.min.js"></script>
</body>

</html>
