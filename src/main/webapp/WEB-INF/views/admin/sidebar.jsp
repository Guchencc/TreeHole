<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/6/26
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 左侧菜单栏目块 -->
<div class="leftMeun col-lg-1" id="leftMeun">
    <div id="logoDiv">
        <p id="logoP"><img id="logo" alt="树心后台管理系统" src="<c:url value="/images/logo.png"/>"><span>树心后台</span></p>
    </div>
    <div id="personInfor">
        <p id="userName">Admin</p>
        <p>    <a href="<c:url value="/admin/secret/1"/>">返回主页</a>   </p>
    </div>
    <div class="meun-title">管理员选项</div>
    <a href="<c:url value="/admin/secret/1"/>"><div class="meun-item" href="#sour" aria-controls="sour" role="tab" ><img src="<c:url value="/images/icon_source.png"/>">资源管理</div></a>
    <a href="<c:url value="/admin/user/1"/>"><div class="meun-item" href="#chan" aria-controls="chan" role="tab" ><img src="<c:url value="/images/icon_change_grey.png"/>">修改密码</div></a>

    <div class="meun-title">用户信息管理</div>
    <a href="<c:url value="/admin/user/1"/>"><div class="meun-item"  ><img src="<c:url value="/images/icon_user_grey.png"/>">用户管理</div></a>
    <a href="<c:url value="/admin/secret/1"/>"><div class="meun-item" aria-controls="secr" role="tab"><img src="<c:url value="/images/icon_house_grey.png"/>">树洞条目管理</div></a>
    <a href="<c:url value="/admin/comment/1"/>"><div class="meun-item" aria-controls="comm" role="tab" ><img src="<c:url value="/images/icon_card_grey.png"/>">树洞评论管理</div></a>
    <a href="<c:url value="/admin/follow/1"/>"><div class="meun-item"  aria-controls="foll" role="tab"><img src="<c:url value="/images/icon_char_grey.png"/>">用户关注列表</div></a>
    <a href="<c:url value="/admin/wish/1"/>"><div class="meun-item"  aria-controls="wish" role="tab"><img src="<c:url value="/images/icon_change_grey.png"/>">心愿管理</div></a>
    <a href="<c:url value="/admin/profile"/>"><div class="meun-item"  aria-controls="wise" role="tab"><img src="<c:url value="/images/icon_change_grey.png"/>">心愿瓶独立设置</div></a>
    <a href="<c:url value="/admin/bottle"/>"><div class="meun-item"  aria-controls="bott" role="tab"><img src="<c:url value="/images/icon_change_grey.png"/>">心愿瓶</div></a>
    <a href="<c:url value="/admin/bottleMessage"/>"><div class="meun-item" aria-controls="bome" role="tab"><img src="<c:url value="/images/icon_change_grey.png"/>">心愿瓶留言</div></a>
    <a href="<c:url value="/admin/pick"/>"><div class="meun-item"  aria-controls="pick" role="tab"><img src="<c:url value="/images/icon_change_grey.png"/>">拾取设置</div></a>
    <a href="<c:url value="/admin/bulletin"/>"><div class="meun-item"  aria-controls="bull" role="tab"><img src="<c:url value="/images/icon_change_grey.png"/>">公告设置</div></a>
    <%--<a href="<c:url value="/admin/user"/>"><div class="meun-item" aria-controls="regu" role="tab"><img src="<c:url value="/images/icon_rule_grey.png"/>">asdasd</div></a>--%>
</div>