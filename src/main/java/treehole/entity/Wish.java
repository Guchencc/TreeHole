package treehole.entity;

import java.util.Date;

public class Wish {
    private int wishId;
    private int userId;
    private String wish;
    private boolean hasVideo;
    private boolean hasPicture;
    private boolean hasVoice;
    private Date createDate;
    private boolean isPrivacy;
    private boolean isThrown;

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

    public String getWish() {
        return wish;
    }

    public void setWish(String wish) {
        this.wish = wish;
    }

    public boolean isHasVideo() {
        return hasVideo;
    }

    public void setHasVideo(boolean hasVideo) {
        this.hasVideo = hasVideo;
    }

    public boolean isHasPicture() {
        return hasPicture;
    }

    public void setHasPicture(boolean hasPicture) {
        this.hasPicture = hasPicture;
    }

    public boolean isHasVoice() {
        return hasVoice;
    }

    public void setHasVoice(boolean hasVoice) {
        this.hasVoice = hasVoice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public boolean isPrivacy() {
        return isPrivacy;
    }

    public void setPrivacy(boolean privacy) {
        isPrivacy = privacy;
    }

    public boolean isThrown() {
        return isThrown;
    }

    public void setThrown(boolean thrown) {
        isThrown = thrown;
    }

    @Override
    public String toString() {
        return "Wish{" +
                "wishId=" + wishId +
                ", userId=" + userId +
                ", wish='" + wish + '\'' +
                ", hasVideo=" + hasVideo +
                ", hasPicture=" + hasPicture +
                ", hasVoice=" + hasVoice +
                ", createDate=" + createDate +
                ", isPrivacy=" + isPrivacy +
                ", isThrown=" + isThrown +
                '}';
    }
}
