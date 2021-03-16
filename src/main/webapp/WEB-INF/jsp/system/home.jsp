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

    <!--360浏览器优先以webkit内核解析-->
    <title>主页</title>

    <%@include file="/WEB-INF/jsp/common.jsp" %>
    <style>
        .table{
            padding-left: 10%    ;
        }
    </style>
    <script type="text/javascript" src="/js/echarts.min.js"></script>
</head>

<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->

<div class="table" id="main" style="width: 600px;height:400px; display: inline-block"></div>
<div  class="table" id="right" style="width: 600px;height:400px; display: inline-block"></div>
<div  class="table" id="pie" style="width: 600px;height:400px; display: inline-block"></div>
<div class="table" id="line" style="width: 600px;height:400px; display: inline-block"></div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var right = echarts.init(document.getElementById('right'));
    var pie = echarts.init(document.getElementById('pie'));
    var line = echarts.init(document.getElementById('line'));

    var option = {
        title: {
            text: '社团活跃度排行',
            subtext: '渭南师范学院'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['活跃度']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01]
        },
        yAxis: {
            type: 'category',
            data: ['英语星空社团', '数学建模社团', '轮滑社团', '自强协会', '国学社团', '计算机协会', '乒乓球协会', '羽毛球协会', '篮球协会', '旅游协会', '魔方协会', '动漫协会']
        },
        series: [
            {
                name: '活跃度',
                type: 'bar',
                data: [569, 589, 615, 630.8, 680.9, 720.15, 750, 787.68, 850.1, 900.08, 952.36, 978]
            }
        ]
    };
    var option2 = {
        title: {
            text: '活动活跃度排行',
            subtext: '渭南师范学院'
        },
        tooltip: {

            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {

            data: ['活跃度']
        },
        color: new echarts.graphic.LinearGradient(
            1, 0, 0, 0,
            [
                {offset: 0, color: '#2378f7'},
                {offset: 0.7, color: '#2378f7'},
                {offset: 1, color: '#83bff6'}
            ]
        ),
        grid: {

            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis: {
            type: 'value',
            boundaryGap: [0, 0.01]
        },
        yAxis: {
            type: 'category',
            data: ['读书活动', '数学建模比赛', '秋韵征文', '思政征文', '武术比赛', '舞蹈比赛', '摄影比赛', '辩论赛', '阅读活动', '足球比赛', '篮球比赛', '敬老院活动']
        },
        series: [
            {
                name: '活跃度',
                type: 'bar',
                data: [100, 256, 356.9, 380.09, 420.9, 569.15, 580, 602.32, 658.1, 786.08, 820.36, 942.98]
            }
        ]
    };
    var option3 = {
        title: {
            text: '社团类型分布图',
            subtext: '渭南师范学院',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
        },
        series: [
            {
                name: '访问来源',
                type: 'pie',
                radius: '50%',
                data: [
                    {
                        value: 5, name: '思想政治', itemStyle: {
                            // 设置扇形的颜色
                            color: '#c23531',
                            shadowBlur: 200,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    },
                    {value: 10, name: '科技学术'},
                    {value: 6, name: '文艺体育'},
                    {value: 4, name: '理论学习'},
                    {value: 5, name: '公益服务'},

                    {
                        value: 2, name: '宗教类型', itemStyle: {
                            color: 'yellow'
                        }
                    },
                    {
                        value: 10, name: '娱乐类型', itemStyle: {
                            color: '#ea7ccc'
                        }
                    }, {
                        value: 8, name: '其他类', itemStyle: {
                            color: 'blue'
                        }
                    }
                ],
                emphasis: {
                    itemStyle: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    var option4 = {
        title: {
            text: '每月活动数量折线图'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['活动数量',]
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['一月', '二月', '三月', '四月',
                '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name: '活动数量',
                type: 'line',
                stack: '总量',
                data: [10, 8, 20, 25, 30, 22, 12, 8, 40, 50, 43, 40]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    right.setOption(option2);
    pie.setOption(option3);
    line.setOption(option4);

</script>
</body>

</html>
