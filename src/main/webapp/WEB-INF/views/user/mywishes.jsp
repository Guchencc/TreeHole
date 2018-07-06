<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/7/4
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<script>
    $(document).ready(function(){
            $("#wishbottleBar").addClass("active").siblings().find("a").addClass("hvr-underline-from-left");
        }
    )

    function viewBottleDetailFromWish(wishId) {
        var url="/wish/"+wishId+"/bottle";
        window.location.href=url;
    }

    function throwIntoWishSea(wishId) {
        var anonymous="false";
        var url="/wish/throw";
        $.post(url,
            {
                wishId:wishId,
                anonymous:anonymous
            },function (data) {
                if(data=="success"){
                    alert("成功投入心愿海!");
                    window.location.href="/thrownbottles";
                }
            })
    }
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-xs-9 banner-body-right">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <button type="button" onclick="window.location.href='<c:url value="/wishbottle" />'" class="btn btn-default btn-sm" style="margin-left:20px;background: rgba(255, 255, 255, 0.7);">
                    <span class="glyphicon glyphicon-circle-arrow-left"></span> 返回
                </button>
                <span style="color:black;margin: 0 30%" class="glyphicon glyphicon-heart">我的心愿</span>
            </div>
            <br/>
            <div >
                <!--myWish1-->
                <c:forEach items="${wishes}" var="wish">
                <div class="panel panel-default" style="box-shadow: 1px 1px 5px #888888;color:black">
                    <div class="panel-body">
                        <div class="row">
                            <span style="margin-left:15px; line-height: 1.2cm;margin-right: 15px;color:black">${wish.wish}</span>
                            <br/><br/>
                        </div>
                        <div class="row">
                            <c:choose>
                                <c:when test="${wish.hasPicture==true}">
                                    <img src="<c:url value="/wish/image/${wish.wishId}.jpeg"/>" alt="wish_image"  height="150px" style="display: flex;margin: 0 auto"/>
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
                    <div class="panel-footer" style="background-color:white">
                        <div class="row">
                            <span class="pull-left" style="margin-left: 15px">创建时间:<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${wish.createDate}" /></span>
                            <span class="pull-left" style="margin-left: 15px">
                                <c:if  test="${wish.thrown==true}">
                                    <span class="glyphicon glyphicon-tint" style="margin-left:10px">已投入心愿海</span>
                                    <button class="btn btn-default btn-sm"  onclick="viewBottleDetailFromWish(${wish.wishId})">查看瓶子</button>
                                </c:if>
                                <c:if  test="${wish.privacy==true}">
                                    <span class="glyphicon glyphicon-eye-close" style="margin-left:10px">仅自己可见</span>
                                </c:if>
                            </span>
                            <button class="btn btn-default btn-sm pull-right" style="margin-right: 15px">删除</button>
                            <c:if test="${wish.thrown==false}">
                                <button class="btn btn-default btn-sm pull-right" style="margin-right: 15px" onclick="throwIntoWishSea(${wish.wishId})">投入心愿海</button>
                            </c:if>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <br/>
        </div>
    </div>
</div>
