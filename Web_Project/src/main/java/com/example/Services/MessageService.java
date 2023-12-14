package com.example.Services;

import com.example.Entity.Message;
import com.example.Entity.User;
import com.example.Repositories.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

@Service
public class MessageService implements IMessageService{
    @Autowired
    MessageRepository messageRepository;

    @Override
    public ArrayList<Message> findBySenderAndReceiver(User sender, User receiver) {
        return messageRepository.findBySenderAndReceiver(sender,receiver);
    }

    @Override
    public void save(Message message) {
        Date date = new Date();
        long time = date.getTime();
        Timestamp dateTime = new Timestamp(time);
        message.setId(messageRepository.getMaxId()+1);
        message.setTime(dateTime);
        messageRepository.save(message);
    }
}
