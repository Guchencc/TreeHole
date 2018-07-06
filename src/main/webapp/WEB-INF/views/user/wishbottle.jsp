<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Guchen
  Date: 2018/7/4
  Time: 16:17
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
        <button type="button"  class="btn btn-default btn-lg" style="background: rgba(255, 255, 255, 0.7);position:absolute;left:10px;top:10px" >
            <span class="glyphicon glyphicon-cog"></span>
        </button>
        <div>
            <button type="button" onclick="window.location.href='<c:url value="/writewish" />'"  class="btn btn-default btn-lg" style="font-size:13px;width:70px;height:70px;background: rgba(255, 255, 255, 0.7);position:absolute;left:100px;top:330px">
                <img src="<c:url value="/images/write.jpg"/>" alt="write" class="img-responsive"/>写心愿
            </button>
            <button type="button" onclick="window.location.href='<c:url value="/salvagebottle" />'" class="btn btn-default btn-lg" style="font-size:13px;width:70px;height:70px;background: rgba(255, 255, 255, 0.7);position:absolute;left:300px;top:330px">
                <img src="" alt="catch" class="img-responsive"/>捞瓶子
            </button>
            <button type="button" onclick="window.location.href='<c:url value="/pickedbottles" />'" class="btn btn-default btn-lg" style="font-size:13px;width:70px;height:70px;background: rgba(255, 255, 255, 0.7);position:absolute;left:500px;top:330px">
                <img src="" alt="myBottle" class="img-responsive"/>我的瓶子
            </button>
            <button type="button" onclick="window.location.href='<c:url value="/mywishes" />'" class="btn btn-default btn-lg" style="font-size:13px;width:70px;height:70px;background: rgba(255, 255, 255, 0.7);position:absolute;left:700px;top:330px">
                <img src="" alt="myWish" class="img-responsive"/>我的心愿
            </button>
        </div>
    </div>

</div>