package treehole.model;

import java.util.Date;

public class UserProfile {
    private int userId;
    private String nickname;
    private int gender;
    private String birthday;
    private String treeholeAge;
    private int secretCount;
    private int wishCount;
    private int followCount;
    private int fansCount;

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

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getTreeholeAge() {
        return treeholeAge;
    }

    public void setTreeholeAge(String treeholeAge) {
        this.treeholeAge = treeholeAge;
    }

    public int getSecretCount() {
        return secretCount;
    }

    public void setSecretCount(int secretCount) {
        this.secretCount = secretCount;
    }

    public int getFollowCount() {
        return followCount;
    }

    public void setFollowCount(int followCount) {
        this.followCount = followCount;
    }

    public int getFansCount() {
        return fansCount;
    }

    public void setFansCount(int fansCount) {
        this.fansCount = fansCount;
    }

    public int getWishCount() {
        return wishCount;
    }

    public void setWishCount(int wishCount) {
        this.wishCount = wishCount;
    }

    @Override
    public String toString() {
        return "UserProfile{" +
                "userId=" + userId +
                ", nickname='" + nickname + '\'' +
                ", gender=" + gender +
                ", birthday='" + birthday + '\'' +
                ", treeholeAge='" + treeholeAge + '\'' +
                ", secretCount=" + secretCount +
                ", wishCount=" + wishCount +
                ", followCount=" + followCount +
                ", fansCount=" + fansCount +
                '}';
    }
}
