<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/7/10
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="<c:url value="/js/comment.js"/>"></script>
<!--查看秘密1-->
<c:forEach items="${secretPage.list}" var="secret">
    <div class="panel panel-default" style="box-shadow: 1px 1px 5px #888888">
        <div class="panel-body">
            <c:if test="${secret.anonymous==false}">
                <div class="row">
                    <a href="<c:url value="/user/${secret.userId}/secret/1"/>" style="color:gray"><img src="<c:url value="/head/${secret.userId}.jpg"/>" alt="头像" class="img-responsive img-circle" style="float:left; margin-left: 10px"  width="50px"/>
                        <span style="margin-left:10px; line-height: 1.2cm "><c:out value="${secret.nickname}" /></span>
                    </a>
                </div>
            </c:if>
            <div class="row" style="margin-left: 0.02cm;color:black;font-size: medium">
                <br/>
                <c:out value="${secret.content}"/>
            </div>
        </div>
        <div class="panel-footer" style="background-color:white">
            <!--标签-->
            <c:if test="${secret.tags!=null}">
                <div class="row">
                    <div style="margin-left:20px">
                        <span class="glyphicon glyphicon-tag" style="color:gray">标签:</span>
                        <c:forTokens items="${secret.tags}" delims="，" var="tag">
                            <span><a href="<c:url value="/treehole/${tag}/1" />"><c:out value="${tag}"/></a></span>
                        </c:forTokens>

                    </div>
                </div>
            </c:if>
            <div style="margin-left:5px">
                <span class="glyphicon glyphicon-calendar" style="color:gray">日期:<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${secret.createDate}" /></span>
            </div>
            <!--赞 踩 评论按钮-->
            <div class="row">
                <hr/>
                <button type="button" class="btn btn-default btn-sm" style="margin-left:20px" id="upvote-${secret.secretId}" onclick="upVote(${secret.secretId})">
                    <span class="glyphicon glyphicon-thumbs-up" ></span><span><c:out value=" ${secret.upVote}"/></span>
                </button>
                <button type="button" class="btn btn-default btn-sm" id="downvote-${secret.secretId}"  onclick="downVote(${secret.secretId})">
                    <span class="glyphicon glyphicon-thumbs-down"></span><span><c:out value=" ${secret.downVote}"/></span>
                </button>
                <button class="btn btn-primary btn-sm pull-right toggle-button" onclick="viewComments(${secret.secretId})"   data-toggle="collapse" data-target="#secret-${secret.secretId}" style="margin-right:11px">
                    <span class="glyphicon glyphicon-comment" ></span>
                    <c:set var="commentN" value="${secret.commentCount}"/>
                    <span id="commentCount"><c:out value="${commentN==0?\"评论\":commentN}"/></span>
                </button>
            </div>

            <!--评论区-->
            <div class="row">
                <div id="secret-${secret.secretId}" class="collapse">
                    <div></div>
                    <hr/>
                    <c:if test="${sessionScope.user==null}">
                        <button type="button" class="btn btn-info pull-right" style="margin-right: 10px" onclick="login()">登录</button><span style="font-size: small;color: gray;margin-left: 20px">登录后才能发表评论哟!</span>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <!--写评论栏-->
                        <hr/>
                        <div class="row">
                            <form role="form" id="writeComment-${secret.secretId}">
                                <textarea style="margin-left:115px;font-size:12px;width: 680px;border-radius:5px;resize: none;overflow-y:hidden; border:solid 5px rgba(245, 245, 245, 0.856)" placeholder="发表你的评论..."></textarea><br/><br/>
                                <input type="checkbox" style="margin-left:120px ;">匿名
                                <button type="button" class="btn btn-default btn-sm pull-right" style="margin-right:26px;" onclick="addComment(${secret.secretId})"><span class="glyphicon glyphicon-send"></span>发表</button>
                            </form>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <br/>
</c:forEach>
</div>