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
        <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>

    </head>
    <body onload="body_load()">
    <script type="application/javascript">
        function employee(employeeid, employeename){
            this.employeeid = employeeid;
            this.employeename = employeename;
        }
        function department(departmentid, departmentname, employees){
            this.departmentid = departmentid;
            this.departmentname = departmentname;
            this.employees = employees;
        }
        var data = new Array(

            <c:forEach var="department" items="${choicedep}" varStatus="status">
                new department(${department.departmentid},"${department.departmentname}",
                    new Array(
                    <c:forEach var="employee" items="${department.employees}" varStatus="statu">
                        new employee(${employee.employeeid}, "${employee.employeename}")
                    <c:if test="${!statu.last}">,</c:if>
                    <c:if test="${statu.last}"></c:if>
                    </c:forEach>)
                )
            <c:if test="${!status.last}">,</c:if>
            <c:if test="${status.last}"></c:if>
        </c:forEach>
        );


        var selDepartments;
        var selEmployees;
        var selSelectedEmployees;

        function body_load(){
            selDepartments = document.getElementById("selDepartments");
            selEmployees = document.getElementById("selEmployees");
            selSelectedEmployees = document.getElementById("selSelectedEmployees");

            for(var i=0;i<data.length;i++){
                var dep = document.createElement("option");
                dep.value = data[i].departmentid;
                dep.text = data[i].departmentname;
                selDepartments.appendChild(dep);
            }

            fillEmployees();
        }

        function fillEmployees(){
            clearList(selEmployees);
            var departmentid = selDepartments.options[selDepartments.selectedIndex].value;
            var employees;
            for(var i=0;i<data.length;i++){
                if (departmentid == data[i].departmentid){
                    employees = data[i].employees;
                    break;
                }
            }
            for(i=0;i<employees.length;i++){
                var emp = document.createElement("option");
                emp.value = employees[i].employeeid;
                emp.text = employees[i].employeename;
                selEmployees.appendChild(emp);
            }
        }

        function clearList(list){
            while(list.childElementCount > 0){
                list.removeChild(list.lastChild);
            }
        }

        function selectEmployees(){
            for(var i=0;i<selEmployees.options.length;i++){
                if (selEmployees.options[i].selected){
                    addEmployee(selEmployees.options[i]);
                    selEmployees.options[i].selected = false;
                }
            }
        }

        function deSelectEmployees(){
            var elementsToRemoved = new Array();
            var options = selSelectedEmployees.options;
            for(var i=0;i<options.length;i++){
                if (options[i].selected){
                    elementsToRemoved.push(options[i]);
                }
            }
            for(i=0;i<elementsToRemoved.length;i++){
                selSelectedEmployees.removeChild(elementsToRemoved[i]);
            }
        }

        function addEmployee(optEmployee){
            var options = selSelectedEmployees.options;
            var i = 0;
            var insertIndex = -1;
            while(i < options.length){
                if (optEmployee.value == options[i].value){
                    return;
                } else if (optEmployee.value < options[i].value) {
                    insertIndex = i;
                    break;
                }
                i++;
            }
            var opt = document.createElement("option");
            opt.value = optEmployee.value;
            opt.text = optEmployee.text;
            opt.setAttribute("selected",true);

            if (insertIndex == -1){
                selSelectedEmployees.appendChild(opt);
            } else {
                selSelectedEmployees.insertBefore(opt, options[insertIndex]);
            }
        }
    </script>
        <%@include file="top.jsp"%>
        <%@include file="leftmenubar.jsp"%>
        <div class="page-content">
            <div class="content-nav">
                会议预定 > 预定会议
            </div>

            <form action="${pageContext.request.contextPath}/scheduledmeeting/addmeeting" method="post">
                <div class="fieldContainer">
                    <div class="reserve">
                        <div class="label">
                            <label for="meetingname">会议名称:</label>
                        </div>
                        <div class="field">
                            <input type="text" id="meetingname" name="meetingname" maxlength="20"/>
                        </div>
                    </div>

                    <div class="reserve">
                        <div class="label">
                            <label for="numberofparticipants">预计参加人数:</label>
                        </div>
                        <div class="field">
                            <input type="text" id="numberofparticipants" name="numberofparticipants" />
                        </div>
                    </div>

                    <div class="reserve">
                        <div class="label">
                            <label for="starttime">预计开始时间:</label>
                        </div>
                        <div class="field">
                            <%--<input type="date" id="startdate" name=""/>--%>
                            <input type="datetime-local" id="starttime" name="st"/>
                        </div>
                    </div>

                    <div class="reserve">
                        <div class="label">
                            <label for="endtime">预计结束时间:</label>
                        </div>
                        <div class="field">
                            <%--<input type="date" id="enddate" name=""/>--%>
                            <input type="datetime-local" id="endtime" name="et"/>
                        </div>
                    </div>

                    <div class="reserve">
                        <div class="label">
                            <label for="roomid">会议室名称:</label>
                        </div>
                        <div class="field">
                            <select id="roomid" name="roomid">
                                <c:forEach var="meetingroom" items="${choicemee}">
                                    <option value="${meetingroom.roomid}">${meetingroom.roomname}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="reserve">
                        <div class="label">
                            <label for="description">会议说明:</label>
                        </div>
                        <div class="field">
                            <textarea id="description" name="description" rows="5"></textarea>
                        </div>
                    </div>

                    <div class="reserve">
                        <div class="label">
                            <label for="selSelectedEmployees">选择参会人员:</label>
                        </div>
                        <div class="field">

                            <div id="divfrom">
                                <select id="selDepartments" onchange="fillEmployees()">
                                </select>
                                <select id="selEmployees" multiple="true">

                                </select>
                            </div>
                            <div id="divoperator">
                                <input type="button" class="clickbutton" value="&gt;" onclick="selectEmployees()"/>
                                <input type="button" class="clickbutton" value="&lt;" onclick="deSelectEmployees()"/>
                            </div>
                            <div id="divto">
                                <select name="mps" id="selSelectedEmployees" multiple="multiple">
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="signupButton">
                        <input type="hidden" name="reservationistid" value="${judgment.employeeid}">
                        <input type="submit" class="clickbutton" value="预定"/>
                        <input type="reset" class="clickbutton" value="重置"/>
                    </div>

                </div>

            </form>
        </div>
        <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>