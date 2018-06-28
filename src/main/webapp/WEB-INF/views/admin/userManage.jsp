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
            var user_id=$("#deleteId").val();
            window.location = "/admin/user/delete/"+user_id;
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
            window.location="/admin/user/"+goto_page;
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
            window.location="/admin/user/"+goto_page;
        })

        $("#search").bind("click",function () {
            var type=$("#search_type").val();
            var content=$("#search_content").val();
            if(content==""){
                window.location="/admin/user/1";
            }else {
                window.location = "/admin/user/search?type=" + type + "&search=" + content;
            }
        })

    })

    function SetDeleteUserId(id) {
        $("#deleteId").val(id);
    }

    function ShowUserInfo(obj) {
        var userInfo=$(obj).parent().siblings();
        $("#userId").val(userInfo[0].innerHTML);
        $("#username").val(userInfo[1].innerHTML);
        $("#password").val(userInfo[2].innerHTML);
        $("#nickname").val(userInfo[3].innerHTML);
        $("#gender").val(userInfo[4].innerHTML);
        $("#birthday").val(userInfo[5].innerHTML);
        $("#email").val(userInfo[6].innerHTML);
        $("#createDate").val(userInfo[7].innerHTML);
    }

</script>

<div role="tabpanel" class="tab-pane col-lg-11" id="user">
    <div class="check-div form-inline">
        <div class="col-xs-3">
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addUser">添加用户 </button>
        </div>
        <div class="col-xs-4">
            <select id="search_type">
                <option value="1">用户ID</option>
                <option value="2">用户名</option>
                <option value="3">昵称</option>
            </select>
            <input id="search_content" type="text" class="form-control input-sm" placeholder="输入文字搜索">
            <button id="search" class="btn btn-white btn-xs ">查 询 </button>
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
            <div class="col-xs-1 ">用户ID</div>
            <div class="col-xs-1">用户名</div>
            <div class="col-xs-1">密码</div>
            <div class="col-xs-1">昵称</div>
            <div class="col-xs-1">性别</div>
            <div class="col-xs-1">生日</div>
            <div class="col-xs-1">邮箱</div>
            <div class="col-xs-1">创建日期</div>
        </div>
        <div class="tablebody">
            <c:forEach items="${users}" var="user">
            <div class="row">
                <div class="col-xs-1">${user.userId}</div>
                <div class="col-xs-1">${user.username}</div>
                <div class="col-xs-1">${user.password}</div>
                <div class="col-xs-1">${user.nickname}</div>
                <div class="col-xs-1">${user.gender eq 1?"男":"女"}</div>
                <div class="col-xs-1"><fmt:formatDate value="${user.birthday}" type="date"/></div>
                <div class="col-xs-2">${user.email}</div>
                <div class="col-xs-2"><fmt:formatDate value="${user.createDate}" type="both"/></div>
                <div class="col-xs-2">
                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#updateUser" onclick="ShowUserInfo(this)">修改</button>
                    <button class="btn btn-danger btn-xs"  data-toggle="modal" data-target="#deleteUser" onclick="SetDeleteUserId(${user.userId})">删除</button>
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
                        <li class="active"><a href="<c:url value="/admin/user/${p}"/>">${p}</a></li>
                   </c:if>
                   <c:if test="${current_page!=p}">
                       <li ><a href="<c:url value="/admin/user/${p}"/>">${p}</a></li>
                   </c:if>
               </c:forEach>
               <li><a id="nextPage">&raquo;</a></li>
           </ul>
    </footer>

    <!--弹出添加用户窗口-->
    <div class="modal fade" id="addUser" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加用户</h4>
                </div>
                <sf:form method="POST" action="${pageContext.request.contextPath}/admin/user/add" commandName="userBean" class="form-horizontal">
                <div class="modal-body">
                    <div class="container-fluid">
                            <div class="form-group ">
                                <label for="sName" class="col-xs-3 control-label">用户名：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="username" class="form-control input-sm duiqi" id="sName" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">密码：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="password" class="form-control input-sm duiqi" id="sLink" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sOrd" class="col-xs-3 control-label">昵称：</label>
                                <div class="col-xs-8">
                                    <sf:input path="nickname" class="form-control input-sm duiqi" id="sOrd" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">性别：</label>
                                <div class="col-xs-8">
                                    <!--注意检查性别有没有被选-->
                                    <label class="radio-inline"><sf:radiobutton path="gender" value="1"  />男</label>
                                    <label class="radio-inline"><sf:radiobutton path="gender" value="0" />女</label>
                                    <!--    <input type="text" class="form-control input-sm duiqi" id="sKnot" placeholder=""> -->
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">生日：</label>
                                <div class="col-xs-8">
                                    <sf:input path="birthday" type="date" class="form-control input-sm duiqi" id="sKnot" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">邮箱：</label>
                                <div class="col-xs-8">
                                    <sf:input path="email" type="email" class="form-control input-sm duiqi" id="sKnot" placeholder="" />
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
    <div class="modal fade" id="updateUser" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <sf:form method="POST" action="${pageContext.request.contextPath}/admin/user/update"  commandName="userBean" class="form-horizontal">
                            <div class="form-group ">
                                <label class="col-xs-3 control-label">用户ID：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="userId" class="form-control input-sm duiqi" readonly="true"/>
                                </div>
                            </div>
                            <div class="form-group ">
                                <label class="col-xs-3 control-label">用户名：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="username" class="form-control input-sm duiqi" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">密码：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="password" class="form-control input-sm duiqi" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">昵称：</label>
                                <div class="col-xs-8">
                                    <sf:input path="nickname" class="form-control input-sm duiqi" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">性别：</label>
                                <div class="col-xs-8">
                                    <label class="radio-inline"><sf:radiobutton path="gender" value="1"  />男</label>
                                    <label class="radio-inline"><sf:radiobutton path="gender" value="0" />女</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">生日：</label>
                                <div class="col-xs-8">
                                    <sf:input path="birthday" type="date" class="form-control input-sm duiqi" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sKnot" class="col-xs-3 control-label">邮箱：</label>
                                <div class="col-xs-8">
                                    <sf:input path="email" type="email" class="form-control input-sm duiqi"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">创建日期：</label>
                                <div class="col-xs-8">
                                    <sf:input path="createDate"  class="form-control input-sm duiqi" readonly="true" />
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
    <div class="modal fade" id="deleteUser" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        确定要删除该用户？删除后不可恢复！
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
