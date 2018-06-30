package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.Follow;
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
    public List<Follow> getFollows(int userId) {
        return  followRepository.findByUserId(userId);
    }

    @Override
    public List<Follow> getSpecialFollows(int userId) {
        return followRepository.findSpecialFollow(userId);
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
}
