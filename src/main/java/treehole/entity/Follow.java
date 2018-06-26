package treehole.entity;

import java.util.Date;

public class Follow {
    private int userId;
    private String followUserId;
    private boolean isSpecialFollow;
    private Date followDate;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFollowUserId() {
        return followUserId;
    }

    public void setFollowUserId(String followUserId) {
        this.followUserId = followUserId;
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
