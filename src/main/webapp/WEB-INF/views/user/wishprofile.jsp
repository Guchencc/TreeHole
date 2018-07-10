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
        window.location="/user/${profile.userId}/wish/"+goto_page;
    }

    function nextPage(pageNum,totalPage) {
        var goto_page=1;
        if(pageNum<totalPage){
            goto_page=pageNum+1;
        }else{
            goto_page=pageNum;
        }
        window.location="/user/${profile.userId}/wish/"+goto_page;
    }

</script>
<div class="col-xs-9 banner-body-right">
    <!-- single -->
    <div class="single">
        <!--用户信息-->
        <%@include file="/WEB-INF/views/user/fragments/userprofile.jsp"%>
        <br/>
        <div class="row">
            <ul class="nav nav-tabs" style="margin-left: 15px">
                <li>
                    <a href="<c:url value="/user/${profile.userId}/secret/1"/>">ta的秘密<span class="badge"><c:out value="${profile.secretCount}"/></span></a>
                </li>
                <li class="active">
                    <a href="<c:url value="/user/${profile.userId}/wish/1"/>">ta的心愿<span class="badge"><c:out value="${profile.wishCount}"/></span></a>
                </li>
                <li>
                    <a href="<c:url value="/user/${profile.userId}/follow/1"/>">ta的关注<span class="badge"><c:out value="${profile.followCount}"/></span></a>
                </li>
                <li>
                    <a href="<c:url value="/user/${profile.userId}/fan/1"/>">ta的粉丝<span class="badge"><c:out value="${profile.fansCount}"/></span></a>
                </li>
            </ul>
        </div>
        <br/>
        <c:forEach items="${wishPage.list}" var="wish">
        <div class="panel panel-default" style="box-shadow: 1px 1px 5px #888888;color:black">
            <div class="panel-body">
                <div class="row">
                    <span style="margin-left:15px; line-height: 1.2cm;margin-right: 15px;color:black">${wish.wish}</span>
                    <br/><br/>
                </div>
                <div class="row">
                    <c:choose>
                        <c:when test="${wish.hasPicture==true}">
                            <img src="<c:url value="/wish/image/${wish.wishId}.jpg"/>" alt="wish_image"  height="150px" style="display: flex;margin: 0 auto"/>
                        </c:when>
                        <c:when test="${wish.hasVoice==true}">
                            <audio controls style="display: flex;margin: 0 auto">
                                <source src="<c:url value="/wish/voice/${wish.wishId}.mp3" />" type="audio/mpeg">
                            </audio>
                        </c:when>
                        <c:when test="${wish.hasVideo==true}">
                            <video width="320" height="240" controls style="display: flex;margin: 0 auto">
                                <source src="<c:url value="/wish/video/${wish.wishId}.mp4" />" type="video/mp4">
                            </video>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
        </c:forEach>
        <!--分页-->
        <ul class="pagination pull-right">
            <li id="lastPage"><a onclick="lastPage(${wishPage.pageNum})">&laquo;</a></li>
            <c:forEach begin="${wishPage.start}" end="${wishPage.end}" var="page">
                <c:if test="${wishPage.pageNum==page}">
                    <li class="active"><a href="<c:url value="/user/${profile.userId}/wish/${page}"/>" class="">${page}</a></li>
                </c:if>
                <c:if test="${wishPage.pageNum!=page}">
                    <li><a href="<c:url value="/user/${profile.userId}/wish/${page}"/>">${page}</a></li>
                </c:if>
            </c:forEach>
            <li id="nextPage"><a onclick="nextPage(${wishPage.pageNum},${wishPage.totalPage})">&raquo;</a></li>
        </ul>
    </div>

    <!-- //single -->
</div>