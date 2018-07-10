<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<script>
    $(document).ready(function(){
            $("#treeholeBar").addClass("active").siblings().find("a").addClass("hvr-underline-from-left");
            $('.dropdown-toggle').dropdown();
        }
    )

    function login() {
        window.location.href="/login";
    }

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


    function lastPage(pageNum) {
        var goto_page=1;
        if(pageNum>1){
            goto_page=pageNum-1;
        }else{
            goto_page=pageNum;
        }
        window.location="/treehole/"+goto_page+"?sort=${sorttype}";
    }

    function nextPage(pageNum,totalPage) {
        var goto_page=1;
        if(pageNum<totalPage){
            goto_page=pageNum+1;
        }else{
            goto_page=pageNum;
        }
        window.location="/treehole/"+goto_page+"?sort=${sorttype}";
    }

    function searchSecret() {
        var content=$("#searchContent").val();
        if(content==null || content==""){
            window.location="/home";
        }else{
            window.location="/treehole/search/"+content+"/1";
        }
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
                            <button type="button" class="btn btn-info pull-right" style="margin-right: 10px" onclick=login()>登录</button><span style="font-size: small;color: gray;margin-left: 20px">登录后才能发表秘密哟!</span>
                        </c:if>
                        <c:if test="${sessionScope.user!=null}">
                        <div class="panel-body">
                            <div class="row" style="margin-left: 0.02cm;color:black">
                                <textarea style="height: 150px;width: 770px;resize: none;border-radius:5px; border:solid 5px rgba(245, 245, 245, 0.856)"></textarea>
                            </div>
                        </div>
                        <div class="panel-footer" style="background-color:white">
                            <div class="row">
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
        <!--操作栏-->
        <div class="row">
            <!--排序-->
            <div class="pull-left" style="margin-left: 15px">
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <c:choose>
                            <c:when test="${sorttype=='newest'}">最新</c:when>
                            <c:when test="${sorttype=='comment'}">评论量</c:when>
                            <c:when test="${sorttype=='upvote'}">获赞数</c:when>
                            <c:when test="${sorttype=='downvote'}">被踩数</c:when>
                        </c:choose>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="<c:url value="/home"/>">最新</a>
                        </li>
                        <li>
                            <a href="<c:url value="/treehole/1?sort=comment"/>">评论量</a>
                        </li>
                        <li>
                            <a href="<c:url value="/treehole/1?sort=upvote"/>">获赞数</a>
                        </li>
                        <li>
                            <a href="<c:url value="/treehole/1?sort=downvote"/>">被踩数</a>
                        </li>

                    </ul>
                </div>
            </div>
            <!--搜索-->
            <div class="pull-right">
                <span class="glyphicon glyphicon-search" style="margin: 0 10px"></span>
                <input id="searchContent" type="text"/><button class="btn btn-default btn-sm" style="margin: 0 10px" onclick="searchSecret()">搜索</button>
            </div>
        </div>

        <hr/>

        <!--秘密-->
        <%@include file="/WEB-INF/views/user/fragments/treehole_secret.jsp"%>

        <!--分页-->
        <ul class="pagination pull-right">
            <li id="lastPage"><a onclick="lastPage(${secretPage.pageNum})">&laquo;</a></li>
            <c:forEach begin="${secretPage.start}" end="${secretPage.end}" var="page">
                <c:if test="${secretPage.pageNum==page}">
                    <li class="active"><a href="<c:url value="/treehole/${page}?sort=${sorttype}"/>" class="">${page}</a></li>
                </c:if>
                <c:if test="${secretPage.pageNum!=page}">
                    <li><a href="<c:url value="/treehole/${page}?sort=${sorttype}"/>">${page}</a></li>
                </c:if>
            </c:forEach>
            <li id="nextPage"><a onclick="nextPage(${secretPage.pageNum},${secretPage.totalPage})">&raquo;</a></li>
        </ul>
    </div>
</div>

<script src="<c:url value="/js/bootstrap.js"/>"></script>
