<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/6/26
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--用户账户管理模块-->
<script>
    $(document).ready(function () {

        $("#delete_byId").bind("click",function () {
            var comment_id=$("#deleteId").val();
            window.location = "/admin/comment/delete/"+comment_id;
        })

        $("#lastPage").bind("click",function () {
            var current_page=$("#current_page").val();
            var goto_page=1;
            if(current_page>1){
                goto_page=current_page-1;
                $("#current_page").val(goto_page);
            }else {
                goto_page=current_page;
            }
            if(goto_page===1){$("#lastPage").parent().css("disabled");}
            window.location="/admin/comment/"+goto_page;
        })

        $("#nextPage").bind("click",function () {
            var current_page=$("#current_page").val();
            var page_count=$("#pageCount").val();
            var goto_page=1;
            if(current_page<page_count){
                goto_page=eval(current_page)+1;
            }else {
                goto_page=eval(current_page);
            }
            if(goto_page===current_page){$("#nextPage").parent().css("disabled");}
            window.location="/admin/comment/"+goto_page;
        })

    })

    function SetDeleteCommentId(id) {
        $("#deleteId").val(id);
    }

    function ShowCommentInfo(obj) {
        var commentInfo=$(obj).parent().siblings();
        $("#commentId").val(commentInfo[0].innerHTML);
        $("#secretId").val(commentInfo[1].innerHTML);
        $("#userId").val(commentInfo[2].innerHTML);
        $("#comment").val(commentInfo[3].innerHTML);
        $("#isAnonymous").val(userInfo[4].innerHTML);
        $("#commentDate").val(userInfo[5].innerHTML);
    }

</script>

<div role="tabpanel" class="tab-pane col-lg-11" id="comment">
    <div class="check-div form-inline">
        <div class="col-xs-3">
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addComment">添加评论</button>
        </div>
        <div class="col-xs-4">
            <input type="text" class="form-control input-sm" placeholder="输入文字搜索">
            <button class="btn btn-white btn-xs ">查 询 </button>
        </div>
        <div class="col-lg-3 col-lg-offset-2 col-xs-4" style=" padding-right: 40px;text-align: right;">
            <label>排序:&nbsp;</label>
            <select class="form-control">
                <option>用户ID</option>
                <option>生日</option>
                <option>创建日期</option>
            </select>
        </div>
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-1 ">评论Id</div>
            <div class="col-xs-1">秘密Id</div>
            <div class="col-xs-1">用户Id</div>
            <div class="col-xs-4">评论</div>
            <div class="col-xs-1">是否匿名</div>
            <div class="col-xs-1">评论日期</div>
        </div>
        <div class="tablebody">
            <c:forEach items="${comments}" var="comment">
                <div class="row">
                    <div class="col-xs-1">${comment.commentId}</div>
                    <div class="col-xs-1">${comment.secretId}</div>
                    <div class="col-xs-1">${comment.userId}</div>
                    <div class="col-xs-4">${comment.comment}</div>
                    <div class="col-xs-1">${comment.anonymous==true?"匿名":"公开"}</div>
                    <div class="col-xs-2"><fmt:formatDate value="${comment.commentDate}" type="both"/></div>
                    <div class="col-xs-2">
                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#updateComment" onclick="ShowCommentInfo(this)">修改</button>
                        <button class="btn btn-danger btn-xs"  data-toggle="modal" data-target="#deleteComment" onclick="SetDeleteCommentId(${comment.commentId})">删除</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>


    <!--页码块-->
    <footer class="footer">
        <ul class="pagination">
            <input type="hidden" id="current_page" value="${current_page}"/>
            <li class="gray" id="pageCount" value="${pageCount}">
                共<c:out value="${pageCount}" />页
            </li>
            <li><a id="lastPage">&laquo;</a></li>
            <c:forEach var="p" begin="1" end="${pageCount}">
                <c:if test="${current_page==p}">
                    <li class="active"><a href="<c:url value="/admin/comment/${p}"/>">${p}</a></li>
                </c:if>
                <c:if test="${current_page!=p}">
                    <li ><a href="<c:url value="/admin/comment/${p}"/>">${p}</a></li>
                </c:if>
            </c:forEach>
            <li><a id="nextPage">&raquo;</a></li>
        </ul>
    </footer>

    <!--弹出添加用户窗口-->
    <div class="modal fade" id="addComment" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加评论</h4>
                </div>
                <sf:form method="POST" action="${pageContext.request.contextPath}/admin/comment/add" commandName="commentBean" class="form-horizontal">
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">秘密Id：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="secretId" class="form-control input-sm duiqi" id="sName" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">用户Id：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="userId" class="form-control input-sm duiqi" id="sLink" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sOrd" class="col-xs-3 control-label">评论：</label>
                                <div class="col-xs-8">
                                    <sf:textarea path="comment" class="form-control input-sm duiqi" id="sOrd" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">是否匿名：</label>
                                <div class="col-xs-8">
                                    <!--注意检查性别有没有被选-->
                                    <label class="radio-inline"><sf:radiobutton path="anonymous" value="true"  />匿名</label>
                                    <label class="radio-inline"><sf:radiobutton path="anonymous" value="false" />公开</label>
                                    <!--    <input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder=""> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                        <input type="submit" class="btn btn-xs btn-green" value="添加" />
                    </div>
                </sf:form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!--弹出修改用户窗口-->
    <div class="modal fade" id="updateComment" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改评论</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <sf:form method="POST" action="${pageContext.request.contextPath}/admin/comment/update"  commandName="commentBean" class="form-horizontal">
                        <div class="form-group ">
                            <label class="col-xs-3 control-label">评论ID：</label>
                            <div class="col-xs-8 ">
                                <sf:input path="commentId" class="form-control input-sm duiqi" readonly="true"/>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-xs-3 control-label">秘密ID：</label>
                            <div class="col-xs-8 ">
                                <sf:input path="secretId" class="form-control input-sm duiqi" readonly="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">用户ID：</label>
                            <div class="col-xs-8 ">
                                <sf:input path="userId" class="form-control input-sm duiqi" readonly="true" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">评论：</label>
                            <div class="col-xs-8">
                                <sf:input path="comment" class="form-control input-sm duiqi" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">是否匿名：</label>
                            <div class="col-xs-8">
                                <label class="radio-inline"><sf:radiobutton path="anonymous" value="true"  />匿名</label>
                                <label class="radio-inline"><sf:radiobutton path="anonymous" value="false" />公开</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">评论日期：</label>
                            <div class="col-xs-8">
                                <sf:input path="commentDate" type="date" class="form-control input-sm duiqi" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <input  type="submit" class="btn btn-xs btn-green" value="保存" />
                </div>
                </sf:form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!--弹出删除用户警告窗口-->
    <div class="modal fade" id="deleteComment" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        确定要删除该评论？删除后不可恢复！
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="deleteId" value="" />
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button id="delete_byId" type="button" class="btn  btn-xs btn-danger">确定</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
</div>
