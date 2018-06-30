<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>

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
<p>${userProfile.user.username}</p>
<p>${userProfile.user.password}</p>
<p>${userProfile.headPicture}</p>
</body>
</html>