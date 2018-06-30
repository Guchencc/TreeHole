<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/6/26
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="树心后台管理">
    <meta name="keywords" content="树心后台管理 ">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>树心后台管理系统</title>
    <script src="<c:url value="/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/js/bootstrap.min.js"/>"></script>
    <script>
        $(function() {
            $(".meun-item").click(function() {
                $(".meun-item").removeClass("meun-item-active");
                $(this).addClass("meun-item-active");
                var itmeObj = $(".meun-item").find("img");
                itmeObj.each(function() {
                    var items = $(this).attr("src");
                    items = items.replace("_grey.png", ".png");
                    items = items.replace(".png", "_grey.png")
                    $(this).attr("src", items);
                });
                var attrObj = $(this).find("img").attr("src");
                ;
                attrObj = attrObj.replace("_grey.png", ".png");
                $(this).find("img").attr("src", attrObj);
            });
            $("#topAD").click(function() {
                $("#topA").toggleClass(" glyphicon-triangle-right");
                $("#topA").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topBD").click(function() {
                $("#topB").toggleClass(" glyphicon-triangle-right");
                $("#topB").toggleClass(" glyphicon-triangle-bottom");
            });
            $("#topCD").click(function() {
                $("#topC").toggleClass(" glyphicon-triangle-right");
                $("#topC").toggleClass(" glyphicon-triangle-bottom");
            });
            $(".toggle-btn").click(function() {
                $("#leftMeun").toggleClass("show");
                $("#rightContent").toggleClass("pd0px");
            })
        })
    </script>

    <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/common.css"/>" />
    <%--<link rel="stylesheet" type="text/css" href="<c:url value="/css/slide.css"/>" />--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/>" />
   <%-- <link rel="stylesheet" type="text/css" href="<c:url value="/css/flat-ui.min.css"/>" />--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery.nouislider.css"/>">
</head>
<body>
<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}" />
<div id="wrap">
    <div id="left" >
        <t:insertAttribute name="left"/>
    </div>
    <!-- Tab panes -->
    <div id="right">
        <t:insertAttribute name="right"/>
    </div>
</div>
</body>
</html>
