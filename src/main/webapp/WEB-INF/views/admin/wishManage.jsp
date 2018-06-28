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
            var wish_id=$("#deleteId").val();
            window.location = "/admin/wish/delete/"+wish_id;
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
            window.location="/admin/wish/"+goto_page;
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
            window.location="/admin/wish/"+goto_page;
        })

    })

    function SetDeleteWishId(id) {
        $("#deleteId").val(id);
    }

    function ShowWishInfo(obj) {
        var wishInfo=$(obj).parent().siblings();
        $("#wishId").val(wishInfo[0].innerHTML);
        $("#userId").val(wishInfo[1].innerHTML);
        $("#wish").val(wishInfo[2].innerHTML);
        $("#hasVideo").val(wishInfo[3].innerHTML);
        $("#hasVoice").val(wishInfo[4].innerHTML);
        $("#hasPicture").val(wishInfo[5].innerHTML);
        $("#isPrivacy").val(wishInfo[6].innerHTML);
    }

</script>
<div role="tabpanel" class="tab-pane col-lg-11" id="secr">
    <div class="check-div form-inline">
        <div class="col-xs-3">
            <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addWish">添加心愿 </button>
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
          <%--  <div class="col-xs-1">心愿ID</div>--%>
            <div class="col-xs-1">用户ID</div>
            <div class="col-xs-2">心愿</div>
            <div class="col-xs-1">含视频</div>
            <div class="col-xs-1">含录音</div>
            <div class="col-xs-1">含图片</div>
            <div class="col-xs-1">是否公开</div>
            <div class="col-xs-1">已投入心愿池</div>
            <div class="col-xs-2">创建日期</div>
        </div>

        <div class="tablebody">
            <c:forEach items="${wishes}" var="wish">
                <div class="row">
                    <div class="col-xs-1" hidden>${wish.wishId}</div>
                    <div class="col-xs-1">${wish.userId}</div>
                    <div class="col-xs-2">${wish.wish}</div>
                    <div class="col-xs-1">${wish.hasVideo==true?"有":"无"}</div>
                    <div class="col-xs-1">${wish.hasVoice==true?"有":"无"}</div>
                    <div class="col-xs-1">${wish.hasPicture==true?"有":"无"}</div>
                    <div class="col-xs-1">${wish.privacy==true?"私密":"公开"}</div>
                    <div class="col-xs-1">${wish.thrown==true?"是":"否"}</div>
                    <div class="col-xs-2"><fmt:formatDate value="${wish.createDate}" type="both"/></div>
                    <div class="col-xs-2">
                        <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#viewUser" onclick="ShowWish(this)">查 看</button>
                        <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#updateWish" onclick="ShowWishInfo(this)">修改</button>
                        <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteWish" onclick="SetDeleteWishId(${wish.wishId})">删除</button>
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
                    <li class="active"><a href="<c:url value="/admin/wish/${p}"/>">${p}</a></li>
                </c:if>
                <c:if test="${current_page!=p}">
                    <li ><a href="<c:url value="/admin/wish/${p}"/>">${p}</a></li>
                </c:if>
            </c:forEach>
            <li><a id="nextPage">&raquo;</a></li>
        </ul>
    </footer>

    <!--弹出添加secret窗口-->
    <div class="modal fade" id="addWish" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加心愿</h4>
                </div>
                <sf:form method="POST" action="${pageContext.request.contextPath}/admin/wish/add" commandName="wishBean" class="form-horizontal">
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="form-group">
                                <label for="sLink" class="col-xs-3 control-label">用户ID：</label>
                                <div class="col-xs-8 ">
                                    <sf:input path="userId"  class="form-control input-sm duiqi" id="sLink" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="sOrd" class="col-xs-3 control-label">心愿：</label>
                                <div class="col-xs-8">
                                    <sf:input path="wish" class="form-control input-sm duiqi" id="sOrd" placeholder="" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">含视频：</label>
                                <div class="col-xs-8">
                                    <label class="radio-inline"><sf:radiobutton path="hasVideo"  value="1"/>是</label>
                                    <label class="radio-inline"><sf:radiobutton path="hasVideo"  value="0"/>无</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">含录音：</label>
                                <div class="col-xs-8">
                                    <label class="radio-inline"><sf:radiobutton path="hasVoice"  value="1"/>是</label>
                                    <label class="radio-inline"><sf:radiobutton path="hasVoice"  value="0"/>无</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">含图片：</label>
                                <div class="col-xs-8">
                                    <label class="radio-inline"><sf:radiobutton path="hasPicture"  value="1"/>是</label>
                                    <label class="radio-inline"><sf:radiobutton path="hasPicture"  value="0"/>无</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-xs-3 control-label">是否公开：</label>
                                <div class="col-xs-8">
                                    <label class="radio-inline"><sf:radiobutton path="privacy"  value="1"/>是</label>
                                    <label class="radio-inline"><sf:radiobutton path="privacy"  value="0"/>否</label>
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
    <div class="modal fade" id="updateWish" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">修改心愿</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <sf:form method="POST" action="${pageContext.request.contextPath}/admin/wish/update"  commandName="wishBean" class="form-horizontal">
                        <div class="form-group ">
                            <label  class="col-xs-3 control-label">心愿ID：</label>
                            <div class="col-xs-8 ">
                                <sf:input path="wishId" class="form-control input-sm duiqi" readonly="true" />
                            </div>
                        </div>
                        <div class="form-group ">
                            <label  class="col-xs-3 control-label">用户ID：</label>
                            <div class="col-xs-8 ">
                                <sf:input path="userId" class="form-control input-sm duiqi" readonly="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">心愿：</label>
                            <div class="col-xs-8 ">
                                <sf:textarea path="wish" class="form-control input-sm duiqi" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-xs-3 control-label">含视频：</label>
                            <div class="col-xs-8">
                                <label class="radio-inline"><sf:radiobutton path="hasVideo" value="true" />有</label>
                                <label class="radio-inline"><sf:radiobutton path="hasVideo" value="false" />无</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">含录音：</label>
                            <div class="col-xs-8">
                                <label class="radio-inline"><sf:radiobutton path="hasVoice" value="true"/>有</label>
                                <label class="radio-inline"><sf:radiobutton path="hasVoice" value="false"/>无</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">含图片：</label>
                            <div class="col-xs-8">
                                <label class="radio-inline"><sf:radiobutton path="hasPicture" value="true"/>有</label>
                                <label class="radio-inline"><sf:radiobutton path="hasPicture" value="false"/>无</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 control-label">是否公开：</label>
                            <div class="col-xs-8">
                                <label class="radio-inline"><sf:radiobutton path="privacy" value="false"/>公开</label>
                                <label class="radio-inline"><sf:radiobutton path="privacy" value="true"/>私密</label>
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
    <div class="modal fade" id="deleteWish" role="dialog" aria-labelledby="gridSystemModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        确定要删除该心愿？删除后不可恢复！
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

   <%-- <!--弹出查看窗口-->
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
        </div>--%>
    </div>
</div>