package treehole.entity;

import java.util.Date;

public class Follow {
    private int userId;
    private String followId;
    private boolean isSpecialFollow;
    private Date followDate;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFollowId() {
        return followId;
    }

    public void setFollowId(String followId) {
        this.followId = followId;
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
