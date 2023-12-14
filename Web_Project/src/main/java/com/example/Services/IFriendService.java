package com.example.Services;

import com.example.Entity.Friend;
import com.example.Entity.User;

import java.util.List;

public interface IFriendService {
    List<Friend> findByReceiver(User user);
    List<Friend> findBySender(User user);
    void deleteById(Long id);
    void submitFriendReq(Friend friend);
    void acceptFriend(Friend friend);
    boolean checkFriend(User user1, User user);
//    void deleteByUser(User user1, User user);

    void deleteFriend(User user1, User user);

    Friend findBySenderAndReceiverOrReceiverAndSender(User sender, User receiver);
    List<Friend> findByUser(User user);
}
