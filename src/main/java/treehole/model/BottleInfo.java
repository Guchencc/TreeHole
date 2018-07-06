package treehole.model;

import java.util.Date;

public class BottleInfo {
    private int bottleId;
    private int wishId;
    private int userId;
    private String nickname;
    private Date throwDate;
    private String wish;
    private boolean hasVideo;
    private boolean hasPicture;
    private boolean hasVoice;
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

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Date getThrowDate() {
        return throwDate;
    }

    public void setThrowDate(Date throwDate) {
        this.throwDate = throwDate;
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

    public boolean isAnonymous() {
        return isAnonymous;
    }

    public void setAnonymous(boolean anonymous) {
        isAnonymous = anonymous;
    }

    @Override
    public String toString() {
        return "BottleInfo{" +
                "bottleId=" + bottleId +
                ", wishId=" + wishId +
                ", userId=" + userId +
                ", nickname='" + nickname + '\'' +
                ", throwDate=" + throwDate +
                ", wish='" + wish + '\'' +
                ", hasVideo=" + hasVideo +
                ", hasPicture=" + hasPicture +
                ", hasVoice=" + hasVoice +
                '}';
    }
}
