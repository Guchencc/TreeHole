package treehole.entity;

import java.util.Date;

public class Pick {
    private int userId;
    private int bottleId;
    private Date bottleDate;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBottleId() {
        return bottleId;
    }

    public void setBottleId(int bottleId) {
        this.bottleId = bottleId;
    }

    public Date getBottleDate() {
        return bottleDate;
    }

    public void setBottleDate(Date bottleDate) {
        this.bottleDate = bottleDate;
    }
}
