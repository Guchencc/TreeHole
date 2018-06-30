package treehole.service;

import sun.plugin.util.UserProfile;
import treehole.entity.*;
import treehole.exception.DuplicateException;
import treehole.exception.VerificationFailedException;

import java.util.List;

public interface IUserService {
    User login(String username,String password) throws VerificationFailedException;
    void register(User user) throws DuplicateException;
    User getProfile(int userId);
    void updateProfile(User user);





}
