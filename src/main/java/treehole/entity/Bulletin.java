package treehole.entity;

import java.util.Date;

public class Bulletin {
    private int bulletinId;
    private String text;
    private Date createDate;

    public int getBulletinId() {
        return bulletinId;
    }

    public void setBulletinId(int bulletinId) {
        this.bulletinId = bulletinId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
