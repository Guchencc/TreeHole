<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/6/30
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TreeHole</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="<c:url value="/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/templatemo_style.css"/>" rel="stylesheet" type="text/css">
    <script src="<c:url value="/js/jquery-3.2.1.js"/>"></script>
    <script>
        $(document).ready(function () {
            $("#loginBtn").bind("click",function () {
                $.post("<c:url value="/login"/>",{
                    username:$("#username").val(),
                    password:$("#password").val()
                }, function (data) {
                    if(data=="failed"){
                        alert("验证失败，请重新登录!");
                    }else if(data=="success"){
                        window.location.href="<c:url value="/home" />";
                    }
                })
            })

            $("#backBtn").bind("click",function () {
                window.location.href="${pageContext.request.contextPath}/home";
            })

        })
    </script>
</head>
<body class="templatemo-bg-gray">
<div class="container " >
    <div class="col-md-12">
        <h1 class="margin-bottom-15">登录</h1>
        <form  id="loginForm" class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30" role="form" method="post" action="<c:url value="/login" />">
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="control-wrapper">
                        <label for="username" class="control-label fa-label"><i class="fa fa-user fa-medium"></i></label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Username">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <label for="password" class="control-label fa-label"><i class="fa fa-lock fa-medium"></i></label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="checkbox control-wrapper">
                        <label>
                            <input type="checkbox"> Remember me
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <div class="control-wrapper">
                        <input id="loginBtn" type="button" value="登录" class="btn btn-info">
                        <input id="backBtn" type="button" value="返回" class="btn btn-default">
                        <a href="#" class="text-right pull-right">Forgot password?</a>
                    </div>
                </div>
            </div>
            <hr>
        </form>
        <div class="text-center">
            <a href="<c:url value="/register"/>" class="templatemo-create-new">Create new account <i class="fa fa-arrow-circle-o-right"></i></a>
        </div>
    </div>
</div>

</body>
</html>
