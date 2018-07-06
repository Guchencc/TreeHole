<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/7/4
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(document).ready(function(){
            $("#wishbottleBar").addClass("active").siblings().find("a").addClass("hvr-underline-from-left");
        }
    )
</script>
<div class="col-xs-9 banner-body-right">
    <div class="row" style="position:relative">
        <img src="<c:url value="/images/beach.jpg"/>" alt="beach" class="img-responsive"/>

        <div class="panel panel-default" style="background: rgba(255, 255, 255, 0.7);width:15cm;position:absolute;left:140px;top:20px;">
            <div class="panel-body" style:"">
            <!--写心愿-->
            <div class="row" >
                <button type="button" onclick="window.location.href='<c:url value="/wishbottle" />'" class="btn btn-default btn-sm" style="margin-left:20px;background: rgba(255, 255, 255, 0.7);">
                    <span class="glyphicon glyphicon-circle-arrow-left"></span> 返回
                </button>
                <br/><br/>
                <div class="row" style="margin-left: 30px">
                    <textarea style="color:black;background: rgba(255, 255, 255, 0.7); height: 150px;width: 520px;resize: none;border-radius:5px; border:solid 5px rgba(245, 245, 245, 0.856)" placeholder="记录下你的心愿..."></textarea>
                </div>
                <hr/>
                <div style="margin-left:20px;color:black">
                    <span class="glyphicon glyphicon-film"></span>
                    <span class="glyphicon glyphicon-picture"></span>
                    <span class="glyphicon glyphicon-music">附件:</span>
                    <span class="fileinput-button" style="margin-left:275px;height: 18px;"><input type="file"></span>
                </div>
                <hr/>
                <div class="row">
                    <button id="saveWish"  type="button" class="btn btn-default btn-sm " style="margin-left:30px">
                        <span class="glyphicon glyphicon-heart-empty"></span> 存为心愿
                    </button>
                    <button id="throwSea" type="button" class="btn btn-default btn-sm " style="margin-left:30px">
                        <span class="glyphicon glyphicon-tint"></span> 投入大海
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>