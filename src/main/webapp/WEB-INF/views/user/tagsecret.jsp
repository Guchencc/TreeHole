<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script>
    $(document).ready(function(){
            $("#treeholeBar").addClass("active").siblings().find("a").addClass("hvr-underline-from-left");
        }
    )

    function writeSecret() {
        var url="/secret/add";
        var $writeSecret=$("#writeSecretArea");
        var content=$writeSecret.find("textarea").val();
        var tags=$writeSecret.find("input:text").val();
        var anonymous=$writeSecret.find("input:checkbox").is(":checked");
        if(tags.split("，").length>3){
            alert("标签个数不能超过三个!");
        }else {
            $.post(url,
                {
                    content: content,
                    tags: tags,
                    anonymous: anonymous
                }, function (data) {
                    if (data == "success") {
                        window.location.href = "/home";
                    } else {
                        alert("添加秘密失败！");
                    }
                })
        }
    }

    function addTag(obj) {
        event.stopPropagation();
        var $writeSecret=$("#writeSecretArea");
        var $tags=$writeSecret.find("input:text");
        var tag=obj.innerHTML;
        var now_tags=$tags.val();
        if(now_tags=="" || now_tags==null){
            $tags.val(tag);
        }else{
            if(now_tags.split("，").length>2){
                alert("标签超过3个！");
            }else {
                $tags.val(now_tags + "，" + tag);
            }
        }
    }

    function viewComments(secretId) {
        var url="/secret/"+secretId+"/comments";
        $.get(url,function (data) {
            var $comment_area=$("#secret-"+secretId);
            var $commentHtml=$comment_area.find("div:first-child");
            var content=$commentHtml.html();
            if(content!=null || content.length!=0) {
                $commentHtml.empty();
                for(var i=0,j=data.length;i<j;i++){
                    var commentId = data[i].commentId;
                    var userId = data[i].userId;
                    var nickname = data[i].nickname;
                    var comment = data[i].comment;
                    var commentDate = data[i].commentDate;
                    var isAnonymous = data[i].anonymous;
                    var $div_wrapper = $("<hr/><div class=\"row\" id=\""+commentId+"\"></div>");
                    var $div_userInfo = $("<div class=\"col-xs-4\" style=\"margin-left:20px; width:13%\" id=\""+userId+"\" ></div>");
                    var anonymousHead="/images/co.png";
                    var publicHead="/head/"+userId+".jpg";
                    if(isAnonymous==true){
                        nickname="匿名";
                    }
                    var $div_nickname = $("<div class=\"row\" style=\"margin-left:-4px\"><a href=\"\" style=\"color:gray\"><span style=\"margin-left:12px; line-height: 0.8cm ;font-size: 10px\">"+nickname+"</span></a></div>");
                    var $div_head = $("<div class=\"row\" style=\"margin-left:05px\"><a href=\"\" style=\"color:gray\"><img src=\""+publicHead+"\" alt=\"头像\" class=\"img-responsive img-circle\" style=\"float:left\"  width=\"30px\"/></a></div>");
                    var $div_nohead = $("<div class=\"row\" style=\"margin-left:05px\"><a href=\"\" style=\"color:gray\"><img src=\""+anonymousHead+"\" alt=\"头像\" class=\"img-responsive img-circle\" style=\"float:left\"  width=\"30px\"/></a></div>");
                    var $div_comment = $("<div class=\"col-xs-8\" style=\"margin-left:-30px;font-size: small\" id=\"comment\">"+comment+"</div><div><span style='color:gray;font-size: small'>"+commentDate+"</span><span style=\"font-size: small;color: gray\">   #"+(data.length-i)+"</span></div>");
                    if(isAnonymous==true){
                        $div_userInfo.append($div_nohead);
                    }else{
                        $div_userInfo.append($div_head);
                    }
                    $div_userInfo.append($div_nickname);
                    $div_wrapper.append($div_userInfo);
                    $div_wrapper.append($div_comment);
                    $commentHtml.append($div_wrapper);
                }
            }
        })
    }

    function upVote(secretId) {
        var url="/secret/"+secretId+"/upvote";
        $.get(url,function (data) {
            if(data=="success"){
                var $upvoteBtn=$("#upvote-"+secretId);
                var $upvote=$upvoteBtn.find("span:eq(1)");
                var upvote=parseInt($upvote.html());
                $upvote.html(upvote+1);
                $upvoteBtn.addClass("disabled");
            }
        })
    }

    function downVote(secretId) {
        var url="/secret/"+secretId+"/downvote";
        $.get(url,function (data) {
            if(data=="success"){
                var $downvoteBtn=$("#downvote-"+secretId);
                var $downvote=$downvoteBtn.find("span:eq(1)");
                var downvote=parseInt($downvote.html());
                $downvote.html(downvote+1);
                $downvoteBtn.addClass("disabled");
            }
        })
    }

    function addComment(secretId) {
        var $form=$("#writeComment-"+secretId);
        var comment=$form.find("textarea:first-child").val();
        var anonymous=$form.find("input:checkbox").is(":checked");
        var url="/comment/add";
        $.post(url,
            {
                secretId:secretId,
                comment:comment,
                anonymous:anonymous
            },function (data) {
                if(data=="success"){
                    var $commentCount=$("#commentCount");
                    if($commentCount.html()=="评论"){
                        $commentCount.html(1);
                    }else{
                        var commentCount=parseInt($commentCount.html());
                        $commentCount.html(commentCount+1);
                    }
                    viewComments(secretId);
                }else{
                    alert("评论失败！");
                }
            })
    }

    function login() {
        window.location.href="${pageContext.request.contextPath}/login";
    }

    function lastPage(pageNum) {
        var goto_page=1;
        if(pageNum>1){
            goto_page=pageNum-1;
        }else{
            goto_page=pageNum;
        }
        window.location="/treehole/${tag}/"+goto_page;
    }

    function nextPage(pageNum,totalPage) {
        var goto_page=1;
        if(pageNum<totalPage){
            goto_page=pageNum+1;
        }else{
            goto_page=pageNum;
        }
        window.location="/treehole/${tag}/"+goto_page;
    }

