<%@ page language="java"  pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/taglib.jsp" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>补番吧</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css"/>
    <style type="text/css">
        body {
            /*<nav class="navbar navbar-inverse navbar-fixed-top"> 导航条挡住了艾米莉亚的小半个头啊*/
            /*下面设置了nav的height是40px*/
            padding-top: 40px;
        }

        /*.panel a{
            color: #141A1B;
        }*/  /*这个必须在a:hover上面,hover才有效果。。。*/

        /*a标签的一些设置*/
        a:link {
            text-decoration: none;
            cursor: pointer;
            color: #000;
        }

        a:visited {
            text-decoration: none;
            cursor: pointer;
            color: #000;
        }

        a:hover {
            text-decoration: none;
            cursor: pointer;
            color: #F6F;
        }

        a:active {
            text-decoration: none;
            cursor: pointer;
            color: #000;
        }

        /*新番1 2 3 4 5...*/
        .panel .sequence{
            /*没inline的话,序号和文字分成2行;没block的话,width:16px无效.参考有道云笔记《块级元素和行内元素》*/
            display: inline-block;
            line-height: 14px;
            background:#ff84bb;
            font-style: italic;
            border-radius: 4px;
            margin-right: 10px;
            /*<span>中文字的颜色*/
            color: #fff;
            width:16px;
            height:14px;
            text-align: center;
        }



        .navbar {
            /*所以body的padding-top: 40px;*/
            min-height: 40px;
            height: 40px;
        }

        .navbar-nav > li > a {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        /*管理*/
        #guanli {
            float: right;
            margin-top: -30px;
            margin-right: 10px
        }
        #guanli a {
            color: #9d9d9d;
        }
        #guanli a:hover {
            color: #fff;
        }

        .navbar-toggle {
            margin-top: 4px;
            margin-bottom: 4px;
        }

        .wechat {
            background: url(${ctxStatic}/pic/wechat.png) no-repeat;
            padding-left: 20px;
        }


        #bs-example-navbar-collapse-2 li > a:hover {
            text-decoration: none;
            cursor: pointer;
            color: #F6F
        }


        /*下拉菜单悬浮时再显示*/
        .dropdown-menu{
            /*为了实现hover时展示下拉菜单,先让它不显示下拉菜单*/
            display: none;
            /*为了给子元素定位*/
            position: absolute;
        }

        .nav .dropdown:hover .dropdown-menu{
            /*当hover时,dropdown-menu显示下拉菜单*/
            display: block;
        }

        #bs-example-navbar-collapse-2 .second-nav .dropdown-menu a:hover{
            padding-left: 24px;
            color: #FF0000;
        }


        /*re0的背景*/
        .myWrapper {
            background: url(${ctxStatic}/pic/head-bg-img.jpg) no-repeat center top;
        }

        /*会动的小美女gif*/
        .logo {
            height: 220px;
        }

        .logo-gif {
            /*col-lg-5 默认position: relative*/
            position: absolute;
            top: 20%;
            margin-left: 116px;
        }

        /*导航栏透明的条*/
        .headline {
            background: url(/static/pic/nav-bg-img.jpg) no-repeat;
        }

        .sidecontent {
            background: url(${ctxStatic}/pic/mc-line.png) 164px top no-repeat;
            height: 400px;
        }

        .sidetemperature {
            height: 400px;
        }

        .maincontent {
            height: 400px;
        }

        .sideimg {
            width: 136px;
            height: 72px;
        }

        #temperature {
            position: absolute;
            bottom: 28px;
            left: 7.3px;
            width: 5px;
            height: 336px;
            /*background: #F9F一样的*/
            background-color: #F9F;
        }

        .carousel-caption {
            bottom: 0px;
            /*宽度跟父元素宽度一样*/
            width: 100%;
            /*左边距离父元素为自身宽度0%,右边距离父元素为自身宽度0%,加上跟父元素宽度一样,这样就左右对齐不偏了*/
            left: 0%;
            right: 0%;
        }

        .carousel-caption .c{
            background-color:black;
            position:absolute;
            bottom:0px;
            left:0px;
            right:0px;
        }


        /*推荐 新番 补番的框*/
        .tuijian, .activity-info, .subao, .cosplay, .bfb {
            border: 1px solid #e2e2e2;
            border-radius: 3px;
        }

        #tuijianC li{
            margin-bottom: 3px;
        }

        /*推荐每条前的圆点*/
        .tuijianicon {
            /*没inline会分行*/
            display: inline-block;
            position: relative;
            top: -1px;
            background: #ff84bb;
            width: 6px;
            height: 6px;
            border-radius: 50%;
        }


        /*各张图片*/
        /*每行间距*/
        .allcontent .col-md-4 {
            margin-bottom: 18px;
        }

        /*每个图文边框*/
        .eachcontent {
            border: 1px solid #e6e6e6;
        }

        /*图片*/
        .allcontent img {
            width: 100%;
        }

        /*动漫标题*/
        .allcontent .textbox {
            padding: 27px 20px 0px;
            width: 100%;
            height: 75px;
        }

        /*分类+作者*/
        .allcontent .labelbox {
            font-size: 12px;
            /*作者在最右边 分类不受此影响*/
            text-align: right;
            position: relative;
            padding: 0px 20px;
            bottom: 10px;
        }

        /*分类*/
        .allcontent .labelbox span {
            border: 1px solid #ff84bb;
            border-radius: 9px;
            padding: 0px 10px 0px 10px;
            color: #ff84bb;
            position: absolute;
            left: 20px;
        }

        /*加载更多*/
        #loadMore{
            /*要让子元素a定位，必须加上position: relative.见有道云笔记css position absolute 加不加的区别*/
            position: relative;
            width:100%;
            height:52px;
        }

        #loadMore a{
            /*为了让它定位.见有道云笔记块级元素和行内元素*/
            display: block;
            position: absolute;
            /*下面五行实现居中*/
            margin: auto;
            left:0px;
            right:0px;
            bottom:0px;
            top:0px;
            width:100px;
            height:100%;
            background: url(${ctxStatic}/pic/loader-btn.png) no-repeat;
        }

        #loadMore a:hover{
            background: url(${ctxStatic}/pic/loader-btn-hover.png) no-repeat;
        }

        /*按标题 时间 类型排序*/
        #xuanxiangka{
            display:block;
            padding: 0px;
        }

        #xuanxiangka li{
            list-style: none;
            /*否则按标题 时间 类型排序这3个会垂直排列*/
            float: left;
            width: 140px;
        }

        #xuanxiangka span{
            font-size: 18px;
        }

        /*<span class="green">按标题排序</span>,配合点击后颜色的变化*/
        .green{
            color:#8ac024;
        }

        .blue
        {
            color:#3A5FCD;
        }

        /*活动信息用不上了*/
        /*.activity-content p {
            padding: 0 18px;
            background-color: black;
            color: white;
            line-height: 30px;
            font-size: 14px;
            text-align: center;
            position: absolute;
            bottom: -10px;
            height: 30px;
        }*/

        /*推荐 新番 补番*/
        .title {
            margin: 10px;
        }

        /*补番1 2 3 4 ...*/
        .bfb .rank {
            height: 15px;
            width: 15px;
            border-radius: 10px;
            background-color: #CCF;
            font-size: 10px;
            color: #000;
        }

        /*补番文字部分*/
        .bfb li {
            /*设置行间的距离*/
            line-height: 30px;
            height: 30px;
            overflow: hidden;
            /*文字...*/
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        li a {
            color: #000;
        }


        .carousel-indicators {
            position: relative;
            bottom: 0px;
            left: 0px;
            z-index: 15;
            width: 100%;
            padding-left: 0;
            margin-left: 0;
            text-align: center;
            list-style: none;
        }

        .carousel-indicators li {
            display: block;
            width: 136px;
            height: 72px;
            margin: 0 0 10px 0;
            text-indent: 0px;
            cursor: pointer;
            background-color: rgba(0, 0, 0, 0);
            border: 0px solid #fff;
            border-radius: 0px;
        }

        .carousel-indicators .active {
            width: 136px;
            height: 72px;
            margin: 0 0 10px 0;
            background-color: #fff;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false"><span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></button>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav first-nav">
                <%--<li><a href="#">首页 </a></li>--%>

                <li class="wechat dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                               role="button" aria-haspopup="true"
                                               aria-expanded="false">我的QQ</a>
                    <ul class="dropdown-menu">
                        <li><img src="${ctxStatic}/pic/qq2.jpg"></li>

                    </ul>
                </li>
                <li class="wechat dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                        role="button" aria-haspopup="true"
                                        aria-expanded="false">我的微信</a>
                    <ul class="dropdown-menu">
                        <li><img src="${ctxStatic}/pic/wechat2.jpg"></li>

                    </ul>
                </li>
                <li class="wechat dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                               role="button" aria-haspopup="true"
                                               aria-expanded="false">我的BiliBili</a>
                    <ul class="dropdown-menu">
                        <li><img src="${ctxStatic}/pic/bilibili2.jpg"></li>

                    </ul>
                </li>
            </ul>
        </div>

    </div>
    <div id="guanli"><a href="${ctxPath}/mainPic/getMainPic" >管理</a></div>
</nav>
<div class="myWrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 logo">
                <img class="logo-gif" src="${ctxStatic}/pic/head-logo.gif">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <nav class="navbar navbar-default headline">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                    data-target="#bs-example-navbar-collapse-2" aria-expanded="false"><span
                                    class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
                                    class="icon-bar"></span> <span class="icon-bar"></span></button>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
                                <ul class="nav navbar-nav second-nav">
                                    <li class="item"><a href="#">看过的动画 </a></li>
                                    <%--<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                            role="button" aria-haspopup="true" aria-expanded="false">动漫情报 </a>
                                        <ul class="dropdown-menu ">
                                            <li><a href="#">国产动画/漫画</a></li>
                                            <li><a href="#">动画/漫画情报</a></li>
                                            <li><a href="#">真人/舞台剧</a></li>
                                            <li><a href="#">广播剧/轻小说/杂志</a></li>
                                            <li><a href="#">音乐/OP/ED/OST</a></li>
                                        </ul>
                                    </li>--%>
                                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                            role="button" aria-haspopup="true" aria-expanded="false">动漫歌曲</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="${ctxPath}/client/showMusic">歌曲</a></li>
                                            <li><a href="#">配乐</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                            role="button" aria-haspopup="true"
                                                            aria-expanded="false">萌周边</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">黏土人偶</a></li>
                                            <li><a href="#">立体手办</a></li>
                                            <li><a href="#">周边其他</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                            role="button" aria-haspopup="true"
                                                            aria-expanded="false">福利社 </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">腐女</a></li>
                                            <li><a href="#">绅士</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                            role="button" aria-haspopup="true"
                                                            aria-expanded="false">万事屋</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">涨姿势</a></li>
                                            <li><a href="#">猎奇文化</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">游戏宅</a></li>
                                    <li><a href="#">八卦谈</a></li>
                                    <!--
                                    <form class="navbar-form navbar-left navbar-myform ">
                                      <div class="form-group">
                                        <input type="text" class="form-control " placeholder="请输入关键字进行搜索">
                                      </div>
                                    </form>-->
                                </ul>
                            </div>
                            <!-- /.navbar-collapse -->
                        </div>
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row carousel slide" id="carousel-example-generic" data-ride="carousel">
            <div class="col-lg-2 sidecontent">
                <div class="row">
                    <div class="col-xs-10 sideimggroup">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0">
                                <img class="sideimg" src="">
                            </li>

                            <li data-target="#carousel-example-generic" data-slide-to="1">
                                <img class="sideimg" src="">
                            </li>

                            <li data-target="#carousel-example-generic" data-slide-to="2">
                                <img class="sideimg" src="">
                            </li>

                            <li data-target="#carousel-example-generic" data-slide-to="3"  class="active">
                                <img class="sideimg" src="">
                            </li>

                            <li data-target="#carousel-example-generic" data-slide-to="4">
                                <img class="sideimg" src="">
                            </li>
                        </ol>
                    </div>
                    <div class="col-xs-2 sidetemperature">
                        <div id="temperature"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 maincontent">
                <div>
                    <div class="carousel-inner" role="listbox">
                        <%--<div class="item active">active,首先是它展现--%>
                        <div class="item active">
                            <a href="" target="_blank"><img src="" style="height:400px;"></a>
                            <div class="carousel-caption">
                                <div class="c">
                                    <%--奇诺之旅，人生之旅（不需要了）--%>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <a href="" target="_blank"><img src="" style="height:400px;"></a>
                            <div class="carousel-caption">
                                 <div class="c">
                                     <%--钢之炼金术师：等价交换是世界的法则--%>
                                 </div>
                            </div>
                        </div>
                        <div class="item">
                            <a href="" target="_blank"><img src="" style="height:400px;"></a>
                            <div class="carousel-caption">
                                <div class="c">
                                    <%--天元突破最爱谁？看我优子当教师❤--%>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <a href="" target="_blank"><img src="" style="height:400px;"></a>
                            <div class="carousel-caption">
                                <div class="c">
                                    <%--精灵守护者，纳吉之歌--%>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <a href="" target="_blank"><img src="" style="height:400px;"></a>
                            <div class="carousel-caption">
                                <div class="c">
                                    <%--龙与虎~~我是实乃梨党！--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 ">
                <div class="tuijian">
                    <div class="title"><img src="${ctxStatic}/pic/zxsb.png"> <span
                            style="font-size:18px;font-weight:700;">推荐</span></div>
                    <div id="tuijianC" >
                        <ul style="padding:0px;list-style:none;">
                            <%--<c:forEach items="${tuijianList}" var="p">
                                <li><a> <i class="tuijianicon"></i> ${p.content} </a></li>
                            </c:forEach>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--选项卡--%>
    <div class="container" style="margin-top:23px;">
        <div class="row">
            <div class="col-lg-6" >
                <ul id="xuanxiangka">
                    <li><a><span class="green">按标题排序</span></a></li>
                    <li><a><span class="blue">按时间排序</span></a></li>
                    <li><a><span class="blue">按类型排序</span></a></li>
                </ul>
            </div>
            <div class="col-lg-3">
                <div class="input-group">
                    <input id="fanName" type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                        <button id="fanBtn" class="btn btn-default"  style="padding-bottom: 2.666px;" type="button">Go!</button>
                    </span>
                </div><!-- /input-group -->
            </div>
         </div>
    </div>

    <%--横线--%>
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <div style="height:2px;background:#3A5FCD;"></div>
            </div>
        </div>
    </div>

    <!--主要内容和边栏 -->
    <div class="container" style="margin-top:8px;">
        <div class="row">
            <!--主要内容-->
            <div class="col-lg-9 allcontent">
                <div class="row" id="mainPic">
                    <%--<c:forEach items="${mainPicInitList}" var="p">
                        <div class="col-md-4">
                            <div class="eachcontent">
                                <img src="${ctxPath}${p.path}">-
                                <p class="textbox">${p.content}</p>
                                <p class="labelbox"><span>${p.classification}</span>${p.author}</p>
                            </div>
                        </div>
                    </c:forEach>--%>
                </div>
                <div id="loadMore">
                    <a></a>
                </div>



            </div>

            <!--边栏-->
            <div class="col-lg-3">
                <!--戳我-->
                <%--<a style="height:75px;margin-bottom:5px;display:block;"> <img src="${ctxStatic}/pic/chuowo.png"
                                                                              style="width:100%;"> </a>--%>
                <!--活动信息-->
                <%--<div class="activity-info" style="margin-bottom:15px;">
                    <div class="title"><img src="${ctxStatic}/pic/huodong.png"> <span
                            style="font-size:18px;font-weight:700;">活动信息</span></div>
                    <div class="activity-content" style="padding:0 10px;">
                        <ul style="padding:0px;list-style:none;">
                            <li style="height:114px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                    src="${ctxStatic}/pic/chinajoylive.jpg" style="width:100%;height:100%;">
                                <p> 【2017.7.29】ChinaJoyLive歌谣祭~ </p>
                            </a></li>
                            <li style="height:114px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                    src="${ctxStatic}/pic/qjgj.jpg" style="width:100%;height:100%;">
                                <p> 【7.21~7.23】Falcom jdk Band演唱会 </p>
                            </a></li>
                            <li style="height:114px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                    src="${ctxStatic}/pic/qzwk.jpg" style="width:100%;height:100%;">
                                <p> 【6月~12月】第二回轻之文库新人赏 </p>
                            </a></li>
                            <li style="height:114px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                    src="${ctxStatic}/pic/asiatour.jpg" style="width:100%;height:100%;">
                                <p> 【2017.7.9】铃木このみ亚洲巡唱-香港站 </p>
                            </a></li>
                        </ul>
                    </div>
                </div>--%>
                <!--新番-->
                <div class="subao">
                    <div class="title"><img src="${ctxStatic}/pic/zt.png"> <span
                            style="font-size:18px;font-weight:700;">一月新番</span></div>
                    <div class="subao-content" style="padding:0 10px;">

                        <%--<ul style="padding:0px;list-style:none;">
                            <li>
                                <div id="dtzt1" class="dtzt"
                                     style="height:120px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                        src="${ctxStatic}/pic/ctlw.jpg"
                                        style="width:100%;height:100px;position:absolute;top:0px;">
                                    <p style="position:absolute;bottom:-10px;white-space:nowrap; text-overflow:ellipsis;">
                                        浅析成田良悟：走钢丝的黑色幽默轻小说~</p></a>
                                </div>
                            </li>
                            <li>
                                <div id="dtzt2" class="dtzt"
                                     style="height:20px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                        src="${ctxStatic}/pic/xhc.jpg"
                                        style="width:100%;height:100px;position:absolute;top:-100px;">
                                    <p style="position:absolute;bottom:-10px;white-space:nowrap; text-overflow:ellipsis;">
                                        【人物专题】你了解新海诚吗？</p></a>
                                </div>
                            </li>
                            <li>
                                <div id="dtzt3" class="dtzt"
                                     style="height:20px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                        src="${ctxStatic}/pic/xf.jpg"
                                        style="width:100%;height:100px;position:absolute;top:-100px;">
                                    <p style="position:absolute;bottom:-10px;white-space:nowrap; text-overflow:ellipsis;">
                                        你已经决定要追哪几部新番了吗？</p></a>
                                </div>
                            </li>
                            <li>
                                <div id="dtzt4" class="dtzt"
                                     style="height:20px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                        src="${ctxStatic}/pic/kjj.jpg"
                                        style="width:100%;height:100px;position:absolute;top:-100px;">
                                    <p style="position:absolute;bottom:-10px;white-space:nowrap;text-overflow:ellipsis;">
                                        讲真，你想喝喝谁的「口嚼酒」啊？？？</p></a>
                                </div>
                            </li>
                            <li>
                                <div id="dtzt5" class="dtzt"
                                     style="height:20px;position:relative;overflow:hidden;margin-bottom:10px;">
                                    <a> <img src="${ctxStatic}/pic/dadang.jpg"
                                             style="width:100%;height:100px;position:absolute;top:-100px;">
                                        <p style="position:absolute;bottom:-10px;white-space:nowrap;text-overflow:ellipsis;">
                                            你愿意选谁作为你的异次元搭档呢？？</p></a>
                                </div>
                            </li>
                        </ul>--%>


                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <%--<div class="panel">
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div >
                                        <a href="" target="_blank">
                                            <img
                                                src="${ctxStatic}/pic/subao/qdz2.jpg"
                                                style="width:100%;height:100px;">
                                        </a>
                                    </div>
                                </div>
                                <div  role="tab" id="headingOne" class="c">
                                    <span class="sequence">1</span>
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="text-decoration:none;">
                                        &lt;%&ndash;Fate/Extella：红saber很帅有木有~&ndash;%&gt;
                                    </a>

                                </div>
                            </div>
                            <div class="panel">
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div >
                                        <a href="" target="_blank">
                                            <img
                                                src="${ctxStatic}/pic/subao/jz.jpg"
                                                style="width:100%;height:100px;">
                                        </a>
                                    </div>
                                </div>
                                <div  role="tab" id="headingTwo" class="c">
                                    <span class="sequence">2</span>
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            &lt;%&ndash;紫罗兰永恒花园：别被奶死啊&ndash;%&gt;
                                        </a>

                                </div>
                            </div>
                            <div class="panel">
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div>
                                        <a href="" target="_blank">
                                            <img
                                                src="${ctxStatic}/pic/subao/ol2.jpg"
                                                style="width:100%;height:100px;">
                                        </a>
                                    </div>
                                </div>
                                <div role="tab" id="headingThree" class="c">
                                    <span class="sequence">3</span>
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree" style="text-decoration:none;">
                                            &lt;%&ndash;Over Lord2：我最期待的新番&ndash;%&gt;
                                        </a>
                                 </div>
                            </div>
                            <div class="panel">
                                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                                    <div>
                                        <a href="" target="_blank">
                                            <img
                                                src="${ctxStatic}/pic/subao/qm2.jpg"
                                                style="width:100%;height:100px;">
                                        </a>
                                    </div>
                                </div>
                                <div role="tab" id="headingFour" class="c">
                                    <span class="sequence">4</span>
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseThree" style="text-decoration:none;">
                                            &lt;%&ndash;七大罪2：居然没被禁？&ndash;%&gt;
                                        </a>
                                 </div>
                            </div>
                            <div class="panel">
                                <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                                    <div>
                                        <a href="" target="_blank">
                                            <img
                                                src="${ctxStatic}/pic/subao/fe.jpg"
                                                style="width:100%;height:100px;">
                                        </a>
                                    </div>
                                </div>
                                <div role="tab" id="headingFive" class="c">
                                    <span class="sequence">5</span>
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseThree" style="text-decoration:none;">
                                            &lt;%&ndash;齐木楠雄的灾难2：哦呼~&ndash;%&gt;
                                        </a>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>

                <!--cosplay-->
                <%--<div class="cosplay" style="margin-top:15px;">
                    <div class="title"><img src="${ctxStatic}/pic/huodong.png"> <span
                            style="font-size:18px;font-weight:700;">cosplay</span></div>
                    <div id="carousel-example-generic1" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <div class="item active"><img src="${ctxStatic}/pic/kbl.jpg" style="width:100%;">
                                <div class="carousel-caption">
                                    <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                        劣质布料包裹之下的肥尻~
                                    </div>
                                </div>
                            </div>
                            <div class="item"><img src="${ctxStatic}/pic/tw.jpg" style="width:100%;">
                                <div class="carousel-caption">
                                    <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                        C91的这些妹纸你想抱走谁？
                                    </div>
                                </div>
                            </div>
                            <div class="item"><img src="${ctxStatic}/pic/smg.jpg" style="width:100%;">
                                <div class="carousel-caption">
                                    <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                        发现一只没有穿胖次的妹纸(٭°̧̧̧꒳°̧̧̧٭)
                                    </div>
                                </div>
                            </div>
                            <div class="item"><img src="${ctxStatic}/pic/aii.jpg" style="width:100%;">
                                <div class="carousel-caption">
                                    <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                        麻麻，我抽到了SSR式神了！！！！
                                    </div>
                                </div>
                            </div>
                            <div class="item"><img src="${ctxStatic}/pic/wyjs.jpg" style="width:100%;">
                                <div class="carousel-caption">
                                    <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                        麻麻！我要解锁她！定！
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!--补番榜-->
                <div class="bfb" style="margin-top:15px;">
                    <div class="title"><img src="${ctxStatic}/pic/tcb.png"> <span
                            style="font-size:18px;font-weight:700;">补番榜</span></div>
                    <ul style="padding:10px;list-style:none;">
                        <%--<li><span class="rank">1</span><a title="伪娘X女大学生，「裙下有野兽」接档「秃驴走肾不走心」 ">
                            伪娘X女大学生，「裙下有野兽」接档「秃驴走肾不走心」</a></li>
                        <li><span class="rank">2</span><a> 美版「黑色小本本」电影预告公开惹~ ，L全程黑脸！！！ </a></li>
                        <li><span class="rank">3</span><a> 《擅长捉弄的高木同学》作者·山本崇一郎画了不夜城的assassin？？？ </a></li>
                        <li><span class="rank">4</span><a> ALICE OR ALICE~妹控哥哥与双胞胎妹妹~ 将有重大发表！！！ </a></li>
                        <li><span class="rank">5</span><a> 「银魂」松阳老师场面曝光，在电影中松阳老师的配音也是由山寺宏一担任！ </a></li>
                        <li><span class="rank">6</span><a> 「你的名字」小说版漫画化啦！ </a></li>
                        <li><span class="rank">7</span><a> 请问您今天要来点兔子吗？完全新作OVA动画确定将在今年光棍节上映！！！s </a></li>
                        <li><span class="rank">8</span><a> Production I.G制作的漫改动画「寻找身体」将于7月31日配信。 </a></li>
                        <li><span class="rank">9</span><a> 『舞动青春』第4弹视觉图，7月8日开播~ </a></li>
                        <li><span class="rank">10</span><a> 「食戟之灵」第三季制作决定 </a></li>--%>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="${ctxStatic}/js/bootstrap.min.js"></script>

<script type="text/javascript">

    $(document).ready(function () {    /*$(".dtzt").hover(function () {
            $(this).animate({height: '120px'});
            $(this).find("img").animate({top: '0px'});
            $(this).find("p").animate({top: '100px'},function(){
                $(this).parent().siblings().find(".dtzt").height(20);
                $(this).parent().siblings().find(".dtzt").find("img").css("top", "-100px");
                $(this).parent().siblings().find(".dtzt").find("p").css("top", "0px");
            });
         });*/


        $("#headingOne").on("mouseover", function() {
            $("#collapseOne").collapse("show");

            $("#collapseTwo").collapse("hide");
            $("#collapseThree").collapse("hide");
            $("#collapseFour").collapse("hide");
            $("#collapseFive").collapse("hide");


        });

        $("#headingTwo").on("mouseover", function() {
            $("#collapseTwo").collapse("show");

            $("#collapseOne").collapse("hide");
            $("#collapseThree").collapse("hide");
            $("#collapseFour").collapse("hide");
            $("#collapseFive").collapse("hide");


        });

        $("#headingThree").on("mouseover", function() {
            $("#collapseThree").collapse("show");

            $("#collapseOne").collapse("hide");
            $("#collapseTwo").collapse("hide");
            $("#collapseFour").collapse("hide");
            $("#collapseFive").collapse("hide");
        });

        $("#headingFour").on("mouseover", function() {
            $("#collapseFour").collapse("show");

            $("#collapseOne").collapse("hide");
            $("#collapseTwo").collapse("hide");
            $("#collapseThree").collapse("hide");
            $("#collapseFive").collapse("hide");
        });

        $("#headingFive").on("mouseover", function() {
            $("#collapseFive").collapse("show");

            $("#collapseOne").collapse("hide");
            $("#collapseTwo").collapse("hide");
            $("#collapseThree").collapse("hide");
            $("#collapseFour").collapse("hide");
        });

        $('.carousel').carousel({
            interval: 5000,
            //鼠标悬浮indicator或inner都不会暂停，默认是"hover"
            pause:null
        });


        /*setInterval(function () {

                    $("#temperature").height($("#temperature").height() - 83);

                    if ($("#temperature").height() == 0) {
                        $("#temperature").height(336);
                    }
                }, 5000
        );浏览器选项卡换了后，指示器和内容不同步*/



        $('#carousel-example-generic').on('slid.bs.carousel', function () {
            //this就是#carousel-example-generic
            var ii = parseInt($(this).find('.carousel-indicators').find('.active').attr("data-slide-to"));
           $("#temperature").height(336 - 83*ii);

            var height = $("#temperature").height();

            if (height == 0) {
                $("#temperature").height(336);
            }
        });



        /*
        $(".textbox").click(function(){
            $(this).html(function(i,origText){
                return "<input type='text' value="+origText+"/>";
            });
        });
        */

        //搜索番剧
        $("#fanBtn").click(function(){
            var content =  $("#fanName").val();
            //当前窗口打开
            //location.href = "/mainPic/list?content="+content;
            //新窗口打开
            window.open("/mainPic/list?content="+content);
        });


        //加载更多
        var counterContent = 1;
        var counterTime = 1;
        var counterClassification = 1;
        $("#loadMore").click(function(){

            if($("#xuanxiangka .green").text()=="按标题排序"){
                counterTime = 1;
                counterClassification = 1;
                counterContent++;
                $.post("${ctxPath}/mainPic/mainPicAja",
                        {
                            page:counterContent,
                            rows:"12",
                            content:"content"
                        },
                        function(data,status){
                            var result= '';
                            var jsonReturn = JSON.parse(data).rows;
                            for(var i=0;i<jsonReturn.length;i++){
                                //alert(jsonReturn[i]["author"]);
                                if(jsonReturn[i]["url"]!=""){
                                    result += '<div class="col-md-4"><div class="eachcontent"><a href="'+jsonReturn[i]["url"]+'" target="_blank"><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }else{
                                    result += '<div class="col-md-4"><div class="eachcontent"><a><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }
                            }
                            $('.allcontent .row').append(result);
                        });
            }
            if($("#xuanxiangka .green").text()=="按时间排序"){
                counterContent = 1;
                counterClassification = 1;
                counterTime++;
                $.post("${ctxPath}/mainPic/mainPicAja",
                        {
                            page:counterTime,
                            rows:"12",
                            time:"time"
                        },
                        function(data,status){
                            var result= '';
                            var jsonReturn = JSON.parse(data).rows;
                            for(var i=0;i<jsonReturn.length;i++){
                                //alert(jsonReturn[i]["author"]);
                                if(jsonReturn[i]["url"]!=""){
                                    result += '<div class="col-md-4"><div class="eachcontent"><a href="'+jsonReturn[i]["url"]+'" target="_blank"><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }else{
                                    result += '<div class="col-md-4"><div class="eachcontent"><a><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }
                            }
                            $('.allcontent .row').append(result);
                        });
            }
            if($("#xuanxiangka .green").text()=="按类型排序"){
                counterContent = 1;
                counterTime = 1;
                counterClassification++;
                $.post("${ctxPath}/mainPic/mainPicAja",
                        {
                            page:counterClassification,
                            rows:"12",
                            classification:"classification"
                        },
                        function(data,status){
                            var result= '';
                            var jsonReturn = JSON.parse(data).rows;
                            for(var i=0;i<jsonReturn.length;i++){
                                //alert(jsonReturn[i]["author"]);
                                if(jsonReturn[i]["url"]!=""){
                                    result += '<div class="col-md-4"><div class="eachcontent"><a href="'+jsonReturn[i]["url"]+'" target="_blank"><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }else{
                                    result += '<div class="col-md-4"><div class="eachcontent"><a><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }
                            }
                            $('.allcontent .row').append(result);
                        });
            }

        });

        //初始化主要内容的页面
        iniMainPic();


        //选项卡颜色变化 和 切换排序时初始化主要图片内容
        $('#xuanxiangka span').click(function(){
            $(this).addClass('green');
            $(this).removeClass('blue');
            //parent()是找直接父元素
            $(this).parents("li").siblings().each(
                    function () {
                        $(this).find('span').addClass('blue');
                        $(this).find('span').removeClass('green');//children()是找直接子元素
                    }
            );
            if($(this).text()=='按标题排序'){
                //var counter = 1;错了
                counter = 1
                $.post("${ctxPath}/mainPic/mainPicAja",
                        {
                            page:1,
                            rows:"12",
                            content:"content"
                        },
                        function(data,status){
                            var result= '';
                            var jsonReturn = JSON.parse(data).rows;
                            for(var i=0;i<jsonReturn.length;i++){
                                if(jsonReturn[i]["url"]!=""){
                                    result += '<div class="col-md-4"><div class="eachcontent"><a href="'+jsonReturn[i]["url"]+'" target="_blank"><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }else{
                                    result += '<div class="col-md-4"><div class="eachcontent"><a><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }
                            }
                            //div间清空内容下面2种都可以
                            $("#mainPic").html("");
                            //$("#mainPic").empty();
                            $('.allcontent .row').append(result);
                        });
            }
            if($(this).text()=='按时间排序'){
                counter = 1;
                $.post("${ctxPath}/mainPic/mainPicAja",
                        {
                            page:1,
                            rows:"12",
                            time:"time"
                        },
                        function(data,status){
                            var result= '';
                            var jsonReturn = JSON.parse(data).rows;
                            for(var i=0;i<jsonReturn.length;i++){
                                if(jsonReturn[i]["url"]!=""){
                                    result += '<div class="col-md-4"><div class="eachcontent"><a href="'+jsonReturn[i]["url"]+'" target="_blank"><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }else{
                                    result += '<div class="col-md-4"><div class="eachcontent"><a><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }
                            }
                            //div间清空内容下面2种都可以
                            $("#mainPic").html("");
                            //$("#mainPic").empty();
                            $('.allcontent .row').append(result);
                        });
            }
            if($(this).text()=='按类型排序'){
                counter = 1;
                $.post("${ctxPath}/mainPic/mainPicAja",
                        {
                            page:1,
                            rows:"12",
                            classification:"classification"
                        },
                        function(data,status){
                            var result= '';
                            var jsonReturn = JSON.parse(data).rows;
                            for(var i=0;i<jsonReturn.length;i++){
                                if(jsonReturn[i]["url"]!=""){
                                    result += '<div class="col-md-4"><div class="eachcontent"><a href="'+jsonReturn[i]["url"]+'" target="_blank"><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }else{
                                    result += '<div class="col-md-4"><div class="eachcontent"><a><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                            jsonReturn[i]["author"]+'</p></div></div>';
                                }
                            }
                            //div间清空内容下面2种都可以
                            $("#mainPic").html("");
                            //$("#mainPic").empty();
                            $('.allcontent .row').append(result);
                        });
            }
         });
     });
    //初始化主要内容的首页页面
    function iniMainPic(){
        //主要图片
        $.post("${ctxPath}/mainPic/mainPicAja",
                {
                    page:1,
                    rows:"12",
                    content:"content"
                },
                function(data,status){
                    var result= '';
                    var jsonReturn = JSON.parse(data).rows;
                    for(var i=0;i<jsonReturn.length;i++){
                        if(jsonReturn[i]["url"]!=""){
                            result += '<div class="col-md-4"><div class="eachcontent"><a href="'+jsonReturn[i]["url"]+'" target="_blank"><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                    jsonReturn[i]["author"]+'</p></div></div>';
                        }else{
                            result += '<div class="col-md-4"><div class="eachcontent"><a><img src="${ctxPath}'+jsonReturn[i]["path"]+'"></a> <p class="textbox">'+jsonReturn[i]["content"]+'</p><p class="labelbox"><span>'+jsonReturn[i]["classification"]+'</span>'+
                                    jsonReturn[i]["author"]+'</p></div></div>';
                        }
                    }
                    $('.allcontent .row').append(result);
                });

        //推荐
        $.post("${ctxPath}/tuijian/tuijianAja",
                {
                    page:1,
                    rows:"5"
                },
                function(data,status){
                    var result= '';
                    var jsonReturn = JSON.parse(data).rows;
                    for(var i=0;i<jsonReturn.length;i++){
                        result += '<li><a href="'+jsonReturn[i]["url"]+'" target="_blank"> <i class="tuijianicon"></i>'+ jsonReturn[i]["content"] +'</a></li>';
                    }
                    $('#tuijianC ul').append(result);

                    //图片链接和图片下面的看法
                    //侧栏图片部分 拼接或者jqurey赋值灵活运用吧,有时都可以
                    var arrS = $(".sideimggroup li");
                    for( var j=0;j<arrS.length;j++){
                        $(arrS[j]).find("img").attr("src",jsonReturn[j]["path"]);
                    }
                    //主栏图片部分
                    var arrM = $(".maincontent .item");
                    for( var j=0;j<arrM.length;j++){
                        $(arrM[j]).find("a").attr("href",jsonReturn[j]["url"]);
                        $(arrM[j]).find(".c").text(jsonReturn[j]["comment"]);
                        $(arrM[j]).find("img").attr("src",jsonReturn[j]["path"]);
                    }
                });

        //速报
        $.post("${ctxPath}/subao/subaoAja",
                {
                    page:1,
                    rows:"5"
                },
                function(data,status){
                    var result= '';
                    var temp = '';
                    var in1 = '';
                    var collapsed = '';
                    var aria_expanded='';
                    var jsonReturn = JSON.parse(data).rows;

                    for(var i=0;i<jsonReturn.length;i++){
                        if(i==0){    //我曹  写成了i=0 下面也是  结果只能显示最后一项
                            temp='One';
                            in1='in';
                            collapsed='';
                            aria_expanded='true';
                        }
                        if(i==1){
                            temp='Two';
                            in1='';
                            collapsed = 'class="collapsed"';
                            aria_expanded='false';
                        }
                        if(i==2){
                            temp='Three';
                            in1='';
                            collapsed = 'class="collapsed"';
                            aria_expanded='false';
                        }
                        if(i==3){
                            temp='Four';
                            in1='';
                            collapsed = 'class="collapsed"';
                            aria_expanded='false';
                        }
                        if(i==4){
                            temp='Five';
                            in1='';
                            collapsed = 'class="collapsed"';
                            aria_expanded='false';
                        }

                        result += '<div class="panel"><div id="collapse'+temp+'" class="panel-collapse collapse '+in1+'" role="tabpanel" aria-labelledby="heading'+temp+'"><div ><a href="'+
                                jsonReturn[i]["url"]+
                                '" target="_blank"><img src="'+
                                jsonReturn[i]["path"]+
                                '" style="width:100%;height:100px;"></a></div></div><div  role="tab" id="heading'+temp+'"><span class="sequence">'+
                                (1+i)+
                                '</span><a '+collapsed+' role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse'+temp+'" aria-expanded="'+aria_expanded+'" aria-controls="collapse'+temp+'" style="text-decoration:none;">'+
                                jsonReturn[i]["content"]+
                                '</a></div></div>';

                    }
                    $('#accordion').append(result);

                });

        //补番
        $.post("${ctxPath}/bufan/bufanAja",
                {
                    page:1,
                    rows:"10"
                },
                function(data,status){
                    var result= '';
                    var jsonReturn = JSON.parse(data).rows;
                    for(var i=0;i<jsonReturn.length;i++){
                        //<li><span class="rank">2</span><a href="" target="_blank"> 美版「黑色小本本」电影预告公开惹~ ，L全程黑脸！！！ </a></li>
                        result += '<li><span class="rank">'+(i+1)+'</span><a href="'+ jsonReturn[i]["url"]+'" target="_blank" title="'+jsonReturn[i]["content"]+'"> '+jsonReturn[i]["content"]+'</a></li>';
                    }
                    $('.bfb ul').append(result);
                });
    }

</script>

</body>
</html>
