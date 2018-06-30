package treehole.model;

import treehole.entity.Follow;
import treehole.entity.User;
import treehole.entity.Wish;

import java.util.Date;
import java.util.List;

public class UserProfile {
    private User user;
    private String headPicture;

    public UserProfile(User user, String headPicture) {
        this.user = user;
        this.headPicture = headPicture;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getHeadPicture() {
        return headPicture;
    }

    public void setHeadPicture(String headPicture) {
        this.headPicture = headPicture;
    }
}
