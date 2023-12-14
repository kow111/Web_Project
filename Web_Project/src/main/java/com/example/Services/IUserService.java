package com.example.Services;

import com.example.Entity.Article;
import com.example.Entity.User;

import java.util.ArrayList;
import java.util.Optional;

public interface IUserService {
    ArrayList<User> findAllUser();
    Optional<User> findByPhoneNumber(String phoneNumber);
    void submitUser(User user);
//    void updateUser(User user);
//    Optional<User> findByphoneNumber(String phoneNumber);
    boolean checkLogin(String username, String password);
    Optional<User> findById(Long userId);
    void updateUser(User user);
    int countPosts(User user);
    int countFriends(User user);
}
