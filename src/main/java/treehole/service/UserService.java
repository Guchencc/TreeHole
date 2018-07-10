package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.*;
import treehole.exception.DuplicateException;
import treehole.exception.VerificationFailedException;
import treehole.model.FollowInfo;
import treehole.model.PageBean;
import treehole.model.UserProfile;
import treehole.repository.FollowRepository;
import treehole.repository.SecretRepository;
import treehole.repository.UserRepository;
import treehole.repository.WishRepository;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class UserService implements IUserService {

    private UserRepository userRepository;
    private SecretRepository secretRepository;
    private FollowRepository followRepository;
    private WishRepository wishRepository;

    @Autowired
    public UserService(UserRepository userRepository,
                       SecretRepository secretRepository,
                       FollowRepository followRepository,
                       WishRepository wishRepository){
        this.userRepository=userRepository;
        this.secretRepository=secretRepository;
        this.followRepository=followRepository;
        this.wishRepository=wishRepository;
    }

    @Override
    public User login(String username, String password) throws VerificationFailedException {
        User user=userRepository.findByUserName(username);
        if (!user.getPassword().trim().equals(password)){
            throw new VerificationFailedException("账户秘密错误！");
        }
        return user;
    }

    @Override
    public void register(User user) throws DuplicateException {
        if (userRepository.findByUserName(user.getUsername())!=null){
            throw new DuplicateException("用户名："+user.getUsername()+" 已存在！");
        }else if(userRepository.findByEmail(user.getEmail())!=null){
            throw new DuplicateException("邮箱："+user.getEmail()+" 已被注册！");
        }
        userRepository.add(user);
    }

    public String checkUsername(String username){
        if(userRepository.findByUserName(username)==null){
            return "true";
        }
        return "false";
    }

    public String checkEmail(String email){
        if(userRepository.findByEmail(email)==null){
            return "true";
        }
        return "false";
    }

    @Override
    public UserProfile getProfile(int userId) {
        UserProfile profile=new UserProfile();
        profile.setUserId(userId);
        User user=userRepository.findById(userId);
        profile.setNickname(user.getNickname());
        profile.setGender(user.getGender());
        SimpleDateFormat sdf1=new SimpleDateFormat("MM月dd日");
       /* Date createDate=user.getCreateDate();*/
        profile.setBirthday(sdf1.format(user.getBirthday()));
        profile.setSecretCount(secretRepository.findByUserId(userId).size());
        profile.setFollowCount(followRepository.findFollowUsers(userId).size());
        profile.setFansCount(followRepository.findFans(userId).size());
        profile.setWishCount(wishRepository.findByUserId(userId).size());
        return profile;
    }

    @Override
    public void updateProfile(User user) {
        userRepository.update(user);
    }

    public PageBean<FollowInfo> getFollowPageByUserId(int pageNum, int pageSize, int userId) {
        List<User> users=followRepository.findFollowUsers(userId);
        int totalRecord=users.size();
        PageBean<FollowInfo> pageBean=new PageBean<>(pageNum,pageSize,totalRecord);
        int startIndex=pageBean.getStartIndex();
        pageBean.setList(followRepository.findFollowPage(startIndex,pageSize,userId));
        return pageBean;
    }

    public PageBean<FollowInfo> getFanPageByUserId(int pageNum, int pageSize, int userId) {
        List<User> fans=followRepository.findFans(userId);
        int totalRecord=fans.size();
        PageBean<FollowInfo> pageBean=new PageBean<>(pageNum,pageSize,totalRecord);
        int startIndex=pageBean.getStartIndex();
        pageBean.setList(followRepository.findFanPage(startIndex,pageSize,userId));
        return pageBean;
    }
}
