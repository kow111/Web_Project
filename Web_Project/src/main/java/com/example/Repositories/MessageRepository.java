package com.example.Repositories;

import com.example.Entity.Message;
import com.example.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.ArrayList;

public interface MessageRepository extends JpaRepository<Message,Long> {
    ArrayList<Message> findBySenderAndReceiver(User sender, User receiver);
    @Query(value = "SELECT coalesce(max(id), 0) FROM Message")
    public Long getMaxId();
}
