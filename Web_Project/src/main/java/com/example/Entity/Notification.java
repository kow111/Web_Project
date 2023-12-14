package com.example.Entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "[Notification]")
public class Notification {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String notif;
    @ManyToOne
    @JoinColumn(name = "sender")
    private User sender;
    @ManyToOne
    @JoinColumn(name = "receiver")
    private User receiver;
    @ManyToOne
    @JoinColumn(name = "article")
    private Article article;
    @Column(name = "Time")
    private Timestamp time;
    @Column(name = "Type")
    private int type;
    public Notification() {
    }

    public Notification(String notif, User sender, User receiver, Article article, Timestamp time, int type) {
        this.notif = notif;
        this.sender = sender;
        this.receiver = receiver;
        this.article = article;
        this.time = time;
        this.type = type;
    }

    public Notification(Long id, String notif, User sender, User receiver, Article article, Timestamp time, int type) {
        this.id = id;
        this.notif = notif;
        this.sender = sender;
        this.receiver = receiver;
        this.article = article;
        this.time = time;
        this.type = type;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNotif() {
        return notif;
    }

    public void setNotif(String notif) {
        this.notif = notif;
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

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}
