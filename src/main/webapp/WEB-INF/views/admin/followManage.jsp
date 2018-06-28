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
            var user_id=$("#deleteUserId").val();
            var follow_id=$("#deleteFollowUserId").val();
            window.location = "/admin/follow/delete?userId="+user_id+"&followId="+follow_id;
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
            window.location="/admin/follow/"+goto_page;
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
            window.location="/admin/follow/"+goto_page;
        })

    })

    function SetDeleteFollowId(id1,id2) {
        $("#deleteUserId").val(id1);
        $("#deleteFollowUserId").val(id2);
    }

    function ShowFollowInfo(obj) {
        var followInfo=$(obj).parent().siblings();
        $("#userId").val(followInfo[0].innerHTML);
        $("#followId").val(followInfo[1].innerHTML);
        $("#specialFollow").val(followInfo[2].innerHTML);
        $("#followDate").val(followInfo[3].innerHTML);
    }

</script>

<div role="tabpanel" class="tab-pane col-lg-11" id="follow">
    <div class="check-div form-inline">
        <div class="col-xs-3">
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addFollow">添加关注</button>
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
            <div class="col-xs-2 ">用户Id</div>
            <div class="col-xs-2">关注用户Id</div>
            <div class="col-xs-2">是否特别关注</div>
            <div class="col-xs-4">关注日期</div>
        </div>
        <div class="tablebody">
            <c:forEach items="${follows}" var="follow">
                <div class="row">
                    <div class="col-xs-2">${follow.userId}</div>
                    <div class="col-xs-2">${follow.followId}</div>
                    <div class="col-xs-2">${follow.specialFollow==true?"是":"否"}</div>
                    <div class="col-xs-4"><fmt:formatDate value="${follow.followDate}" type="both"/></div>
                    <div class="col-xs-2">
                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#updateFollow" onclick="ShowFollowInfo(this)">修改</button>
                        <button class="btn btn-danger btn-xs"  data-toggle="modal" data-target="#deleteFollow" onclick="SetDeleteFollowId(${follow.userId},${follow.followId})">删除</button>
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
                    <li class="active"><a href="<c:url value="/admin/follow/${p}"/>">${p}</a></li>
                </c:if>
                <c:if test="${current_page!=p}">
                    <li ><a href="<c:url value="/admin/follow/${p}"/>">${p}</a></li>
                </c:if>
            </c:forEach>
            <li><a id="nextPage">&raquo;</a></li>
        </ul>
    </footer>

    <!--弹出添加用户窗口-->
    <div class="modal fade" id="addFollow" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加关注</h4>
                </div>
                <sf:form method="POST" action="${pageContext.request.contextPath}/admin/follow/add" commandName="followBean" class="form-horizontal">
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">用户Id：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="userId" class="form-control input-sm duiqi" id="sName" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">关注用户Id：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="followId" class="form-control input-sm duiqi" id="sLink" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">是否特别关注：</label>
                                <div class="col-xs-8">
                                    <!--注意检查性别有没有被选-->
                                    <label class="radio-inline"><sf:radiobutton path="specialFollow" value="true"  />是</label>
                                    <label class="radio-inline"><sf:radiobutton path="specialFollow" value="false" />否</label>
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
    <div class="modal fade" id="updateFollow" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改关注</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <sf:form method="POST" action="${pageContext.request.contextPath}/admin/follow/update"  commandName="followBean" class="form-horizontal">
                        <div class="form-group ">
                            <label class="col-xs-3 control-label">用户ID：</label>
                            <div class="col-xs-8 ">
                                <sf:input path="userId" class="form-control input-sm duiqi" readonly="true"/>
                            </div>
                        </div>
                        <div class="form-group ">
                            <label class="col-xs-3 control-label">关注用户ID：</label>
                            <div class="col-xs-8 ">
                                <sf:input path="followId" class="form-control input-sm duiqi" readonly="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">是否特别关注：</label>
                            <div class="col-xs-8">
                                <label class="radio-inline"><sf:radiobutton path="specialFollow" value="true"  />是</label>
                                <label class="radio-inline"><sf:radiobutton path="specialFollow" value="false" />否</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">关注日期：</label>
                            <div class="col-xs-8">
                                <sf:input path="followDate" type="date" class="form-control input-sm duiqi" />
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
    <div class="modal fade" id="deleteFollow" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        确定要删除该关注？删除后不可恢复！
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="deleteUserId" value="" />
                    <input type="hidden" id="deleteFollowUserId" value="" />
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