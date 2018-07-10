function viewComments(secretId) {
    var url="/secret/"+secretId+"/comments";
    $.get(url,function (data) {
        var $comment_area=$("#secret-"+secretId);
        var $commentHtml=$comment_area.find("div:first-child");
        var content=$commentHtml.html();
        if(content!=null || content.length!=0) {
            $commentHtml.empty();
            for(var i=0,j=data.length;i<j;i++){
                var commentId = data[i].commentId;
                var userId = data[i].userId;
                var nickname = data[i].nickname;
                var comment = data[i].comment;
                var commentDate = data[i].commentDate;
                var isAnonymous = data[i].anonymous;
                var $div_wrapper = $("<hr/><div class=\"row\" id=\""+commentId+"\"></div>");
                var $div_userInfo = $("<div class=\"col-xs-4\" style=\"margin-left:20px; width:13%\" id=\""+userId+"\" ></div>");
                var anonymousHead="/images/co.png";
                var publicHead="/head/"+userId+".jpg";
                if(isAnonymous==true){
                    nickname="匿名";
                }
                var $div_nickname = $("<div class=\"row\" style=\"margin-left:-4px\"><a href=\"\" style=\"color:gray\"><span style=\"margin-left:12px; line-height: 0.8cm ;font-size: 10px\">"+nickname+"</span></a></div>");
                var $div_head = $("<div class=\"row\" style=\"margin-left:05px\"><a href=\"\" style=\"color:gray\"><img src=\""+publicHead+"\" alt=\"头像\" class=\"img-responsive img-circle\" style=\"float:left\"  width=\"30px\"/></a></div>");
                var $div_nohead = $("<div class=\"row\" style=\"margin-left:05px\"><a href=\"\" style=\"color:gray\"><img src=\""+anonymousHead+"\" alt=\"头像\" class=\"img-responsive img-circle\" style=\"float:left\"  width=\"30px\"/></a></div>");
                var $div_comment = $("<div class=\"col-xs-8\" style=\"margin-left:-30px;font-size: small\" id=\"comment\">"+comment+"</div><div><span style='color:gray;font-size: small'>"+commentDate+"</span><span style=\"font-size: small;color: gray\">   #"+(data.length-i)+"</span></div>");
                if(isAnonymous==true){
                    $div_userInfo.append($div_nohead);
                }else{
                    $div_userInfo.append($div_head);
                }
                $div_userInfo.append($div_nickname);
                $div_wrapper.append($div_userInfo);
                $div_wrapper.append($div_comment);
                $commentHtml.append($div_wrapper);
            }
        }
    })
}

function upVote(secretId) {
    var url="/secret/"+secretId+"/upvote";
    $.get(url,function (data) {
        if(data=="success"){
            var $upvoteBtn=$("#upvote-"+secretId);
            var $upvote=$upvoteBtn.find("span:eq(1)");
            var upvote=parseInt($upvote.html());
            $upvote.html(upvote+1);
            $upvoteBtn.addClass("disabled");
        }
    })
}

function downVote(secretId) {
    var url="/secret/"+secretId+"/downvote";
    $.get(url,function (data) {
        if(data=="success"){
            var $downvoteBtn=$("#downvote-"+secretId);
            var $downvote=$downvoteBtn.find("span:eq(1)");
            var downvote=parseInt($downvote.html());
            $downvote.html(downvote+1);
            $downvoteBtn.addClass("disabled");
        }
    })
}

function addComment(secretId) {
    var $form=$("#writeComment-"+secretId);
    var comment=$form.find("textarea:first-child").val();
    var anonymous=$form.find("input:checkbox").is(":checked");
    var url="/comment/add";
    $.post(url,
        {
            secretId:secretId,
            comment:comment,
            anonymous:anonymous
        },function (data) {
            if(data=="success"){
                var $commentCount=$("#commentCount");
                if($commentCount.html()=="评论"){
                    $commentCount.html(1);
                }else{
                    var commentCount=parseInt($commentCount.html());
                    $commentCount.html(commentCount+1);
                }
                viewComments(secretId);
            }else{
                alert("评论失败！");
            }
        })
}

