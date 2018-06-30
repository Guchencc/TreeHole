package treehole.service;

import treehole.entity.Wish;

import java.util.List;

public interface IWishService {
    List<Wish> getWishes(int userId);
    void writerWish(Wish wish);
    Wish getWish(int wishId);
    void deleteWish(int wishId);
}
