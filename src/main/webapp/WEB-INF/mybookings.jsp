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
                    个人中心 > 我的预定
                </div>
                <table class="listtable" class="listtable" cellpadding="0" cellspacing="0">
                    <caption>我预定的会议：</caption>
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
                    <c:forEach var="item" items="${mymeeting}">
                        <tr>
                            <td>${item.meetingname}</td>
                            <td>${item.meetingroom.roomname}</td>
                            <td>${item.starttime}</td>
                            <td>${item.endtime}</td>
                            <td>${item.reservationtime}</td>
                            <td>
                                <c:if test="${item.status == '1'}">
                                    <a class="clickbutton" href="${pageContext.request.contextPath}/mybookings/jumpcancelmeeting?meetingid=${item.meetingid}">撤消</a>
                                </c:if>

                                <c:if test="${item.status != '1'}">
                                    <a class="clickbutton">已撤消</a>
                                </c:if>
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