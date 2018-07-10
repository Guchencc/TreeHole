package treehole.service;

import treehole.entity.*;
import treehole.exception.DuplicateException;
import treehole.exception.VerificationFailedException;
import treehole.model.UserProfile;

public interface IUserService {
    User login(String username,String password) throws VerificationFailedException;
    void register(User user) throws DuplicateException;
    UserProfile getProfile(int userId);
    void updateProfile(User user);





}
