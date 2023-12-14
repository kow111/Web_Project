package com.example.Entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "[Comment]")
public class Comment {
    @Id
    @Column(name = "id")
    private Long id;
    @ManyToOne(fetch = FetchType.LAZY) // Đây là quan hệ Many-to-One
    @JoinColumn(name = "UserID") // Tên cột trong bảng "Comment" để lưu trữ khóa ngoại đến User
    private User user;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ArticleID") // Tên cột trong bảng "Comment" để lưu trữ khóa ngoại đến Post
    private Article article;
    @Column(name = "Comment")
    private String content;
    @Column(name = "Time")
    private Timestamp time;
    @Column(name ="Image")
    private String image;
    public Comment() {
    }

    public Comment(Long id, User user, Article article, String content, Timestamp time, String image) {
        this.id = id;
        this.user = user;
        this.article = article;
        this.content = content;
        this.time = time;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
