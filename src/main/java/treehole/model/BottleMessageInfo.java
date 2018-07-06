package treehole.model;

import java.util.Date;

public class BottleMessageInfo {
    private int messageId;
    private int userId;
    private String nickname;
    private int gender;
    private String message;
    private Date writeDate;
    private boolean isAnonymous;

    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
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

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(Date writeDate) {
        this.writeDate = writeDate;
    }

    public boolean isAnonymous() {
        return isAnonymous;
    }

    public void setAnonymous(boolean anonymous) {
        isAnonymous = anonymous;
    }

    @Override
    public String toString() {
        return "BottleMessageInfo{" +
                "messageId=" + messageId +
                ", userId=" + userId +
                ", nickname='" + nickname + '\'' +
                ", gender=" + gender +
                ", message='" + message + '\'' +
                ", writeDate=" + writeDate +
                ", isAnonymous=" + isAnonymous +
                '}';
    }
}
