<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/6/28
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--树洞条目管理模块-->
<script>

    $(document).ready(function () {

        $("#delete_byId").bind("click",function () {
            var secret_id=$("#deleteId").val();
            window.location = "/admin/secret/delete/"+secret_id;
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
            window.location="/admin/secret/"+goto_page;
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
            window.location="/admin/secret/"+goto_page;
        })

    })

    function SetDeleteSecretId(id) {
        $("#deleteId").val(id);
    }

    function ShowSecretInfo(obj) {
        var secretInfo=$(obj).parent().siblings();
        $("#secretId").val(secretInfo[0].innerHTML);
        $("#userId").val(secretInfo[1].innerHTML);
        $("#content").val(secretInfo[3].innerHTML);
        $("#tags").val(secretInfo[4].innerHTML);
        $("#anonymous").val(secretInfo[5].innerHTML);
        $("#upVote").val(secretInfo[6].innerHTML);
        $("#downVote").val(secretInfo[7].innerHTML);
        $("#createDate").val(secretInfo[8].innerHTML);
    }

    function ShowSecret(obj) {
        var secretInfo=$(obj).parent().siblings();
        var content=secretInfo[3].innerHTML;
        var tags=secretInfo[4].innerHTML;
        $("#secret_content").val(content);
        $("#secret_tags").val(tags);
    }
