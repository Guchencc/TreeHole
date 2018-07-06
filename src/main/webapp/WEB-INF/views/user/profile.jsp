<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/6/30
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>setting</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Great Taste Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" media="all" />
    <link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
    <!-- js -->
    <script src="<c:url value="/js/jquery-1.11.1.min.js"/>"></script>
    <!-- //js -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Great+Vibes' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Comfortaa:400,300,700' rel='stylesheet' type='text/css'>
</head>

<body>
<!-- banner-body -->
<div class="banner-body">
    <div class="container">
        <!--左上-->
        <div class="col-xs-3 banner-body-left">
            <div class="logo">
                <h1><a href="#">Wish <span>Bottle</span></a></h1>
            </div>
            <div class="top-nav">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <!--侧边按钮-->
                    <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                        <nav class="stroke">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href=""><span class="glyphicon glyphicon-pencil">树洞</span></a></li>
                                <li><a href="#" class="hvr-underline-from-left"><span class="glyphicon glyphicon-heart">心愿瓶</span></a></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- /.navbar-collapse -->
                </nav>
            </div>

            <c:if test="${sessionScope.user!=null}">
                <!--log in state-->
                <div class="col-xs-8">
                    <div class="row">
                        <a href="<c:url value="/user/${sessionScope.user.userId}"/>"><img src="<c:url value="/images/co.png"/>" class="img-circle" alt="user image"></a>
                    </div>
                    <div class="row">
                        <a href="<c:url value="/user/${sessionScope.user.userId}"/> " class="hvr-underline-from-left" style="color:#999"><span><c:out value="${sessionScope.user.nickname}" /></span></a></li>
                    </div>
                    <div class="row">
                        <a href="<c:url value="/logout"/>" class="hvr-underline-from-left" style="color:#999"><span>退出</span></a></li>
                    </div>
                </div>
            </c:if>
            <c:if test="${sessionScope.user==null}">
                <!--not log in state-->
                <div class="latest-news">
                    <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                        <nav class="stroke">
                            <ul class="nav navbar-nav">
                                <li><a  href="<c:url value="/login"/>" class="hvr-underline-from-left"><span class="glyphicon glyphicon-plus">登录</span></a></li>
                                <li><a  href="<c:url value="/register"/>" class="hvr-underline-from-left"><span class="glyphicon glyphicon-user">注册</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </c:if>

            <!--bulletin-->
            <div class="col-xs-8">
                <div class="row">
                    <br/>
                    <div class="latest-news">
                        <h2 >公告</h2>
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingOne">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            ①2018-06-09
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                    <div class="panel-body">
                                        今天天气不错，我爱中国我爱中国中国NO1今天天气不错，我爱中国我爱中国中国NO1今天天气不错，我爱中国我爱中国中国NO1
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingTwo">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            ②2018-06-29
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                    <div class="panel-body">
                                        我不爱美国！
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="headingThree">
                                    <h4 class="panel-title">
                                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            ③2018-06-30
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                    <div class="panel-body">
                                        CHINA ABSOLUTELY NO1
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--右上-->
        <div class="col-xs-9 banner-body-right">
            <!-- single -->
            <div class="single">
                <!--头像-->
                <div>
                    <h2>个人账户信息设置</h2>
                    <br/>
                    <h3 style="font-weight: bold">头像设置</h3>
                    <div class="single-left">
                        <img src="<c:url value="/images/co.png"/>" alt="头像" class="img-responsive" />
                    </div>
                    <div class="clearfix"> </div>
                    <br/>
                    <form>
                        <input type="file" name="pic" id="pic" accept="image/*" />
                        <br/>
                        <input type="submit"/>
                    </form>
                </div>
                <!--信息-->
                <div class="tags-cate">
                    <h3 style="font-weight: bold">信息设置</h3>
                    <form class="form-horizontal" style="margin-left:-175px">
                        <br/>
                        <div class="form-group" >
                            <label for="aUserName" class="col-xs-3 control-label">昵称：</label>
                            <div class="col-xs-8 ">
                                <input type="text" class="form-control input-sm duiqi" id="aUserName" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="aGender" class="col-xs-3 control-label">性别：</label>
                            <div class="col-xs-8">
                                <!--注意检查性别有没有被选-->
                                <label class="radio-inline"><input type="radio" name="gender" id="male" unchecked>男</label>
                                <label class="radio-inline"><input type="radio" name="gender" id="female">女</label>
                                <!--    <input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder=""> -->
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-3 control-label">生日：</label>
                            <div class="col-xs-8">
                                <input type="date" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-3 control-label">邮箱：</label>
                            <div class="col-xs-8">
                                <input type="email" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                            </div>
                        </div>
                    </form>
                    <div>
                        <br/>
                        <button type="button" class="btn btn-sm btn-white">更改</button>
                    </div>
                    <div class="clearfix"> </div>

                </div>
                <!--密码-->
                <div >
                    <h3 style="font-weight: bold">密码设置</h3>
                    <form class="form-horizontal" style="margin-left:-155px">
                        <br/>
                        <div class="form-group" >
                            <label for="aUserName" class="col-xs-3 control-label">原密码：</label>
                            <div class="col-xs-8 ">
                                <input type="password" class="form-control input-sm duiqi" id="aUserName" placeholder="请输入原密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-3 control-label">新密码：</label>
                            <div class="col-xs-8">
                                <input type="password" class="form-control input-sm duiqi" id="sKnot" placeholder="请输入新密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="sKnot" class="col-xs-3 control-label">新密码：</label>
                            <div class="col-xs-8">
                                <input type="password" class="form-control input-sm duiqi" id="sKnot" placeholder="请再次输入新密码，并与上一行一致">
                            </div>
                        </div>
                    </form>
                    <div>
                        <br/>
                        <button type="button" class="btn btn-sm btn-white">更改</button>
                    </div>
                </div>
            </div>
            <!-- //single -->
        </div>
    </div>

    <!--注册-->
    <%--<div class="modal fade" id="signup" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel" style="font-weight:bold">注册</h4>
                    <h4 class="modal-title">*以下均为必填 </h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="aUserName" class="col-xs-3 control-label">用户名：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" class="form-control input-sm duiqi" id="aUserName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="aUserName" class="col-xs-3 control-label">昵称：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" class="form-control input-sm duiqi" id="aUserName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="aPassword" class="col-xs-3 control-label">密码：</label>
                                <div class="col-xs-8">
                                    <input type="password" class="form-control input-sm duiqi" id="aPassword" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="aGender" class="col-xs-3 control-label">性别：</label>
                                <div class="col-xs-8">
                                    <!--注意检查性别有没有被选-->
                                    <label class="radio-inline"><input type="radio" name="gender" id="male" unchecked>男</label>
                                    <label class="radio-inline"><input type="radio" name="gender" id="female">女</label>
                                    <!--    <input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder=""> -->
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">生日：</label>
                                <div class="col-xs-8">
                                    <input type="date" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">邮箱：</label>
                                <div class="col-xs-8">
                                    <input type="email" class="form-control input-sm duiqi" id="sKnot" placeholder="">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">注 册</button>
                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">取 消</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>--%>
    <!--登录-->
    <%--<div class="modal fade" id="login" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel" style="font-weight:bold">登录</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form method="post"  class="form-horizontal">
                            <div class="form-group">
                                <label for="aUserName" class="col-xs-3 control-label">用户名：</label>
                                <div class="col-xs-8 ">
                                    <input type="text" class="form-control input-sm duiqi" id="aUserName" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="aPassword" class="col-xs-3 control-label">密码：</label>
                                <div class="col-xs-8">
                                    <input type="password" class="form-control input-sm duiqi" id="aPassword" placeholder="">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">登 录</button>
                    <button type="button" class="btn btn-xs btn-green" data-dismiss="modal">取 消</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>--%>

</div>
<!-- //banner-body -->
<!-- for bootstrap working -->
<script src="<c:url value="/js/bootstrap.js"/>"></script>
<!-- //for bootstrap working -->
</body>
</html>