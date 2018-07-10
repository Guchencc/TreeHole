package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.Follow;
import treehole.model.FollowInfo;
import treehole.repository.FollowRepository;

import java.util.Date;
import java.util.List;

@Service
public class FollowService implements IFollowService{
    private FollowRepository followRepository;

    @Autowired
    public FollowService(FollowRepository followRepository){
        this.followRepository=followRepository;
    }

    @Override
    public List<FollowInfo> getFollows(int userId) {
        return  followRepository.getFollowInfo(userId);
    }

    @Override
    public List<FollowInfo> getSpecialFollows(int userId) {
        return followRepository.getSpecialFollowInfo(userId);
    }

    @Override
    public void addFollow(int userId, int followId) {
        Follow follow=new Follow();
        follow.setUserId(userId);
        follow.setFollowId(followId);
        follow.setFollowDate(new Date());
        follow.setSpecialFollow(false);
        followRepository.add(follow);
    }

    @Override
    public void stopFollow(int userId, int followId) {
        followRepository.delete(userId,followId);
    }


    @Override
    public void setSpecialFollow(int userId, int followId) {
        Follow follow=followRepository.find(userId,followId);
        follow.setSpecialFollow(true);
        followRepository.update(follow);
    }

    @Override
    public void cancelSpecialFollow(int userId, int followId) {
        Follow follow=followRepository.find(userId, followId);
        follow.setSpecialFollow(false);
        followRepository.update(follow);
    }

    public boolean checkFollow(int userId,int followId){
        Follow follow=followRepository.find(userId,followId);
        if (follow==null)
            return false;
        else
            return true;
    }
}
