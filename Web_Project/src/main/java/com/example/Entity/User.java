package com.example.Entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "[User]")
public class User {
    @Id
    @Column(name = "UserID")
    private long userID;
    @Column(name = "Name")
    private String name;
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "Image")
    private String image;
    @Column(name = "Password")
    private String password;
    @Column(name = "Active")
    private boolean active;

    @ManyToMany(mappedBy = "usersWhoLiked")
    private Set<Article> likedPosts = new HashSet<>();
    @OneToMany(mappedBy = "sender")
    private List<Friend> sentFriendRequests;

    @OneToMany(mappedBy = "receiver")
    private List<Friend> receivedFriendRequests;

    public User() {

    }
    public List<Friend> getSentFriendRequests() {
        return sentFriendRequests;
    }
    public void setSentFriendRequests(List<Friend> sentFriendRequests) {
        this.sentFriendRequests = sentFriendRequests;
    }
    public List<Friend> getReceivedFriendRequests() {
        return receivedFriendRequests;
    }

    public void setReceivedFriendRequests(List<Friend> receivedFriendRequests) {
        this.receivedFriendRequests = receivedFriendRequests;
    }

    public void likePost(Article post) {
        post.addUserToLikes(this);
    }

    public void unlikePost(Article post) {
        post.removeUserFromLikes(this);
    }
    public Set<Article> getLikedPosts() {
        return likedPosts;
    }

    public void setLikedPosts(Set<Article> likedPosts) {
        this.likedPosts = likedPosts;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public User(long userID, String name, String phoneNumber, String image, String password, boolean active) {
        this.userID = userID;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.image = image;
        this.password = password;
        this.active = active;
    }
}
