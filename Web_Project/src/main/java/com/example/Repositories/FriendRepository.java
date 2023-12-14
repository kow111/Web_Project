package com.example.Repositories;

import com.example.Entity.Friend;
import com.example.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FriendRepository extends JpaRepository<Friend,Long> {
    List<Friend> findByReceiver(User user);
    List<Friend> findBySender(User user);
    void deleteById(Long id);
    boolean existsBySenderAndReceiverOrReceiverAndSender(User sender, User receiver, User receiver2, User sender2);
    void deleteBySenderAndReceiverOrReceiverAndSender(User sender, User receiver, User receiver2, User sender2);
    Friend findBySenderAndReceiverOrReceiverAndSender(User sender, User receiver, User receiver2, User sender2);
//    List<Friend> findByReceiverOrSender(User receiver, User sender);
    @Query("SELECT f FROM Friend f WHERE (f.receiver = :user OR f.sender = :user) AND f.status=true")
    List<Friend> findFriendsByUser(@Param("user") User user);
}
