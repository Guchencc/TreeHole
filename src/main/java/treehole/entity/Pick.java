package treehole.entity;

import java.util.Date;

public class Pick {
    private String userId;
    private String bottleId;
    private Date bottleDate;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBottleId() {
        return bottleId;
    }

    public void setBottleId(String bottleId) {
        this.bottleId = bottleId;
    }

    public Date getBottleDate() {
        return bottleDate;
    }

    public void setBottleDate(Date bottleDate) {
        this.bottleDate = bottleDate;
    }
}
