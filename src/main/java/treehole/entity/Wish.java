package treehole.entity;

import java.util.Date;

public class Wish {
    private int wishId;
    private int userId;
    private String wish;
    private String videoPath;
    private String voicePath;
    private String picturePath;
    private Date createDate;
    private boolean isPublic;
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

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public String getVoicePath() {
        return voicePath;
    }

    public void setVoicePath(String voicePath) {
        this.voicePath = voicePath;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
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
                ", videoPath='" + videoPath + '\'' +
                ", voicePath='" + voicePath + '\'' +
                ", picturePath='" + picturePath + '\'' +
                ", createDate=" + createDate +
                ", isPublic=" + isPublic +
                ", isThrown=" + isThrown +
                '}';
    }
}
