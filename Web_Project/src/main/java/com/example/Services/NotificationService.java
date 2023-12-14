package com.example.Services;

import com.example.Entity.Notification;
import com.example.Repositories.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
@Service
public class NotificationService implements INotificationService{
    @Autowired
    NotificationRepository notificationRepository;
    @Override
    public List<Notification> findByReceiver_UserID(Long id) {
        return notificationRepository.findByReceiver_UserID(id);
    }
    @Override
    public void submitNotificationA(Notification notification) {
        Date date = new Date();
        long time = date.getTime();
        Timestamp dateTime = new Timestamp(time);
        notification.setTime(dateTime);
        notification.setType(1);
        notificationRepository.save(notification);
    }
    @Override
    public void submitNotificationU(Notification notification) {
        Date date = new Date();
        long time = date.getTime();
        Timestamp dateTime = new Timestamp(time);
        notification.setTime(dateTime);
        notification.setType(2);
        notificationRepository.save(notification);
    }
    @Override
    public void deleteNotificationById(Long id) {
        notificationRepository.deleteNotificationById(id);
    }
}
