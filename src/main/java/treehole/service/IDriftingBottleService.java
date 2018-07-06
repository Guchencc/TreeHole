package treehole.service;

import treehole.entity.DriftingBottle;
import treehole.model.BottleInfo;

import java.util.List;

public interface IDriftingBottleService {
    List<BottleInfo> getThrownBottles(int userId);
    List<BottleInfo> getPickedBottles(int userId);
    BottleInfo getBottleInfo(int bottleId);
    int getBottleFromWish(int wishId);
    void throwBottleIntoWishSea(int wishId,int userId,boolean isAnonymous);
}
