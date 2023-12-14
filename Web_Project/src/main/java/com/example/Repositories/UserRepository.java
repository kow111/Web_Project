package com.example.Repositories;

import com.example.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

public interface UserRepository extends JpaRepository<User, Long> {
    ArrayList<User> findAll();
    @Query(value = "SELECT coalesce(max(userID), 0) FROM User")
    Long getMaxId();
//    Optional<User> findByphoneNumber(String phoneNumber);
    Optional<User> findByPhoneNumber(String phoneNumber);

    Optional<User> findByUserID(Long userId);
    @Query("SELECT COUNT(f) FROM Friend f WHERE (f.sender = :user OR f.receiver = :user) AND f.status=true ")
    int countFriends(@Param("user") User user);

    // Đếm số lượng bài viết của một người dùng
    @Query("SELECT COUNT(a) FROM Article a WHERE a.user = :user")
    int countPosts(@Param("user") User user);

    boolean existsByPhoneNumber(String phoneNumber);
}
