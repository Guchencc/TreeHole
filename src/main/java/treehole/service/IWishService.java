package treehole.service;

import treehole.entity.Wish;
import treehole.model.PageBean;
import treehole.model.WishInfo;

import java.util.List;

public interface IWishService {
    List<Wish> getWishes(int userId);
    void writerWish(Wish wish);
    Wish getWish(int wishId);
    void deleteWish(int wishId);
    void setThrown(int wishId);
    void updateWish(Wish wish);

    PageBean<WishInfo> getPublicWishPageByUserId(int pageNum, int pageSize, int userId);
}
