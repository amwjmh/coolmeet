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
                    个人中心 > <a href="notifications">最新通知</a>
                </div>
                <table class="listtable" class="listtable" cellpadding="0" cellspacing="0">
                    <caption>
                        未来7天我要参加的会议:
                    </caption>
                    <thead>
                        <tr class="listheader">
                            <th>会议名称</th>
                            <th>会议室</th>
                            <th>起始时间</th>
                            <th>结束时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <c:forEach var="item" items="${meetingdata}">
                        <tr>
                            <td>${item.meetingname}</td>
                            <td>${item.meetingroom.roomname}</td>
                            <td>${item.starttime}</td>
                            <td>${item.endtime}</td>
                            <td>
                                <a class="clickbutton" href="meetingdetails.jsp">查看详情</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <table class="listtable" class="listtable" cellpadding="0" cellspacing="0">
                    <caption>
                        已取消的会议:
                    </caption>
                    <thead>
                        <tr class="listheader">
                            <th>会议名称</th>
                            <th>会议室</th>
                            <th>起始时间</th>
                            <th>结束时间</th>
                            <th>取消原因</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${meetingdata1}">
                        <tr>
                            <td>${item.meetingname}</td>
                            <td>${item.meetingroom.roomname}</td>
                            <td>${item.starttime}</td>
                            <td>${item.endtime}</td>
                            <td>${item.description}</td>
                            <td>
                                <a class="clickbutton" href="meetingdetails.jsp">查看详情</a>
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