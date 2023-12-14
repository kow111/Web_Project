package com.example.Services;

import com.example.Entity.Notification;

import java.util.List;

public interface INotificationService {
    List<Notification> findByReceiver_UserID(Long id);
    void submitNotificationA(Notification notification);
    void submitNotificationU(Notification notification);
    void deleteNotificationById(Long id);
}
