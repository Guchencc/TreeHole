package treehole.model;

import treehole.entity.Secret;
import treehole.entity.User;

import java.util.Date;
public class SecretInfo{
    private int secretId;
    private int userId;
    private String nickname;
    private String content;
    private String tags;
    private boolean isAnonymous;
    private Date createDate;
    private int upVote;
    private int downVote;
    private int commentCount;

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public boolean isAnonymous() {
        return isAnonymous;
    }

    public void setAnonymous(boolean anonymous) {
        isAnonymous = anonymous;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getUpVote() {
        return upVote;
    }

    public void setUpVote(int upVote) {
        this.upVote = upVote;
    }

    public int getDownVote() {
        return downVote;
    }

    public void setDownVote(int downVote) {
        this.downVote = downVote;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    @Override
    public String toString() {
        return "SecretInfo{" +
                "secretId=" + secretId +
                ", userId=" + userId +
                ", nickname='" + nickname + '\'' +
                ", content='" + content + '\'' +
                ", tags='" + tags + '\'' +
                ", isAnonymous=" + isAnonymous +
                ", createDate=" + createDate +
                ", upVote=" + upVote +
                ", downVote=" + downVote +
                ", commentCount=" + commentCount +
                '}';
    }
}