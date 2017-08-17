<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/taglib.jsp" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>yyq_bootstrp</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css"/>
    <style type="text/css">
        body {
            padding-top: 40px;
        }

        a:hover {
            text-decoration: none;
            cursor: pointer;
            color: #F6F
        }

        .navbar {
            min-height: 40px;
            height: 40px;
        }

        .navbar-nav > li > a {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .navbar-toggle {
            margin-top: 4px;
            margin-bottom: 4px;
        }

        .weibo {
            background: url(${ctxStatic}/pic/weibo.png) no-repeat;
            padding-left: 20px;
        }

        .wechat {
            background: url(${ctxStatic}/pic/wechat.png) no-repeat;
            padding-left: 20px;
        }

        .nav_178 {
            background: url(${ctxStatic}/pic/nav.png) no-repeat;
            padding-left: 20px;
        }

        .myWrapper {
            background: url(${ctxStatic}/pic/head-bg-img.jpg) no-repeat center top;
        }

        .logo {
            height: 220px;
        }

        .logo-png {
            position: absolute;
            top: 40%;
            margin-left: -30px;
        }

        .logo-gif {
            position: absolute;
            top: 20%;
            margin-left: 116px;
        }

        .headline {
            background: url(/static/pic/nav-bg-img.jpg) no-repeat;
        }

        .navbar-myform {
            margin-top: 2px;
            margin-bottom: 2px;
        }

        .sidecontent {
            background: url(/static/pic/mc-line.png) 164px top no-repeat;
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
            left: 6px;
            width: 5px;
            height: 336px;
            background-color: #F9F;
        }

        .carousel-caption {
            width: 100%;
            bottom: 0px;
            left: 0%;
            right: 0%;
        }

        .latestcontent {
            height: 400px;
        }

        .subao, .activity-info, .zhuanti, .cosplay, .tcb {
            border: 1px solid #e2e2e2;
            border-radius: 3px;
        }

        .latesticon {
            position: relative;
            top: -4px;
            background: #ff84bb;
            width: 6px;
            height: 6px;
            display: inline-block;
            border-radius: 50%;
        }

        .allcontent img {
            width: 100%;
        }

        .allcontent .col-md-4 {
            margin-bottom: 18px;
        }

        .eachcontent {
            border: 1px solid #e6e6e6;
        }

        .allcontent .textbox {
            padding: 27px 20px 20px;
            width: 100%;
            height: 95px;
        }

        .allcontent .labelbox {
            font-size: 12px;
            text-align: right;
            font-size: 12px;
            position: relative;
            padding: 0px 20px;
            bottom: 10px;
        }

        .allcontent .labelbox span {
            border: 1px solid #ff84bb;
            border-radius: 9px;
            padding: 0px 10px 0px 10px;
            color: #ff84bb;
            position: absolute;
            left: 20px;
        }

        .activity-content p {
            padding: 0 18px;
            background-color: black;
            color: white;
            line-height: 30px;
            font-size: 14px;
            text-align: center;
            position: absolute;
            bottom: -10px;
            height: 30px;
        }

        .title {
            margin: 10px;
        }

        .tcb .rank {
            height: 15px;
            width: 15px;
            border-radius: 10px;
            background-color: #CCF;
            font-size: 10px;
            color: #000;
        }

        .tcb li {
            line-height: 30px;
            height: 30px;
            overflow: hidden;
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
            <ul class="nav navbar-nav">
                <li><a href="#">yyq首页 </a></li>
                <li class="dropdown nav_178"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                aria-haspopup="true" aria-expanded="false">导航</a>
                    <ul class="dropdown-menu">
                        <li><a href="#">新闻资讯保</a></li>
                        <li><a href="#">动漫频道</a></li>
                        <li><a href="#">游戏</a></li>
                        <li><a href="#">社区</a></li>
                    </ul>
                </li>
                <li class="weibo"><a href="#">新浪微博</a></li>
                <li class="wechat"><a href="#">关注微信</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="myWrapper">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 logo"><img class="logo-png" src="${ctxStatic}/pic/head-logo.png"> <img class="logo-gif"
                                                                                                        src="${ctxStatic}/pic/head-logo.gif">
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
                                <ul class="nav navbar-nav">
                                    <li class="item"><a href="http://acg.178.com" target="_blank">首页 </a></li>
                                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                            role="button" aria-haspopup="true" aria-expanded="false">动漫情报 </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">国产动画/漫画</a></li>
                                            <li><a href="#">动画/漫画情报</a></li>
                                            <li><a href="#">真人/舞台剧</a></li>
                                            <li><a href="#">广播剧/轻小说/杂志</a></li>
                                            <li><a href="#">音乐/OP/ED/OST</a></li>
                                        </ul>
                                    </li>
                                    <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                                            role="button" aria-haspopup="true" aria-expanded="false">展会活动</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">国内</a></li>
                                            <li><a href="#">国外</a></li>
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
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"><img
                                    class="sideimg" src="${ctxStatic}/pic/1.jpg"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"><img class="sideimg"
                                                                                               src="${ctxStatic}/pic/2.jpg">
                            </li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"><img class="sideimg"
                                                                                               src="${ctxStatic}/pic/3.jpg">
                            </li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"><img class="sideimg"
                                                                                               src="${ctxStatic}/pic/4.jpg">
                            </li>
                            <li data-target="#carousel-example-generic" data-slide-to="4"><img class="sideimg"
                                                                                               src="${ctxStatic}/pic/5.jpg">
                            </li>
                        </ol>
                    </div>
                    <div class="col-xs-2 sidetemperature">
                        <div id="temperature"><span></span></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 maincontent">
                <div>
                    <div class="carousel-inner" role="listbox">
                        <div class="item active"><img src="${ctxStatic}/pic/1.jpg" style="height:400px;">
                            <div class="carousel-caption">
                                <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                    花圃和美少女 彩/画皮手办：这种成人的把戏玩法~让人忍不住想prprprpr....
                                </div>
                            </div>
                        </div>
                        <div class="item"><img src="${ctxStatic}/pic/2.jpg" style="height:400px;">
                            <div class="carousel-caption">
                                <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                    7月新番追哪些？快来看小编们的2017年7月新番推荐（づ￣3￣）づ╭❤～
                                </div>
                            </div>
                        </div>
                        <div class="item"><img src="${ctxStatic}/pic/3.jpg" style="height:400px;">
                            <div class="carousel-caption">
                                <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                    请问您今（光）天（棍）节要来点兔子吗？？新作OVA动画Dear My Sister将上映！
                                </div>
                            </div>
                        </div>
                        <div class="item"><img src="${ctxStatic}/pic/4.jpg" style="height:400px;">
                            <div class="carousel-caption">
                                <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                    国欠妹~2017春季动画各项排名公开，「埃罗芒阿老师」全面制霸！
                                </div>
                            </div>
                        </div>
                        <div class="item"><img src="${ctxStatic}/pic/5.jpg" style="height:400px;">
                            <div class="carousel-caption">
                                <div style="background-color:black;position:absolute;bottom:0px;left:0px;right:0px;">
                                    芳文大法好！！！漫画「Comic Girls」（こみっくがーるず）TV动画化决定！
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 latestcontent">
                <div class="subao">
                    <div class="title"><img src="${ctxStatic}/pic/zxsb.png"> <span
                            style="font-size:18px;font-weight:700;">速报</span></div>
                    <div class="pre-scrollable" style="height:359px;">
                        <ul style="padding:0px;list-style:none;">
                            <c:forEach items="${subaoList}" var="p">
                                <li><a> <i class="latesticon"></i> ${p.content} </a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--主要内容和边栏 -->
    <div class="container" style="margin-top:18px;">
        <div class="row">
            <!--主要内容-->
            <div class="col-lg-9 allcontent">
                <div class="row">
                    <c:forEach items="${mainPicList}" var="p">
                        <div class="col-md-4">
                            <div class="eachcontent"><img src="${ctxStatic}${p.path}">
                                <p class="textbox">${p.content}</p>
                                <p class="labelbox"><span>${p.classification}</span>${p.author}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!--边栏-->
            <div class="col-lg-3">
                <!--戳我-->
                <a style="height:75px;margin-bottom:5px;display:block;"> <img src="${ctxStatic}/pic/chuowo.png"
                                                                              style="width:100%;"> </a>
                <!--活动信息-->
                <div class="activity-info" style="margin-bottom:15px;">
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
                </div>
                <!--专题-->
                <div class="zhuanti">
                    <div class="title"><img src="${ctxStatic}/pic/zt.png"> <span
                            style="font-size:18px;font-weight:700;">专题</span></div>
                    <div class="zhuanti-content" style="padding:0 10px;">
                        <ul style="padding:0px;list-style:none;">
                            <li>
                                <div class="dtzt"
                                     style="height:120px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                        src="${ctxStatic}/pic/ctlw.jpg"
                                        style="width:100%;height:100px;position:relative;top:0px;"> </a>
                                    <p style="position:absolute;top:100px;white-space:nowrap; text-overflow:ellipsis;">
                                        浅析成田良悟：走钢丝的黑色幽默轻小说~</p>
                                </div>
                            </li>
                            <li>
                                <div class="dtzt"
                                     style="height:20px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                        src="${ctxStatic}/pic/xhc.jpg"
                                        style="width:100%;height:100px;position:relative;top:-100px;"> </a>
                                    <p style="position:absolute;top:0px;white-space:nowrap; text-overflow:ellipsis;">
                                        【人物专题】你了解新海诚吗？</p>
                                </div>
                            </li>
                            <li>
                                <div class="dtzt"
                                     style="height:20px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                        src="${ctxStatic}/pic/xf.jpg"
                                        style="width:100%;height:100px;position:relative;top:-100px;"> </a>
                                    <p style="position:absolute;top:0px;white-space:nowrap; text-overflow:ellipsis;">
                                        你已经决定要追哪几部新番了吗？</p>
                                </div>
                            </li>
                            <li>
                                <div class="dtzt"
                                     style="height:20px;position:relative;overflow:hidden;margin-bottom:10px;"><a> <img
                                        src="${ctxStatic}/pic/kjj.jpg"
                                        style="width:100%;height:100px;position:relative;top:-100px;"> </a>
                                    <p style="position:absolute;top:0px;white-space:nowrap;text-overflow:ellipsis;">
                                        讲真，你想喝喝谁的「口嚼酒」啊？？？</p>
                                </div>
                            </li>
                            <li>
                                <div class="dtzt"
                                     style="height:20px;height:100px;position:relative;overflow:hidden;margin-bottom:10px;">
                                    <a> <img src="${ctxStatic}/pic/dadang.jpg"
                                             style="width:100%;height:100px;position:relative;top:-100px;"> </a>
                                    <p style="position:absolute;top:0px;white-space:nowrap;text-overflow:ellipsis;">
                                        你愿意选谁作为你的异次元搭档呢？？</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <!--cosplay-->
                <div class="cosplay" style="margin-top:15px;">
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
                </div>

                <!--吐槽榜-->
                <div class="tcb" style="margin-top:15px;">
                    <div class="title"><img src="${ctxStatic}/pic/tcb.png"> <span
                            style="font-size:18px;font-weight:700;">吐槽榜</span></div>
                    <ul style="padding:10px;list-style:none;">
                        <li><span class="rank">1</span><a title="伪娘X女大学生，「裙下有野兽」接档「秃驴走肾不走心」 ">
                            伪娘X女大学生，「裙下有野兽」接档「秃驴走肾不走心」</a></li>
                        <li><span class="rank">2</span><a> 美版「黑色小本本」电影预告公开惹~ ，L全程黑脸！！！ </a></li>
                        <li><span class="rank">3</span><a> 《擅长捉弄的高木同学》作者·山本崇一郎画了不夜城的assassin？？？ </a></li>
                        <li><span class="rank">4</span><a> ALICE OR ALICE~妹控哥哥与双胞胎妹妹~ 将有重大发表！！！ </a></li>
                        <li><span class="rank">5</span><a> 「银魂」松阳老师场面曝光，在电影中松阳老师的配音也是由山寺宏一担任！ </a></li>
                        <li><span class="rank">6</span><a> 「你的名字」小说版漫画化啦！ </a></li>
                        <li><span class="rank">7</span><a> 请问您今天要来点兔子吗？完全新作OVA动画确定将在今年光棍节上映！！！s </a></li>
                        <li><span class="rank">8</span><a> Production I.G制作的漫改动画「寻找身体」将于7月31日配信。 </a></li>
                        <li><span class="rank">9</span><a> 『舞动青春』第4弹视觉图，7月8日开播~ </a></li>
                        <li><span class="rank">10</span><a> 「食戟之灵」第三季制作决定 </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="${ctxStatic}/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".dtzt").hover(function () {
            $(this).animate({height: '120px'});
            $(this).find("img").animate({top: '0px'});
            $(this).find("p").animate({top: '100px'});
            $(this).parent().siblings().find(".dtzt").height(20);
            $(this).parent().siblings().find(".dtzt").find("img").css("top", "-100px");
            $(this).parent().siblings().find(".dtzt").find("p").css("top", "0px");
        });

        setInterval(function () {

                    $("#temperature").height($("#temperature").height() - 83);

                    if ($("#temperature").height() == 0) {
                        $("#temperature").height(336);
                    }
                },
                5000);

        $(".textbox").click(function(){
            $(this).html(function(i,origText){
                return "<input type='text' value="+origText+"/>";
            });
        });

    });
</script>
</body>
</html>
