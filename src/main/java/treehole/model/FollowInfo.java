package treehole.model;
import treehole.entity.Follow;
import treehole.entity.User;

import java.util.Date;

public class FollowInfo {
    private int userId;
    private String nickname;
    private int followId;
    private String followNickName;
    private boolean isSpecialFollow;
    private Date followDate;


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

    public int getFollowId() {
        return followId;
    }

    public void setFollowId(int followId) {
        this.followId = followId;
    }

    public String getFollowNickName() {
        return followNickName;
    }

    public void setFollowNickName(String followNickName) {
        this.followNickName = followNickName;
    }

    public boolean isSpecialFollow() {
        return isSpecialFollow;
    }

    public void setSpecialFollow(boolean specialFollow) {
        isSpecialFollow = specialFollow;
    }

    public Date getFollowDate() {
        return followDate;
    }

    public void setFollowDate(Date followDate) {
        this.followDate = followDate;
    }
}
