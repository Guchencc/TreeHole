<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/6/30
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {
        $("#collapse0").addClass("in");

    })

</script>
<!--左上-->
<div class="col-xs-3 banner-body-left">
    <div class="logo">
        <h1><a href="<c:url value="/home"/>">Tree <span>Hole</span></a></h1>
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
                        <li id="treeholeBar"><a href="<c:url value="/home"/>" ><span class="glyphicon glyphicon-pencil">树洞</span></a></li>
                        <li id="wishbottleBar"><a href="<c:url value="/wishbottle"/>"><span class="glyphicon glyphicon-heart">心愿瓶</span></a></li>
                    </ul>
                </nav>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
    </div>
    <!--not log in state-->
    <c:if test="${sessionScope.user==null}">
        <div class="latest-news">
            <div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
                <nav class="stroke">
                    <ul class="nav navbar-nav">
                        <li><a href="<c:url value="/login"/>"><span class="glyphicon glyphicon-plus">登录</span></a></li>
                        <li><a href="<c:url value="/register"/>"><span class="glyphicon glyphicon-user">注册</span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </c:if>
    <c:if test="${sessionScope.user!=null}">
        <!--log in state-->
        <div class="col-xs-8">
            <div class="row">
                <a href=""><img src="<c:url value="/head/${sessionScope.user.userId}.jpg"/>" class="img-circle" alt="user image" width="100px"></a>
            </div>
            <div class="row">
                <a href="" class="hvr-underline-from-left" style="color:#999"><span><c:out value="${sessionScope.user.nickname}"/></span></a></li>
            </div>
            <div class="row">
                <a href="<c:url value="/logout"/>" class="hvr-underline-from-left" style="color:#999"><span>退出</span></a></li>
            </div>
        </div>
    </c:if>
    <!--bulletin-->
    <div class="col-xs-8">
        <div class="row">
            <br/>
            <div class="latest-news">
                <h2 >公告</h2>
                <c:forEach items="${bulletins}" var="bulletin" varStatus="status">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="heading${status.index}">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${status.index}" aria-expanded="true" aria-controls="collapse">
                                <fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${bulletin.createDate}" />
                                <c:if test="${status.index==0}">
                                    <span class="badge badge-secondary">New</span>
                                </c:if>
                            </a>
                        </h4>
                    </div>
                    <div id="collapse${status.index}" class="panel-collapse collapse " role="tabpanel" aria-labelledby="heading${status.index}">
                        <div class="panel-body">
                           <c:out value="${bulletin.content}"/>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
