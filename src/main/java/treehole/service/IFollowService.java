package treehole.service;

import treehole.entity.Follow;
import treehole.model.FollowInfo;

import java.util.List;

public interface IFollowService {
    List<FollowInfo> getFollows(int userId);
    List<FollowInfo> getSpecialFollows(int userId);
    void addFollow(int userId,int followId);
    void stopFollow(int userId,int followId);
    void setSpecialFollow(int userId, int followId);
    void cancelSpecialFollow(int userId, int followId);
}
