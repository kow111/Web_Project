package com.example.Services;

import com.example.Entity.User;
import com.example.Repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class UserService implements IUserService{
    @Autowired
    UserRepository userRepository;

    @Override
    public ArrayList<User> findAllUser() {
        return userRepository.findAll();
    }

    @Override
    public Optional<User> findByPhoneNumber(String phoneNumber) {
        return userRepository.findByPhoneNumber(phoneNumber);
    }

    @Override
    public boolean checkLogin(String username, String password) {
        Optional<User> user = userRepository.findByPhoneNumber(username);
        if(user.isPresent() && user.get().getPassword().equals(password)){
            return true;
        }
        return false;
    }

    @Override
    public Optional<User> findById(Long userId) {
        return userRepository.findByUserID(userId);
    }

    //
    @Override
    public void submitUser(User user) {
        user.setActive(true);
        user.setUserID(userRepository.getMaxId()+1);
        userRepository.save(user);
    }

    @Override
    public void updateUser(User user) {
        userRepository.save(user);
    }
    @Override
    public int countFriends(User user) {
        return userRepository.countFriends(user);
    }
    @Override
    public int countPosts(User user) {
        return userRepository.countPosts(user);
    }
}
