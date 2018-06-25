package treehole.entity;

import java.util.Date;

public class DriftingBottle {
    private String bottleId;
    private String wishId;
    private String userId;
    private Date throwDate;

    public String getBottleId() {
        return bottleId;
    }

    public void setBottleId(String bottleId) {
        this.bottleId = bottleId;
    }

    public String getWishId() {
        return wishId;
    }

    public void setWishId(String wishId) {
        this.wishId = wishId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getThrowDate() {
        return throwDate;
    }

    public void setThrowDate(Date throwDate) {
        this.throwDate = throwDate;
    }
}
