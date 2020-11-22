<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-header">

        <div class="header-banner">
            <img src="${pageContext.request.contextPath}/images/header.png" alt="CoolMeeting"/>
        </div>
        <div class="header-title">
            <h1>欢迎访问Cool-Meeting会议管理系统</h1>
        </div>

    <div class="header-quicklink">
        <i>欢迎您，</i>
        <strong>${judgment.getEmployeename()}</strong>

            <a href="${pageContext.request.contextPath}/jumpchangepassword">[修改密码]</a>
            <a href="${pageContext.request.contextPath}/dropout">[退出]</a>
    </div>
</div>
<%--头部模块--%>