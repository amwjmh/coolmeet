<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <%@include file="/WEB-INF/ico.jsp"%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tail.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css"/>
    </head>
    <body>
        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>
        <div class="page-content">
            <div class="content-nav">
                个人中心 >取消会议
            </div>
            <form action="${pageContext.request.contextPath}/mybookings/determine" method="post">
                <div class="fieldContainer">
                    <div class="formRow">
                        <div class="label">
                            <label for="description">会议名称:</label>
                        </div>
                        <div class="field">
                            <h4 style="margin-top: 7px">${single.meetingname}</h4>
                        </div>
                    </div>
                    <div class="formRow">
                        <div class="label">
                            <label for="description">取消原因:</label>
                        </div>
                        <div class="field">
                            <textarea id="description" maxlength="200" rows="5" cols="60" placeholder="200字以内的文字描述" name="description"></textarea>
                        </div>
                    </div>
                    <div class="signupButton">
                        <input type="hidden" name="meetingid" value="${single.meetingid}">
                        <input type="submit" value="确认" class="clickbutton">
                        <input type="button" class="clickbutton" value="返回" onclick="window.history.back();"/>
                    </div>
                </div>
            </form>
        </div>
        </div>
        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>