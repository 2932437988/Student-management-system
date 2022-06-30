<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="cn">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="title" content="全球疫情地图" />
    <meta name="description" content="根据腾讯疫情数据接口打造而成，为您提供全球疫情地图，疫情数据可视化，疫情趋势" />
    <meta name="keywords" content="全球疫情地图,疫情数据可视化,疫情趋势,新冠疫情" />
    <link rel="icon" href="favicon.ico" />
    <title>全球疫情地图</title>
    <!-- JQ、Bootstrap -->
    <link rel="stylesheet" href="js/bootstrap.min.css" />
    <script defer src="js/jquery.js"></script>
    <script defer src="js/bootstrap.min.js"></script>
    <!-- echarts -->
    <script defer src="js/echarts.min.js"></script>
    <script defer src="js/world.js"></script>
    <script defer src="js/china.js"></script>
    <!-- js主函数入口 -->
    <!-- webpack打包版 -->
    <script defer type="module" src="js/bundle.js"></script>
    <!-- 原始版 -->
    <!-- <script defer type="module" src="js/index.js"></script> -->
    <!-- 样式 -->
    <link rel="stylesheet" href="css/index.css" />
    <title>学生行程管理系统</title>
</head>

<body class="bod">
    <!-- 头部 -->
    <header container>
        <div class="index">
            <a href="main.jsp">首页</a>
        </div>
        <h1>全球疫情地图</h1>
        <div class="showTime" id="ST"></div>
    </header>
    <!-- 版心 -->
    <div class="container mainbox">
        <div class="row">
            <!-- 左模块 -->
            <div class="col-lg-3 col-md-5 a">
                <div class="panel bl bar">
                    <h2>各洲累计确诊分布(海外)</h2>
                    <div class="chart"></div>
                    <div class="panelFooter"></div>
                </div>
                <div class="panel bl line">
                    <h2>国内疫情趋势(含港澳台)</h2>
                    <div class="chart"></div>
                    <div class="panelFooter"></div>
                </div>
            </div>
            <!-- 中间模块 -->
            <div class="col-lg-6 order-lg-1 b order-md-2">
                <!-- 上模块 -->
                <div class="no">
                    <div class="no-hd">
                        <ul>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                    <div class="no-bd">
                        <ul>
                            <li class="text-white">累计确诊人数</li>
                            <li class="text-white">累计治愈人数</li>
                        </ul>
                    </div>
                </div>
                <!-- 地图模块 -->
                <div class="map">
                    <button id="switchMapType">切换</button>
                    <div class="chart" id="viewDiv"></div>
                    <div class="panelFooter"></div>
                </div>
            </div>
            <!-- 右边模块 -->
            <div class="col-lg-3 order-lg-2 c col-md-7 order-md-1">
                <div class="panel bl bar1">
                    <h2>世界疫情累计确诊情况前十五</h2>
                    <div class="chart"></div>
                    <div class="panelFooter"></div>
                </div>
            </div>
            <div class="data">数据来源于腾讯</div>
        </div>
    </div>
</body>

</html>