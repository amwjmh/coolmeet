<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>CoolMeeting会议管理系统</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css"/>
    </head>
    <body>
        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>
            <div class="page-content">
                <div class="content-nav">
                    个人中心 > <a href="notifications">最新通知</a>
                </div>
                <table class="listtable">
                    <caption>
                        未来7天我要参加的会议:
                    </caption>
                    <tr class="listheader">
                        <th style="width:300px">会议名称</th>
                        <th>会议室</th>
                        <th>起始时间</th>
                        <th>结束时间</th>
                        <th style="width:100px">操作</th>
                    </tr>
                    <tr>
                        <td>三季度销售总结会</td>
                        <td>第一会议室</td>
                        <td>2013-11-20 9：00</td>
                        <td>2013-11-20 11：00</td>
                        <td>
                            <a class="clickbutton" href="meetingdetails.jsp">查看详情</a>
                        </td>
                    </tr>
                </table>
                <table class="listtable">
                    <caption>
                        已取消的会议:
                    </caption>
                    <tr class="listheader">
                        <th style="width:300px">会议名称</th>
                        <th>会议室</th>
                        <th>起始时间</th>
                        <th>结束时间</th>
                        <th>取消原因</th>
                        <th style="width:100px">操作</th>
                    </tr>
                    <tr>
                        <td>三季度销售总结会</td>
                        <td>第一会议室</td>
                        <td>2013-11-20 9：00</td>
                        <td>2013-11-20 11：00</td>
                        <td>人员出差</td>
                        <td>
                            <a class="clickbutton" href="meetingdetails.jsp">查看详情</a>
                        </td>
                    </tr>
                   
                </table>
                
            </div>
        </div>
        <%@include file="tail.jsp"%>
    </body>
</html>