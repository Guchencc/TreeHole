package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.*;
import treehole.exception.DuplicateException;
import treehole.exception.VerificationFailedException;
import treehole.repository.UserRepository;

import java.util.List;

@Service
public class UserService implements IUserService {

    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository){
        this.userRepository=userRepository;
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

    @Override
    public User getProfile(int userId) {
      return userRepository.findById(userId);
    }

    @Override
    public void updateProfile(User user) {
        userRepository.update(user);
    }

}
