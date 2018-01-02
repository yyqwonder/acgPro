<%--
  Created by IntelliJ IDEA.
  User: yyq
  Date: 2017/12/22
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css" />

    <style>
        body{
            margin-left:auto;
            margin-right:auto;
            margin-TOP:100PX;
            width:20em;
        }
    </style>
</head>

<body>
    <h1 class="page-header">用户登录</h1>
    <form name="loginForm" action="login" method="post">

        <!--下面是用户输入框-->
        <div class="input-group input-group-md">
            <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
            <input type="text" name="userName" class="form-control" placeholder="用户名" aria-describedby="sizing-addon1">
        </div>
        <br>
        <!--下面是密码输入框-->
        <div class="input-group input-group-md">
            <span class="input-group-addon" id="sizing-addon2"><span class="glyphicon glyphicon-lock"></span></span>
            <input type="password" name="password" class="form-control" placeholder="密码" aria-describedby="sizing-addon2">
        </div>
        <br>
        <!--下面是登陆按钮,包括颜色控制-->
        <button type="button" class="btn btn-default" style=" margin-left:auto;margin-right:auto;" onclick="submitFun();">登 录</button>
        <br>
        ${msg}

    </form>


    <script type="text/javascript">
        function submitFun(){
            loginForm.submit();
        }
    </script>
</body>

</html>
