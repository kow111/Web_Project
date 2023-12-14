package com.example.Controllers;

import com.example.Entity.*;
import com.example.Services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

//@RestController
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    IUserService userService;
    @Autowired
    IMessageService messageService;
    @Autowired
    IFriendService friendService;
    @Autowired
    INotificationService notificationService;
    @Autowired
    FirebaseStorageService firebaseStorageService;
    @ModelAttribute("notics")
    public List<Notification> getNotifications(HttpSession session) {
        // Lấy thông tin user từ session hoặc từ request, tùy thuộc vào cách bạn triển khai
        Long userId =(Long) session.getAttribute("id");
        List<Notification> notifications = notificationService.findByReceiver_UserID(userId);
        notifications.sort(Comparator.comparing(Notification::getId).reversed());
        // Lấy danh sách thông báo
        return notifications;
    }
    @ModelAttribute("userOwn")
    public User getUserOwn(HttpSession session){
        return userService.findById((Long) session.getAttribute("id")).get();
    }
    @GetMapping(value ="/getUser")
    public String GetArticlesRest(ModelMap modelMap, HttpSession session){
        User user = userService.findById((Long) session.getAttribute("id")).get();
        ArrayList<User> users = userService.findAllUser();
        List<Friend> friends = friendService.findByUser(user);
        modelMap.addAttribute("users",users);
        modelMap.addAttribute("friends",friends);
        return "userListTest";
    }
    @GetMapping("/Inbox/{userID}")
    public String GetInbox(ModelMap modelMap, @PathVariable Long userID, HttpSession session){
        User user = userService.findById((Long) session.getAttribute("id")).get();
        User user2 = userService.findById(userID).get();
        ArrayList<Message> messages=messageService.findBySenderAndReceiver(user,user2);
        ArrayList<Message> messages1 = messageService.findBySenderAndReceiver(user2,user);
        messages.addAll(messages1);
        messages.sort(Comparator.comparing(Message::getId));
        modelMap.addAttribute("messages", messages);
        modelMap.addAttribute("message", new Message());
        modelMap.addAttribute("users", userService.findAllUser());
        modelMap.addAttribute("user",user2);
        modelMap.addAttribute("UserId", userID);
        return "inboxTest";
    }
    @PostMapping("/Inbox/{userID}")
    public String PostInbox(ModelMap modelMap, @PathVariable Long userID, HttpSession session,
                            @ModelAttribute("message") Message message){
        User user = userService.findById((Long) session.getAttribute("id")).get();
        User user2 = userService.findById(userID).get();
        message.setSender(user);
        message.setReceiver(user2);
        messageService.save(message);
        return "redirect:/user/Inbox/{userID}";
    }
    @PostMapping("/addFriend/{userID}")
    public String addFriend(ModelMap modelMap, @PathVariable Long userID, HttpSession session) {
        User user = userService.findById((Long) session.getAttribute("id")).get();
        User user1 = userService.findById(userID).get();
        Friend friend = new Friend();
        friend.setSender(user);
        friend.setReceiver(user1);
        friendService.submitFriendReq(friend);
        Notification notification = new Notification();
        notification.setReceiver(user1);
        notification.setSender(user);
        notification.setNotif(user.getName()+" đã gửi yêu cầu kết bạn");
        notificationService.submitNotificationU(notification);
        return "redirect:/article/user/"+userID;
    }
    @PostMapping("/accept/{userID}")
    public String acceptFriend(ModelMap modelMap, @PathVariable Long userID, HttpSession session) {
        User user = userService.findById((Long) session.getAttribute("id")).get();
        User user1 = userService.findById(userID).get();
        Friend friend = friendService.findBySenderAndReceiverOrReceiverAndSender(user,user1);
        friendService.acceptFriend(friend);
        Notification notification = new Notification();
        notification.setReceiver(user1);
        notification.setSender(user);
        notification.setNotif(user.getName()+" đã chấp nhận yêu cầu kết bạn");
        notificationService.submitNotificationU(notification);
        return "redirect:/article/user/"+userID;
    }
    @PostMapping("/delete/{userID}")
    public String deleteFriend(ModelMap modelMap, @PathVariable Long userID, HttpSession session) {
        User user = userService.findById((Long) session.getAttribute("id")).get();
        User user1 = userService.findById(userID).get();
        friendService.deleteFriend(user,user1);
        return "redirect:/article/user/"+userID;
    }
    @GetMapping("/update")
    public String getUpdateUser(ModelMap modelMap, HttpSession session) {
        User user = userService.findById((Long) session.getAttribute("id")).get();
        modelMap.addAttribute("user",user);
        return "updateUser";
    }
    @PostMapping("/update/{userID}")
    public String updateUser(ModelMap modelMap,
                             @PathVariable Long userID,
                             @ModelAttribute("user") User user,
                             @RequestParam("images") MultipartFile file,
                             HttpSession session) throws IOException {
        User foundUser = userService.findById((Long) session.getAttribute("id")).get();
        if(!Objects.equals(user.getPhoneNumber(), foundUser.getPhoneNumber()) && userService.findByPhoneNumber(user.getPhoneNumber()).isPresent()){
            modelMap.addAttribute("user",foundUser);
            modelMap.addAttribute("error","Phone number exist!!");
            return "updateUser";
        }
        if(!user.getName().isEmpty()){
            foundUser.setName(user.getName());
        }
        if (!user.getPhoneNumber().isEmpty() ) {
            foundUser.setPhoneNumber(user.getPhoneNumber());
        }
        if (!user.getPassword().isEmpty() ) {
            foundUser.setPassword(user.getPassword());
        }
        if(!file.isEmpty()){
            String fileName = System.currentTimeMillis() +".jpg";
            foundUser.setImage(fileName);
            InputStream inputStream = file.getInputStream();
            firebaseStorageService.uploadImageU(inputStream,fileName);
            inputStream.close();
        }
        userService.updateUser(foundUser);
        return "redirect:/article/user/"+userID;
    }
}
