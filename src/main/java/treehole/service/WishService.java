package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.Secret;
import treehole.entity.Wish;
import treehole.model.PageBean;
import treehole.model.SecretInfo;
import treehole.model.WishInfo;
import treehole.repository.WishRepository;

import java.util.List;

@Service
public class WishService implements IWishService {
    private WishRepository wishRepository;

    @Autowired
    public WishService(WishRepository wishRepository) {
        this.wishRepository=wishRepository;
    }

    @Override
    public List<Wish> getWishes(int userId) {
        return wishRepository.findByUserId(userId);
    }

    @Override
    public void writerWish(Wish wish) {
        wishRepository.add(wish);
    }

    @Override
    public Wish getWish(int wishId) {
        return wishRepository.findByWishId(wishId);
    }

    @Override
    public void deleteWish(int wishId) {
        wishRepository.delete(wishId);
    }

    @Override
    public void setThrown(int wishId) {
        Wish wish=wishRepository.findByWishId(wishId);
        wish.setThrown(true);
        wishRepository.update(wish);
    }

    @Override
    public void updateWish(Wish wish) {
        wishRepository.update(wish);
    }

    @Override
    public PageBean<WishInfo> getPublicWishPageByUserId(int pageNum, int pageSize, int userId) {
        List<Wish> wishes=wishRepository.findPublicByUserId(userId);
        int totalRecord=wishes.size();
        PageBean<WishInfo> pageBean=new PageBean<>(pageNum,pageSize,totalRecord);
        int startIndex=pageBean.getStartIndex();
        pageBean.setList(wishRepository.findPublicWishPageByUserId(startIndex,pageSize,userId));
        return pageBean;
    }
}
