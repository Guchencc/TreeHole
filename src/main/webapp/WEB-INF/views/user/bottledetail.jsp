<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/7/5
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function(){
            $("#wishbottleBar").addClass("active").siblings().find("a").addClass("hvr-underline-from-left");
        }
    )

    function leaveMessage(bottleId) {
        var url="/leavemessage";
        var anonymous=$("#anonymous").is(":checked");
        var message=$("#message").val();
        $.post(url,
            {
                bottleId:bottleId,
                message:message,
                anonymous:anonymous
            },function (data) {
                if(data=="success"){
                    window.location.href="/bottle/"+bottleId;
                }
            })
    }
</script>
<!--右上-->
<div class="col-xs-9 banner-body-right">
    <!-- single -->
    <div class="single">
        <div >
            <div class="panel panel-default" style="box-shadow: 1px 1px 5px #888888;color:black">
                <div class="panel-body">
                    <div class="row">
                        <button type="button" onclick="window.location.href='<c:url value="/pickedbottles" />'" class="btn btn-default btn-sm" style="margin-left:20px;background: rgba(255, 255, 255, 0.7);">
                            <span class="glyphicon glyphicon-circle-arrow-left"></span> 返回
                        </button>
                    </div>
                    <br/>
                    <c:if test="${bottle.bottleInfo.anonymous==false}">
                        <div class="row">
                            <a href="" style="color:gray"><img src="<c:url value="/head/${bottle.bottleInfo.userId}.jpg"/>" alt="头像" class="img-responsive img-circle" style="float:left; margin-left: 10px"  width="50px"/>
                                <span style="margin-left:10px; line-height: 1.2cm ">${bottle.bottleInfo.nickname}</span>
                            </a>
                        </div>
                    </c:if><br/>
                    <div class="row" style="margin-left: 0.02cm;color: black;">
                        <div><c:out value="${bottle.bottleInfo.wish}"/></div>
                    </div>
                    <br/>
                    <div class="row">
                        <c:choose>
                            <c:when test="${bottle.bottleInfo.hasPicture==true}">
                                <img src="<c:url value="/wish/image/${bottle.bottleInfo.wishId}.jpeg"/>" alt="wish_image"  height="150px" style="display: flex;margin: 0 auto"/>
                            </c:when>
                            <c:when test="${bottle.bottleInfo.hasVoice==true}">
                                <audio controls style="display: flex;margin: 0 auto">
                                    <source src="<c:url value="/wish/voice/${bottle.bottleInfo.wishId}.mp3" />" type="audio/mpeg">
                                </audio>
                            </c:when>
                            <c:when test="${bottle.bottleInfo.hasVideo==true}">
                                <video width="320" height="240" controls style="display: flex;margin: 0 auto">
                                    <source src="<c:url value="/wish/video/${bottle.bottleInfo.wishId}.mp4" />" type="video/mp4">
                                </video>
                            </c:when>
                        </c:choose>
                    </div>
                    <div class="row">
                        <div style="margin-left:5px">
                            <span class="glyphicon glyphicon-calendar pull-right" style="margin-right: 15px"><fmt:formatDate value="${bottle.bottleInfo.throwDate}" type="both" dateStyle="medium" timeStyle="medium"/></span>
                        </div>
                    </div>
                </div>
                <!--评论区-->
                <div class="panel-footer" style="background-color:white">
                    <div class="row"><span style="margin: 0 45%">留言板</span></div><br/>
                    <c:forEach items="${bottle.messages}" var="message" varStatus="status">
                        <div class="row">
                            <div class="col-xs-4" style="margin-left:20px; width:13%" >
                                <c:if test="${message.anonymous==false}">
                                <div class="row" style="margin-left:05px">
                                    <a href="" style="color:gray"><img src="<c:url value="/head/${message.userId}.jpg"/>" alt="头像" class="img-responsive img-circle" style="float:left"  width="40px"/></a>
                                </div>
                                <div class="row" style="margin-left:-4px">
                                    <a href="" style="color:gray"><span style="margin-left:12px; line-height: 0.8cm ;font-size: 10px"><c:out value="${message.nickname}"/></span></a>
                                </div>
                                </c:if>
                                <c:if test="${message.anonymous==true}">
                                    <div class="row" style="margin-left:05px">
                                        <a href="" style="color:gray"><img src="<c:url value="/head/0.jpg"/>" alt="匿名头像" class="img-responsive img-circle" style="float:left"  width="40px"/></a>
                                    </div>
                                    <div class="row" style="margin-left:-4px">
                                        <a href="" style="color:gray"><span style="margin-left:12px; line-height: 0.8cm ;font-size: 10px">匿名</span></a>
                                    </div>
                                </c:if>
                            </div>
                            <div class="col-xs-8" style="margin-right: 20px">
                                <div class="row"><c:out value="${message.message}"/></div>
                                <div class="row"><span style="font-size: small;color: gray" class="pull-right">  #${bottle.messages.size()-status.index}</span><span style='color:gray;font-size: small' class="pull-right"><fmt:formatDate value="${message.writeDate}" type="both" dateStyle="medium" timeStyle="medium"/></span></div>
                            </div>
                        </div>
                        <br/>
                        <hr/>
                    </c:forEach>
                    <!--分割-->
                    <!--写评论栏-->
                    <div class="row">
                        <textarea id="message"  style="margin-left:115px;height: 50px;font-size:12px;width: 680px;border-radius:5px;resize: none;overflow-y:hidden; border:solid 5px rgba(245, 245, 245, 0.856)" placeholder="留言..."></textarea>
                    </div>
                    <!--匿名、发表-->
                    <div class="row">
                        <input type="checkbox" id="anonymous" style="margin-left:120px ;">匿名
                        <button type="button" onclick="leaveMessage(${bottle.bottleInfo.bottleId})" class="btn btn-default btn-sm pull-right" style="margin-right:26px;">
                            <span class="glyphicon glyphicon-send"></span>留言
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //single -->
</div>
