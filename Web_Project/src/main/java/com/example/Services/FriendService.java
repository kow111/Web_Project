package com.example.Services;

import com.example.Entity.Friend;
import com.example.Entity.User;
import com.example.Repositories.FriendRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FriendService implements IFriendService{
    @Autowired
    FriendRepository friendRepository;
    @Override
    public List<Friend> findByReceiver(User user) {
        return friendRepository.findByReceiver(user);
    }

    @Override
    public List<Friend> findBySender(User user) {
        return friendRepository.findBySender(user);
    }

    @Override
    public void deleteById(Long id) {
        friendRepository.deleteById(id);
    }

    @Override
    public void submitFriendReq(Friend friend) {
        friend.setStatus(false);
        friendRepository.save(friend);
    }

    @Override
    public void acceptFriend(Friend friend) {
        friend.setStatus(true);
        friendRepository.save(friend);
    }

    @Override
    public boolean checkFriend(User user1, User user) {
        return friendRepository.existsBySenderAndReceiverOrReceiverAndSender(user1,user,user1,user);
    }
    @Override
    public void deleteFriend(User user1, User user) {
        Friend friend = findBySenderAndReceiverOrReceiverAndSender(user1,user);
        friendRepository.delete(friend);
    }

    @Override
    public Friend findBySenderAndReceiverOrReceiverAndSender(User sender, User receiver) {
        return friendRepository.findBySenderAndReceiverOrReceiverAndSender(sender, receiver, sender,receiver);
    }

    @Override
    public List<Friend> findByUser(User user) {
        return friendRepository.findFriendsByUser(user);
    }
}
