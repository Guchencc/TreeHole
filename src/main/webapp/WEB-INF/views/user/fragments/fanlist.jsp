<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/7/10
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel panel-default" style="box-shadow: 1px 1px 5px #888888">
    <div class="panel-body">
        <c:forEach items="${userPage.list}" var="user">
            <div class="row" style="margin-top: 2%" >
                <div class="col-xs-2">
                    <a href="<c:url value="/user/${user.userId}/secret/1"/>" style="color:gray"><img src="<c:url value="/head/${user.userId}.jpg"/>" alt="头像" class="img-responsive img-circle" style="display:block; margin:0 auto;"  width="60px"/></a>
                </div>
                <div class="col-xs-5" >
                    <a href="<c:url value="/user/${user.userId}/secret/1"/>" style="color:gray"> <span style="margin-left:10px; line-height: 1.2cm "><c:out value="${user.nickname}" /></span></a>
                </div>
                <div class="col-xs-5">
                        <%-- <div class="row">
                             <button class="btn btn-default pull-right" style="margin-right: 15px" onclick="cancelFollow(${user.followId})">取消关注</button>
                         </div>--%>
                    <span class="glyphicon glyphicon-calendar pull-right" style="color:gray;margin-right: 15px">关注日期:<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${user.followDate}" /></span>
                </div>
            </div>
            <hr/>
        </c:forEach>
    </div>
</div>