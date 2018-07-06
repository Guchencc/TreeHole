package treehole.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentInfo {
    private int commentId;
    private int secretId;
    private int userId;
    private String nickname;
    private String comment;
    private String commentDate;
    private boolean isAnonymous;


    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getSecretId() {
        return secretId;
    }

    public void setSecretId(int secretId) {
        this.secretId = secretId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        DateFormat bf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = bf.format(commentDate);
        this.commentDate = format;
    }

    public boolean isAnonymous() {
        return isAnonymous;
    }

    public void setAnonymous(boolean anonymous) {
        isAnonymous = anonymous;
    }
}
