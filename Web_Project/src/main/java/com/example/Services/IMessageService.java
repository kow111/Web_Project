package com.example.Services;

import com.example.Entity.Message;
import com.example.Entity.User;

import java.util.ArrayList;

public interface IMessageService {
    ArrayList<Message> findBySenderAndReceiver(User sender, User receiver);
    void save(Message message);
}
