<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/tail.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css"/>
        <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    </head>
    <body>
    <script>
        <%--跳转页--%>
        $(document).ready(function(){
        $("#jump").click(function () {
            alert("${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage="+$("#pagenum").val());

                window.location.href = "${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage="+$("#pagenum").val();
            });
        });
    </script>

        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>
        <div class="page-content">
            <div class="content-nav">
                会议预定 > 搜索员工
            </div>

            <form action="${pageContext.request.contextPath}/admin/jumpsearchemployees">
                <div class="fieldContainer">
                    <div class="searchformRow">
                        <div class="label">
                            <label for="employeename">姓名:</label>
                        </div>
                        <div class="field">
                            <input type="text" id="employeename" name="employeename" <c:if test="${feedback!=null}">value="${feedback.employeename}" </c:if> maxlength="20"/>
                        </div>
                    </div>
                    <div class="searchformRow">
                        <div class="label">
                            <label for="username">账号名:</label>
                        </div>
                        <div class="field">
                            <input type="text" id="username" name="username" <c:if test="${feedback!=null}">value="${feedback.username}" </c:if> maxlength="20" />
                        </div>
                    </div>

                    <div class="searchformRow">
                        <div class="label">
                            <label>当前状态:</label>
                        </div>
                        <div class="field">



                            <c:if test="${feedback.status == null || feedback.status == 1}">

                                    <input type="radio"  name="status" value="1" checked="checked"/><label>已批准</label>
                                    <input type="radio"  name="status" value="0"/><label>待审批</label>
                                    <input type="radio"  name="status" value="-1"/><label>已关闭</label>

                            </c:if>


                                <c:if test="${feedback.status == 0}">
                                    <input type="radio"  name="status" value="1"><label>已批准</label>
                                    <input type="radio"  name="status" value="0" checked="checked"/><label>待审批</label>
                                    <input type="radio"  name="status" value="-1"/><label>已关闭</label>
                                </c:if>

                                <c:if test="${feedback.status == -1}">
                                    <input type="radio"  name="status" value="1"><label>已批准</label>
                                    <input type="radio"  name="status" value="0"/><label>待审批</label>
                                    <input type="radio"  name="status" value="-1" checked="checked"/><label>已关闭</label>
                                </c:if>

                        </div>
                    </div>


                    <div class="searchsignupButton">
                        <input type="submit" class="clickbutton" value="查询"/>
                        <input type="reset" class="clickbutton" value="重置"/>
                    </div>
                </div>
            </form>

            <table class="listtable" cellpadding="0" cellspacing="0">
                <caption>所有部门:</caption>

                <thead>
                <tr class="listheader">
                    <th>姓名</th>
                    <th>账号名</th>
                    <th>联系电话</th>
                    <th>电子邮件</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <C:forEach var="item" items="${pagebean.list}">
                    <tr>
                        <td>${item.employeename}</td>
                        <td>${item.username}</td>
                        <td>${item.phone}</td>
                        <td>${item.email}</td>
                        <td>
                            <a class="clickbutton" href="${pageContext.request.contextPath}/admin/close?employeeid=${item.employeeid}">关闭账号</a>

                        </td>
                    </tr>
                </C:forEach>
                </tbody>
            </table>


            <div class="result">
                <div class="pager-header">
                    <div class="header-info">
                        共<span class="info-number"><strong><i>${pagebean.totalCount}</i></strong></span>条结果，
                        分成<span class="info-number"><strong><i>${pagebean.totalPage}</i></strong></span>页显示，
                        当前第<span class="info-number"><strong><i>${pagebean.currentPage}</i></strong></span>页
                    </div>


                    <div class="header-nav">
                        <a href="${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage=1" class="clickbutton">首页</a>
                        <a href="${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage=${pagebean.currentPage-1}" class="clickbutton">上页</a>
                        <a href="${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage=${pagebean.currentPage+1}" class="clickbutton">下页</a>
                        <a href="${pageContext.request.contextPath}/admin/jumpsearchemployees?currentPage=${pagebean.totalPage}" class="clickbutton">末页</a>
                        跳到第<input type="text" id="pagenum"  onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" class="nav-number"/>页
                        <input id="jump" type="button" class="clickbutton" value="跳转"/>
                    </div>
                </div>
            </div>

        </div>
        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>