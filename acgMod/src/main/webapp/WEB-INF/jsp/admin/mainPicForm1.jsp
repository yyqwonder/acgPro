<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/taglib.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form:form action="${ctxPath}/mainPic/save" modelAttribute="mainPic" method="post" enctype="multipart/form-data">
        <form:hidden path="id"/>

        <div>
            <label>作者：</label>
            <form:input path="author" htmlEscape="false" maxlength="32" />
        </div>

        <div>
            <label>分类：</label>
            <form:input path="classification" htmlEscape="false" maxlength="32" />
        </div>

        <div>
            <label>时间：</label>
            <form:input path="time" htmlEscape="false" maxlength="32" />
        </div>

        <div>
            <label>内容：</label>
            <form:input path="content" htmlEscape="false" maxlength="32" />
        </div>

        <div>
            <input type="file" name="file">
        </div>

        <div>
            <input id="btnSubmit" type="submit" value="保 存"/>&nbsp;
            <input id="btnCancel" type="button" value="返 回" onclick="history.go(-1)"/>
        </div>

        <img src="${ctxPath}/upload/user1.gif"/>

    </form:form>
</body>
</html>
