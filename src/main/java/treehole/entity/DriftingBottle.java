package treehole.entity;

import java.util.Date;

public class DriftingBottle {
    private int bottleId;
    private int wishId;
    private int userId;
    private Date throwDate;
    private String pickedUsers;
    private int pickCount;
    private boolean isAnonymous;


    public int getBottleId() {
        return bottleId;
    }

    public void setBottleId(int bottleId) {
        this.bottleId = bottleId;
    }

    public int getWishId() {
        return wishId;
    }

    public void setWishId(int wishId) {
        this.wishId = wishId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getThrowDate() {
        return throwDate;
    }

    public void setThrowDate(Date throwDate) {
        this.throwDate = throwDate;
    }

    public String getPickedUsers() {
        return pickedUsers;
    }

    public void setPickedUsers(String pickedUsers) {
        this.pickedUsers = pickedUsers;
    }

    public int getPickCount() {
        return pickCount;
    }

    public void setPickCount(int pickCount) {
        this.pickCount = pickCount;
    }

    public boolean isAnonymous() {
        return isAnonymous;
    }

    public void setAnonymous(boolean anonymous) {
        isAnonymous = anonymous;
    }
}
