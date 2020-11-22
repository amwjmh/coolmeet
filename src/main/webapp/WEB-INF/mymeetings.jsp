<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <<%@include file="/WEB-INF/ico.jsp"%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tail.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css"/>
    </head>
    <body>
        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>
            <div class="page-content">
                <div class="content-nav">
                    个人中心 > 我的会议
                </div>
                <table class="listtable" class="listtable" cellpadding="0" cellspacing="0">
                    <caption>我将参加的会议：</caption>
                    <thead>
                        <tr class="listheader">
                            <th>会议名称</th>
                            <th>会议室名称</th>
                            <th>会议开始时间</th>
                            <th>会议结束时间</th>
                            <th>会议预定时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${mymeetings}">
                        <tr>
                            <td>${item.meetingname}</td>
                            <td>${item.meetingroom.roomname}</td>
                            <td>${item.starttime}</td>
                            <td>${item.endtime}</td>
                            <td>${item.reservationtime}</td>
                            <td>
                                <a class="clickbutton" href="${pageContext.request.contextPath}/searchmeetings/participatingemployees?meetingid=${item.meetingid}">参与员工</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>