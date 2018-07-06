<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/7/4
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    $(document).ready(function(){
            $("#wishbottleBar").addClass("active").siblings().find("a").addClass("hvr-underline-from-left");
        }
    )

    function viewBottleDetail(bottleId) {
        window.location.href="/bottle/"+bottleId;
    }
</script>

<div class="col-xs-9 banner-body-right">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <button type="button" onclick="window.location.href='<c:url value="/wishbottle" />'" class="btn btn-default btn-sm" style="margin-left:20px;background: rgba(255, 255, 255, 0.7);">
                    <span class="glyphicon glyphicon-circle-arrow-left"></span> 返回
                </button>
                <div class="btn-toolbar" role="toolbar">
                    <div class="btn-group" style="margin-left: 300px">
                        <button type="button" class="btn btn-default" onclick="window.location.href='<c:url value="/pickedbottles" />'">捞到的瓶子</button>
                        <button type="button" class="btn btn-default" onclick="window.location.href='<c:url value="/thrownbottles" />'">扔出的瓶子</button>
                    </div>
                </div>
            </div>
            <br/>
            <div >
                <!--received bottle1-->
                <c:forEach items="${bottles}" var="bottle">
                    <div class="panel panel-default" onclick="viewBottleDetail(${bottle.bottleId})" style="box-shadow: 1px 1px 5px #888888;color:black;cursor: pointer">
                        <div class="panel-body">
                            <div class="row">
                                <a href=""><img src="<c:url value="/head/${bottle.userId}.jpg"/>" alt="用户头像" class="img-responsive img-circle" style="float:left; margin-left: 15px;margin-right: 15px" width="50px"/></a>
                                <span style="margin-left:15px;margin-right: 15px;color: black"><c:out  value="${bottle.wish}"/></span>
                            </div>
                            <a href=""><span class="pull-left" style="margin-left: 5px;color: black"><c:out value="${bottle.nickname}"/> </span></a>
                        </div>
                        <div class="panel-footer" style="background-color:white">
                            <div class="row">
                                <span class="pull-left" style="margin-left:15px">日期：<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${bottle.throwDate}"/></span>
                                <span class="pull-left" style="margin-left: 15px">资源:
                                <c:choose>
                                    <c:when test="${bottle.hasPicture==true}">
                                        <span class="glyphicon glyphicon-picture" style="margin-left: 5px"></span>
                                    </c:when>
                                    <c:when test="${bottle.hasVoice==true}">
                                        <span class="glyphicon glyphicon-music" style="margin-left: 5px"></span>
                                    </c:when>
                                    <c:when test="${bottle.hasVideo==true}">
                                        <span class="glyphicon glyphicon-film" style="margin-left: 5px"></span>
                                    </c:when>
                                </c:choose>
                                </span>
                                <button class="btn btn-default btn-sm pull-right" style="margin-right: 15px">删除</button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <br/>
        </div>

    </div>
</div>