</script>
<!--右上-->
<div class="col-xs-9 banner-body-right">
    <div class="panel-group" id="accordion">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="glyphicon glyphicon-pencil">诉说秘密</span></a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="panel panel-default" id="writeSecretArea">
                        <c:if test="${sessionScope.user==null}">
                            <button type="button" class="btn btn-info pull-right" style="margin-right: 10px" onclick="login()">登录</button><span style="font-size: small;color: gray;margin-left: 20px">登录后才能发表秘密哟!</span>
                        </c:if>
                        <c:if test="${sessionScope.user!=null}">
                            <div class="panel-body">
                                <div class="row" style="margin-left: 0.02cm;color:black">
                                    <textarea style="height: 150px;width: 770px;resize: none;border-radius:5px; border:solid 5px rgba(245, 245, 245, 0.856)"></textarea>
                                </div>
                            </div>
                            <div class="panel-footer" style="background-color:white">
                                <div class="row" style="padding-bottom: px">
                                    <div style="margin-left:20px;color: black">
                                        <span>标签:</span>
                                        <input type="text" id="tag" placeholder="多个标签请用 , 隔开,最多3个" style="width:200px;border-radius:5px;border:solid 2px rgba(245, 245, 245, 0.856)">&nbsp
                                        <span class="glyphicon glyphicon-tags">&nbsp推荐标签:</span>
                                        <span class="label label-info" onclick="addTag(this)">心情</span>
                                        <span class="label label-info" onclick="addTag(this)">生活</span>
                                        <span class="label label-info" onclick="addTag(this)">爱情</span>
                                        <span class="label label-info" onclick="addTag(this)">事业</span>
                                        <span class="label label-info" onclick="addTag(this)">家庭</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <hr/>
                                    <input type="checkbox" name="niming" id="nming" style="margin-left:20px" /><span style="color: black">匿名</span>
                                    <button type="button" class="btn btn-default btn-sm pull-right" style="margin-right:11px" onclick="writeSecret()"><span class="glyphicon glyphicon-send"></span> 发表</button>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <br/>
                </div>
            </div>
        </div>
        <!--添加秘密-->

        <hr/>
        <!--搜索栏-->
        <div class="row" id="searchSecret"><span class="glyphicon glyphicon-search" style="margin: 0 10px"></span><input type="text"/><button class="btn btn-default btn-sm" style="margin: 0 10px">搜索</button></div>
        <hr/>

        <!--搜索结果-->
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert"
                    aria-hidden="true" onclick="window.location.href='/home'">
                &times;
            </button>
            找到<span style="font-weight: bold;font-size: 16px">&nbsp${secretPage.totalRecord}条&nbsp</span>包含<span style="font-weight: bold;font-size: 16px">&nbsp${tag}&nbsp</span>标签的秘密，共<span style="font-weight: bold;font-size: 16px">&nbsp${secretPage.totalPage}页&nbsp</span>
        </div>


        <!--查看秘密1-->
        <c:forEach items="${secretPage.list}" var="secret">
            <div class="panel panel-default" style="box-shadow: 1px 1px 5px #888888">
                <div class="panel-body">
                    <c:if test="${secret.anonymous==false}">
                        <div class="row">
                            <a href="" style="color:gray"><img src="<c:url value="/head/${secret.userId}.jpg"/>" alt="头像" class="img-responsive img-circle" style="float:left; margin-left: 10px"  width="50px"/>
                                <span style="margin-left:10px; line-height: 1.2cm "><c:out value="${secret.nickname}" /></span>
                            </a>
                        </div>
                    </c:if>
                    <div class="row" style="margin-left: 0.02cm;color:black;font-size: medium">
                        <br/>
                            <%--<textarea readonly="readonly" style="height: 150px;width: 800px;resize: none;border-radius:5px; border:solid 0px rgba(245, 245, 245, 0.856)" > henhao</textarea>--%>
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
    <!--分页-->
    <ul class="pagination pull-right">
        <li id="lastPage"><a onclick="lastPage(${secretPage.pageNum})">&laquo;</a></li>
        <c:forEach begin="${secretPage.start}" end="${secretPage.end}" var="page">
            <c:if test="${secretPage.pageNum==page}">
                <li class="active"><a href="<c:url value="/treehole/${tag}/${page}"/>" class="">${page}</a></li>
            </c:if>
            <c:if test="${secretPage.pageNum!=page}">
                <li><a href="<c:url value="/treehole/${tag}/${page}"/>">${page}</a></li>
            </c:if>
        </c:forEach>
        <li id="nextPage"><a onclick="nextPage(${secretPage.pageNum},${secretPage.totalPage})">&raquo;</a></li>
    </ul>
</div>
<script src="<c:url value="/js/bootstrap.js"/>"></script>