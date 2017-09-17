<%--
  Created by IntelliJ IDEA.
  User: yyq
  Date: 2017/9/15
  Time: 5:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  pageEncoding="utf-8" %>
<%@ include file="/WEB-INF/jsp/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>音乐FM</title>
    <link rel="stylesheet" href="${ctxStatic}/css/style.css"/>
    <script src="${ctxStatic}/js/jquery172.js"></script>
</head>
<body>

<div id="background"></div>
<div id="player">
    <div class="cover"></div>
    <div class="ctrl">
        <div class="tag">
            <strong>Title</strong>
            <span class="artist">Artist</span>
            <span class="album">Album</span>
        </div>
        <div class="control">
            <div class="left">
                <div class="rewind icon"></div>
                <div class="playback icon"></div>
                <div class="fastforward icon"></div>
            </div>
            <div class="volume right">
                <div class="mute icon left"></div>
                <div class="slider left">
                    <div class="pace"></div>
                </div>
            </div>
        </div>
        <div class="progress">
            <div class="slider">
                <div class="loaded"></div>
                <div class="pace"></div>
            </div>
            <div class="timer left">0:00</div>
            <div class="right">
                <div class="repeat icon"></div>
                <div class="shuffle icon"></div>
            </div>
        </div>
    </div>
</div>
<ul id="playlist"></ul>
<footer>

</footer>
<script src="${ctxStatic}/js/jquery-ui-1.8.17.custom.min.js"></script>
<script src="${ctxStatic}/js/script.js"></script>
</body>
</html>