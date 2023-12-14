package com.example.Repositories;

import com.example.Entity.Notification;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NotificationRepository extends JpaRepository<Notification,Long> {
    List<Notification> findByReceiver_UserID(Long id);
    void deleteNotificationById(Long id);
}
