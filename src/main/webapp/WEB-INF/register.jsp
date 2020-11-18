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

        <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
        </script>
    </head>
    <body>
    <script>
           function registered(form){
               if(form.employeename.value==''){
                   alert("姓名不能为空！");
                   // $("#ang").text("");
                   form.employeename.focus();
                   return false;
               }
               if(form.username.value=='') {
                   alert("用户名不能为空！");
                   // $("#caveatone").text("用户名不能为空！");
                   form.username.focus();
                   return false;
               }

               if(form.password.value==''){
                   alert("密码不能为空！");
                   // $("#caveattwo").text("密码不能为空！");
                   form.password.focus();
                   return false;
               }
               if(form.password.value.length<6){
                   alert("密码至少为6位，请重新输入！");
                   // $("#caveattwo").text("密码至少为6位，请重新输入！");
                   form.password.focus();
                   return false;
               }
               if(form.password.value!=form.confirm.value) {
                   alert("密码不一致！");
                   // $("#caveattwo").text("密码不一致！");
                   form.confirm.focus();
                   return false;
               }

               var fatr = false;
               $.ajax({
                   url:"${pageContext.request.contextPath}/management/determineUsernameExists", // 请求路径
                   type:"POST" , //请求方式
                   async:false,//同步方式
                   cache:false,//禁止缓存
                   dataType:"text",//设置接受到的响应数据的格式
                   data:{
                       username:$("#username").val()
                   },
                   //响应成功后的回调函数
                   success:function (data){
                       if(data == "exist"){
                           alert("用户已存在。");
                           fatr = false;
                       }else {
                           alert("注册成功。");
                           fatr = true;
                       }
                   },
               });

               return fatr;
           }

    </script>
        <%@include file="top.jsp"%>
    <%@include file="leftmenubar.jsp"%>

    <div class="page-content">
        <div class="content-nav">人员管理 > 员工注册</div>
        <form method="post" id="signupForm" action="${pageContext.request.contextPath}/management/addEmployee" name="form" onsubmit="return registered(this);" >
            <div class="fieldContainer">
                <div class="formRow">
                    <div class="label">
                        <label for="employeename">姓名:</label>
                    </div>
                    <div class="field">
                        <input type="text" name="employeename" maxlength="5" id="employeename">
                    </div>
                </div>

                <div class="formRow">
                    <div class="label">
                        <label for="username">账户名:</label>
                    </div>
                    <div class="field">
                        <input type="text" name="username" maxlength="20" id="username">
                    </div>
                </div>

                <div class="formRow">
                    <div class="label">
                        <label for="password">密码:</label>
                    </div>
                    <div class="field">
                        <input type="password" name="password" maxlength="20"id="password">
                    </div>
                </div>

                <div class="formRow">
                    <div class="label">
                        <label for="confirm">确认密码:</label>
                    </div>
                    <div class="field">
                        <input type="password" maxlength="20" id="confirm">
                    </div>
                </div>

                <div class="formRow">
                    <div class="label">
                        <label for="phone">联系电话:</label>
                    </div>
                    <div class="field">
                        <input type="text" name="phone" maxlength="11" id="phone">
                    </div>
                </div>

                <div class="formRow">
                    <div class="label">
                        <label for="email">邮箱:</label>
                    </div>
                    <div class="field">
                        <input type="text" name="email" maxlength="20" id="email">
                    </div>
                </div>

                <div class="formRow">
                    <div class="label">
                        <label for="departmentid">所在部门:</label>
                    </div>
                    <div class="field">
                        <select id="departmentid" name="departmentid">
                            <c:forEach var="item" items="${departments}" >
                                <option value="${item.departmentid}">${item.departmentname}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="signupButton">
                    <input type="submit"  id="submit" value="注册">
                </div>
            </div>
        </form>
    </div>


    <%--<%@include file="tail.jsp"%>--%>
    </body>
</html>