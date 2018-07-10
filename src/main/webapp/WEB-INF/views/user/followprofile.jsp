<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script>
    $(document).ready(function(){
            $("#treeholeBar").addClass("active").siblings().find("a").addClass("hvr-underline-from-left");
        }
    )

    function lastPage(pageNum) {
        var goto_page=1;
        if(pageNum>1){
            goto_page=pageNum-1;
        }else{
            goto_page=pageNum;
        }
        window.location="/user/${profile.userId}/follow/"+goto_page;
    }

    function nextPage(pageNum,totalPage) {
        var goto_page=1;
        if(pageNum<totalPage){
            goto_page=pageNum+1;
        }else{
            goto_page=pageNum;
        }
        window.location="/user/${profile.userId}/follow/"+goto_page;
    }

</script>
<div class="col-xs-9 banner-body-right">
    <!-- single -->
    <div class="single">
        <!--用户信息-->
        <%@ include file = "/WEB-INF/views/user/fragments/userprofile.jsp" %>
        <br/>

        <!--导航栏-->
        <div class="row">
            <ul class="nav nav-tabs" style="margin-left: 15px">
                <li>
                    <a href="<c:url value="/user/${profile.userId}/secret/1"/>">ta的秘密<span class="badge"><c:out value="${profile.secretCount}"/></span></a>
                </li>
                <li>
                    <a href="<c:url value="/user/${profile.userId}/wish/1"/>">ta的心愿<span class="badge"><c:out value="${profile.wishCount}"/></span></a>
                </li>
                <li class="active">
                    <a href="<c:url value="/user/${profile.userId}/follow/1"/>">ta的关注<span class="badge"><c:out value="${profile.followCount}"/></span></a>
                </li>
                <li>
                    <a href="<c:url value="/user/${profile.userId}/fan/1"/>">ta的粉丝<span class="badge"><c:out value="${profile.fansCount}"/></span></a>
                </li>
            </ul>
        </div>
        <br/>

        <!--关注用户列表-->
        <%@include file="/WEB-INF/views/user/fragments/userlist.jsp"%>

        <!--分页-->
        <ul class="pagination pull-right">
            <li id="lastPage"><a onclick="lastPage(${userPage.pageNum})">&laquo;</a></li>
            <c:forEach begin="${userPage.start}" end="${userPage.end}" var="page">
                <c:if test="${userPage.pageNum==page}">
                    <li class="active"><a href="<c:url value="/user/${profile.userId}/follow/${page}"/>">${page}</a></li>
                </c:if>
                <c:if test="${userPage.pageNum!=page}">
                    <li><a href="<c:url value="/user/${profile.userId}/follow/${page}"/>">${page}</a></li>
                </c:if>
            </c:forEach>
            <li id="nextPage"><a onclick="nextPage(${userPage.pageNum},${userPage.totalPage})">&raquo;</a></li>
        </ul>
    </div>
    <!-- //single -->
</div>