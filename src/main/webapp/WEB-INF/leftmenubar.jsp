<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-body">
    <div class="page-sidebar">
        <div class="sidebar-menugroup">
            <div class="sidebar-grouptitle">个人中心</div>
            <ul class="sidebar-menu">
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/notifications/notice">最新通知</a></li>
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/mybookings/myreservation">我的预定</a></li>
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/jumpmymeetings">我的会议</a></li>
            </ul>
        </div>
        <div class="sidebar-menugroup">
            <div class="sidebar-grouptitle">人员管理</div>
            <ul class="sidebar-menu">
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/management/employeeRegistration">员工注册</a></li>
                <%--判断是否管理员--%>
                <c:if test="${judgment.role=='2'}">
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/admin/jumpdepartment">部门管理</a></li>
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/admin/approveaccount">注册审批</a></li>
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage=1&status=1">搜索员工</a></li>
                </c:if>
            </ul>
        </div>
        <div class="sidebar-menugroup">
            <div class="sidebar-grouptitle">会议预定</div>
            <ul class="sidebar-menu">
                <c:if test="${judgment.role=='2'}">
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/admin/jumpaddroom">添加会议室</a></li>
                </c:if>
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/conferenceromm/jumpviewconferenceromm">查看会议室</a></li>
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/scheduledmeeting/jumpbookmeeting">预定会议</a></li>
                <li class="sidebar-menuitem"><a href="${pageContext.request.contextPath}/searchmeetings/jumpsearchmeetings?currentPage=1">搜索会议</a></li>
            </ul>
        </div>
    </div>
<%--左边菜单栏--%>