<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/7/10
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function () {
        var url="/checkfollow/"+${profile.userId};
        var $followDiv=$("#followDiv");
        var $notfollowBtn=$("<button  class=\"btn btn-default pull-right\" style=\"margin-right: 15px;width:100px\" onclick=\"notfollow(${profile.userId})\">取消关注</button>");
        var $followBtn=$("<button class=\"btn btn-default pull-right\" style=\"margin-right: 15px;width:100px\" onclick=\"follow(${profile.userId})\">关注</button>");
        $.get(url,function (data) {
            if(data=="true"){
                $followDiv.append($notfollowBtn);
            }else{
                $followDiv.append($followBtn);
            }
        })
    })

    function follow(followId) {
        var url="/user/follow/"+followId;
        $.get(url,function (data) {
            if(data=="success"){
                var $notfollowBtn=$("<button class=\"btn btn-default pull-right\" style=\"margin-right: 15px;width:100px\" onclick=\"notfollow(${profile.userId})\">取消关注</button>");
                $("#followDiv").empty().append($notfollowBtn);
                alert("关注成功!");
            }else{
                alert("关注失败!");
            }
        })
    }

    function notfollow(followId) {
        var url="/user/notFollow/"+followId;
        $.get(url,function (data) {
            if(data=="success"){
                var $followBtn=$("<button class=\"btn btn-default pull-right\" style=\"margin-right: 15px;width:100px\" onclick=\"follow(${profile.userId})\">关注</button>");
                $("#followDiv").empty().append($followBtn);
                alert("取消关注成功!");
            }else{
                alert("取消关注失败!");
            }
        })
    }
</script>
<!--用户信息-->
<div class="panel panel-default" style="box-shadow: 1px 1px 5px #888888">
    <div class="panel-heading">
        <h3 class="panel-title">
            用户资料
        </h3>
    </div>
    <div class="panel-body">
        <br/>
        <div class="row" style="color: black;margin-left: 15px">
            <div class="col-xs-2">
                <img src="<c:url value="/head/${profile.userId}.jpg"/>" alt="用户头像"  width="120px"/>
            </div>
            <div class="col-xs-6">
                <span>昵称：<c:out value="${profile.nickname}"/></span>
                <br/>
                <span>性别：<c:out value="${profile.gender==1?'男':'女'}"/> </span>
                <br/>
                <span>生日：<c:out value="${profile.birthday}"/></span>
                <br/>
            </div>
            <div class="col-xs-4" id="followDiv"></div>
        </div>
    </div>
</div>