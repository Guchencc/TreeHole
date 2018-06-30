package treehole.service;

import treehole.entity.Follow;

import java.util.List;

public interface IFollowService {
    List<Follow> getFollows(int userId);
    List<Follow> getSpecialFollows(int userId);
    void addFollow(int userId,int followId);
    void stopFollow(int userId,int followId);
    void setSpecialFollow(int userId, int followId);
    void cancelSpecialFollow(int userId, int followId);
}
