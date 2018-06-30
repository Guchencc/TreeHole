<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/6/29
  Time: 23:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="<c:url value="/js/jquery.min.js"/>"></script>
    <script src="<c:url value="/js/bootstrap.min.js"/>"></script>
    <link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/common.css"/>" />
    <%--<link rel="stylesheet" type="text/css" href="<c:url value="/css/slide.css"/>" />--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/>" />
    <%-- <link rel="stylesheet" type="text/css" href="<c:url value="/css/flat-ui.min.css"/>" />--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery.nouislider.css"/>">
</head>
<body>

<div id="left">
    <t:insertAttribute name="left" />
</div>
<div id="right">
    <t:insertAttribute name="right"/>
</div>
</body>
</html>