</script>
<div role="tabpanel" class="tab-pane col-lg-11" id="secr">
    <div class="check-div form-inline">
        <div class="col-xs-3">
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addSecret">添加秘密 </button>
        </div>
        <div class="col-lg-4 col-xs-5">
            <input type="text" class=" form-control input-sm " placeholder="输入文字搜索">
            <button class="btn btn-white btn-xs ">查 询 </button>
        </div>
        <div class="col-lg-3 col-lg-offset-1 col-xs-3" style="padding-right: 40px;text-align: right;float: right;">
            <label for="paixu">排序:&nbsp;</label>
            <select class="form-control">
                <option>赞数</option>
                <option>踩数</option>
            </select>
        </div>
    </div>
    <div class="data-div">
        <div class="row tableHeader">
            <div class="col-xs-1 ">秘密ID</div>
            <div class="col-xs-1 ">用户ID</div>
            <div class="col-xs-2">内容</div>
            <div class="col-xs-1">标签</div>
            <div class="col-xs-1">是否匿名</div>
            <div class="col-xs-1">赞数</div>
            <div class="col-xs-1">踩数</div>
            <div class="col-xs-1">创建日期</div>
        </div>

        <div class="tablebody">
            <c:forEach items="${secrets}" var="secret">
            <div class="row">
                <div class="col-xs-1 ">${secret.secretId}</div>
                <div class="col-xs-1">${secret.userId}</div>
                <%--<div class="col-xs-2">${secret.content.subSequence(0,secret.content.length()<15?secret.content.length():15)}</div>--%>
                <div class="col-xs-2">${secret.content.length()<15?secret.content.substring(0,secret.content.length()):secret.content.substring(0,15)}</div>
                <div class="col-xs-1" hidden>${secret.content}</div>
                <div class="col-xs-1">${secret.tags}</div>
                <div class="col-xs-1">${secret.anonymous eq true?"匿名":"公开"}</div>
                <div class="col-xs-1">${secret.upVote}</div>
                <div class="col-xs-1">${secret.downVote}</div>
                <div class="col-xs-2"><fmt:formatDate value="${secret.createDate}" type="both"/></div>
                <div class="col-xs-2">
                    <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#viewUser" onclick="ShowSecret(this)">查 看</button>
                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#updateSecret" onclick="ShowSecretInfo(this)">修改</button>
                    <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSecret" onclick="SetDeleteSecretId(${secret.secretId})">删除</button>
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
                    <li class="active"><a href="<c:url value="/admin/secret/${p}"/>">${p}</a></li>
                </c:if>
                <c:if test="${current_page!=p}">
                    <li ><a href="<c:url value="/admin/secret/${p}"/>">${p}</a></li>
                </c:if>
            </c:forEach>
            <li><a id="nextPage">&raquo;</a></li>
        </ul>
    </footer>

    <!--弹出添加secret窗口-->
    <div class="modal fade" id="addSecret" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加秘密</h4>
                </div>
                <sf:form method="POST" action="${pageContext.request.contextPath}/admin/secret/add" commandName="secretBean" class="form-horizontal">
                <div class="modal-body">
                    <div class="container-fluid">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">用户ID：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="userId" class="form-control input-sm duiqi" id="sName" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">内容：</label>
                                <div class="col-xs-8 ">
                                    <sf:textarea path="content" maxlength="200" class="form-control input-sm duiqi" id="sLink" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sOrd" class="col-xs-3 control-label">标签：</label>
                                <div class="col-xs-8">
                                    <sf:input path="tags" class="form-control input-sm duiqi" id="sOrd" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">是否匿名：</label>
                                <div class="col-xs-8">
                                    <label class="radio-inline"><sf:radiobutton path="anonymous"  value="1"/>匿名</label>
                                    <label class="radio-inline"><sf:radiobutton path="anonymous"  value="0"/>公开</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">赞数：</label>
                                <div class="col-xs-8">
                                    <sf:input path="upVote" class="form-control input-sm duiqi" id="sKnot" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">踩数：</label>
                                <div class="col-xs-8">
                                    <sf:input path="downVote" class="form-control input-sm duiqi" id="sKnot" placeholder="" />
                                </div>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <input type="submit" class="btn btn-xs btn-green" value="添加"/>
                </div>
                </sf:form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!--弹出修改secret窗口-->
    <div class="modal fade" id="updateSecret" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改秘密</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <sf:form method="POST" action="${pageContext.request.contextPath}/admin/secret/update"  commandName="secretBean" class="form-horizontal">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">秘密ID：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="secretId" class="form-control input-sm duiqi" readonly="true" />
                                </div>
                            </div>
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">用户ID：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="userId" class="form-control input-sm duiqi" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">内容：</label>
                                <div class="col-xs-8 ">
                                    <sf:textarea path="content" class="form-control input-sm duiqi" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sOrd" class="col-xs-3 control-label">标签：</label>
                                <div class="col-xs-8">
                                    <sf:input path="tags" class="form-control input-sm duiqi" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">是否公开：</label>
                                <div class="col-xs-8">
                                    <label class="radio-inline"><sf:radiobutton path="anonymous" value="true" />匿名</label>
                                    <label class="radio-inline"><sf:radiobutton path="anonymous" value="false" />公开</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">赞数：</label>
                                <div class="col-xs-8">
                                    <sf:input path="upVote" class="form-control input-sm duiqi" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">踩数：</label>
                                <div class="col-xs-8">
                                    <sf:input path="downVote" class="form-control input-sm duiqi" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">创建日期：</label>
                                <div class="col-xs-8">
                                    <sf:input path="createDate" class="form-control input-sm duiqi"  readonly="true" />
                                </div>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <input type="submit" class="btn btn-xs btn-green" value="保存"/>
                </div>
                </sf:form>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!--弹出删除secret警告窗口-->
    <div class="modal fade" id="deleteSecret" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        确定要删除该秘密？删除后不可恢复！
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="deleteId" value="" />
                    <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                    <button id="delete_byId"  type="button" class="btn btn-xs btn-danger">保 存</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->

    <!--弹出查看窗口-->
    <div class="modal fade" id="viewUser" role="dialog" aria-labelledby="gridSystemModalLabel" >
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="gridSystemModalLabel">秘密详情</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <form class="form-horizontal">
                            <div class="form-group ">
                                <label for="secret_content" class="col-xs-2 control-label">内容：</label>
                                <div class="col-xs-10 ">
                                    <textarea id="secret_content" rows="12" cols="35" readonly="readonly" ></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="secret_tags" class="col-xs-2 control-label">标签：</label>
                                <div class="col-xs-10">
                                    <input id="secret_tags" col="20" readonly="readonly" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
    </div>
</div>