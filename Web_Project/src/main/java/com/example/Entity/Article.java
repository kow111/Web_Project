package com.example.Entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.*;

@Entity
@Table(name = "[Article]")
public class Article {
    @Id
    @Column(name = "ArticleID")
    private Long articleID;
    @ManyToOne
    @JoinColumn(name = "UserID")
    private User user;
    @Column(name = "Description")
    private String description;
    @Column(name ="Image")
    private String image;
    @Column(name = "Likes")
    private int likes;
    @Column(name = "Time")
    private Timestamp time;
//    @JsonIgnore
    @ManyToMany(cascade = CascadeType.REMOVE)
    @JoinTable(
            name = "[Like]", // Tên bảng liên kết giữa User và Post
            joinColumns = @JoinColumn(name = "ArticleID"), // Tên cột khóa ngoại trong bảng user_post_likes liên quan đến User
            inverseJoinColumns = @JoinColumn(name = "UserID") // Tên cột khóa ngoại trong bảng user_post_likes liên quan đến Post
    )
    private Set<User> usersWhoLiked = new HashSet<>();
    @OneToMany(mappedBy = "article", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Comment> comments = new ArrayList<>();
    @OneToMany(mappedBy = "article", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Notification> notifications = new ArrayList<>();

    public List<Notification> getNotifications() {
        return notifications;
    }

    public void setNotifications(List<Notification> notifications) {
        this.notifications = notifications;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public void addUserToLikes(User user) {
        usersWhoLiked.add(user);
        user.getLikedPosts().add(this);
    }

    public void removeUserFromLikes(User user) {
        usersWhoLiked.remove(user);
        user.getLikedPosts().remove(this);
    }
    public Set<User> getUsersWhoLiked() {
        return usersWhoLiked;
    }

    public void setUsersWhoLiked(Set<User> usersWhoLiked) {
        this.usersWhoLiked = usersWhoLiked;
    }

    public Article(Long articleID, User user, String description, String image, int likes, Timestamp time) {
        this.articleID = articleID;
        this.user = user;
        this.description = description;
        this.image = image;
        this.likes = likes;
        this.time = time;
    }

    public Article() {

    }

    public Long getArticleID() {
        return articleID;
    }

    public void setArticleID(Long articleID) {
        this.articleID = articleID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
}
