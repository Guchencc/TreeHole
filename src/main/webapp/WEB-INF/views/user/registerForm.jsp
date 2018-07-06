<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/6/30
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Create Account</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/bootstrap-theme.min.css"/>" rel="stylesheet" type="text/css">
    <link href="<c:url value="/css/templatemo_style.css"/>" rel="stylesheet" type="text/css">


</head>
<body class="templatemo-bg-gray">
<h1 class="margin-bottom-15">Create Account</h1>
<div class="container">
    <div class="col-md-12">
        <sf:form id="registerForm"  class="form-horizontal templatemo-create-account templatemo-container" role="form" commandName="registerBean" method="post">
            <div class="form-inner">
                <div class="form-group">
                    <div class="col-md-12">
                        <label for="username" class="control-label">账户名:</label>
                        <sf:input path="username" class="form-control" id="username" name="username" placeholder="" />
                        <sf:errors path="username"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label for="password" class="control-label">设置密码:</label>
                        <sf:input path="password" class="form-control" id="password" name="password" placeholder="" />
                        <sf:errors path="password"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label for="repeatPwd" class="control-label">再次输入密码:</label>
                        <sf:input path="repeatPwd" class="form-control" id="repeatPwd" name="repeatPwd" placeholder="" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label for="nickname" class="control-label">昵称:</label>
                        <sf:input path="nickname" class="form-control" id="nickname" name="nickname" placeholder="" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-6">
                        <label for="email" class="control-label">Email</label>
                        <sf:input path="email" class="form-control" id="email" name="email" placeholder="" />
                    </div>
                    <div class="col-md-6 templatemo-radio-group">
                        <label class="radio-inline">
                            <sf:radiobutton path="gender" name="gender" id="gender_m" value="1" /> Male
                        </label>
                        <label class="radio-inline">
                            <sf:radiobutton path="gender" name="gender" id="gender_f" value="0"/> Female
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <label for="birthday" class="control-label">生日:</label>
                        <sf:input path="birthday" type="date" class="form-control" id="birthday" name="birthday" placeholder="" />
                        <sf:errors path="birthday"/>
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-md-12">
                        <label><input type="checkbox">I agree to the <a href="javascript:;" data-toggle="modal" data-target="#templatemo_modal">Terms of Service</a> and <a href="#">Privacy Policy.</a></label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="submit" value="Create account" class="btn btn-info">
                        <a href="<c:url value="/login"/>" class="pull-right">Login</a>
                    </div>
                </div>
            </div>
        </sf:form>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="templatemo_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">Terms of Service</h4>
            </div>
            <div class="modal-body">
                <p>This form is provided by <a rel="nofollow" href="http://www.cssmoban.com/page/1">Free HTML5 Templates</a> that can be used for your websites. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
                <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                <p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>