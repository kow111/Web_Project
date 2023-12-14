package com.example.Entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "[Message]")
public class Message {
    @Id
    @Column(name = "id")
    private Long id;
    @Column(name = "message")
    private String content;

    @ManyToOne
    @JoinColumn(name = "usersend") // Xác định tên cột khóa ngoại trong bảng Message
    private User sender;

    @ManyToOne
    @JoinColumn(name = "userreceive") // Xác định tên cột khóa ngoại trong bảng Message
    private User receiver;
    @Column(name = "Time")
    private Timestamp time;
    public Message() {
    }


    public Message(Long id, String content, User sender, User receiver, Timestamp time) {
        this.id = id;
        this.content = content;
        this.sender = sender;
        this.receiver = receiver;
        this.time = time;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getReceiver() {
        return receiver;
    }

    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }
}
