package com.example.Controllers;

import com.example.Entity.*;
import com.example.Repositories.UserRepository;
import com.example.Services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Controller
@RequestMapping("/article")
public class ArticleController {
    @Autowired
    ICommentService commentService;
    @Autowired
    IArticleService articleService;
    @Autowired
    IUserService userService;
    @Autowired
    INotificationService notificationService;
    @Autowired
    IFriendService friendService;
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
    //localhost:8080/article/getArticle
    @GetMapping(value ="/getArticle")
    public String GetArticles(ModelMap modelMap, HttpSession session){
        ArrayList<Article> articles = articleService.getAllArticle();
        articles.sort(Comparator.comparing(Article::getTime).reversed());
        modelMap.addAttribute("articles",articles);
        modelMap.addAttribute("article", new Article());
//        modelMap.addAttribute("notics",notificationService.findByReceiver_UserID(id));
        return "articleListTest";
    }
    //localhost:8080/article/insertArticle
    @PostMapping(value ="/insertArticle")
    public String InsertArticle(ModelMap modelMap,
                                @RequestParam("images")MultipartFile file,
                                @ModelAttribute("article") Article article, HttpSession session) throws IOException {
        User user = userService.findById((Long) session.getAttribute("id")).get();
        if(!file.isEmpty()){
            String fileName = System.currentTimeMillis() +".jpg";
            InputStream inputStream = file.getInputStream();
            firebaseStorageService.uploadImageA(inputStream,fileName);
            inputStream.close();
            article.setImage(fileName);
        }
        article.setUser(user);
        ArrayList<Article> articles = articleService.submitArticle(article);
        modelMap.addAttribute("articles",articles);
        return "redirect:/article/getArticle";
    }
    @PostMapping (value ="/deleteArticle/{articleID}")
    public String DeleteArticle(ModelMap modelMap,@PathVariable("articleID")Long articleID, HttpSession session){
        articleService.clearLike(articleID);
//        commentService.deleteByArticle_ArticleID(articleID);
        ArrayList<Article> articles = articleService.deleteArticle(articleID);
        modelMap.addAttribute("articles",articles);
        return "redirect:/article/getArticle";
    }
    @GetMapping(value = "/updateArticle/{articleId}")
    public String UpdateArticle(ModelMap modelMap,@PathVariable Long articleId, HttpSession session){
        modelMap.addAttribute("article", articleService.findArticleById(articleId).get());
        return "updateArticleTest";
    }
    @PostMapping(value = "/updateArticle/{articleId}")
    public String UpdateArticle(ModelMap modelMap,
                                @RequestParam("images")MultipartFile file,
                                @ModelAttribute("article") Article article,
                                BindingResult bindingResult,
                                @PathVariable Long articleId,
                                HttpSession session){
        try {
            if (articleService.findArticleById(articleId).isPresent()){
                Article foundArticle = articleService.findArticleById(articleId).get();
                foundArticle.setDescription(article.getDescription());
                if(!file.isEmpty()){
                    String fileName = System.currentTimeMillis() +".jpg";
                    foundArticle.setImage(fileName);
                    InputStream inputStream = file.getInputStream();
                    firebaseStorageService.uploadImageA(inputStream,fileName);
                    inputStream.close();
                }
                articleService.save(foundArticle);
            }
        }catch(Exception e) {
            return "updateArticle";
        }
        return "redirect:/article/getArticle";
    }
    @PostMapping (value ="/LikeArticle/{articleID}")
    public ResponseEntity<Integer> likePost(ModelMap modelMap,@PathVariable("articleID")Long articleID, HttpSession session){
        Set<User> Likeset = null;
        Article foundArticle = articleService.findArticleById(articleID).get();
        User user = userService.findById((Long) session.getAttribute("id")).get();
        Likeset = foundArticle.getUsersWhoLiked();
        if(Likeset.contains(user)){
            foundArticle.removeUserFromLikes(user);
        }
        else {
            foundArticle.addUserToLikes(user);
            if(user != foundArticle.getUser()){
                Notification notification = new Notification();
                notification.setArticle(foundArticle);
                notification.setReceiver(foundArticle.getUser());
                notification.setSender(user);
                notification.setNotif(user.getName()+" đã like bài viết của bạn");
                notificationService.submitNotificationA(notification);
            }
        }
        foundArticle.setLikes(foundArticle.getUsersWhoLiked().size());
        articleService.save(foundArticle);
        return ResponseEntity.ok(foundArticle.getLikes());
    }
    @GetMapping(value = "/Comment/{articleID}")
    public String GetCommentArticle(ModelMap modelMap, @PathVariable Long articleID, HttpSession session){
        List<Comment> comments = commentService.findByArticle_ArticleID(articleID);
        User user = userService.findById((Long) session.getAttribute("id")).get();
        comments.sort(Comparator.comparing(Comment::getId).reversed());
        modelMap.addAttribute("comments",comments);
        modelMap.addAttribute("articleId",articleID);
        modelMap.addAttribute("comment", new Comment());
        modelMap.addAttribute("article", articleService.findArticleById(articleID).get());
        return "detailArticle";
    }
    @PostMapping(value = "/addComment/{articleID}")
    public String AddComment(ModelMap modelMap,
                             @PathVariable Long articleID,
                             @RequestParam("images")MultipartFile file,
                             @ModelAttribute("comment") Comment comment,
                             HttpSession session) throws IOException {
        Article foundArticle = articleService.findArticleById(articleID).get();
        User user = userService.findById((Long) session.getAttribute("id")).get();
        comment.setUser(user);
        comment.setArticle(foundArticle);
        if(!file.isEmpty()){
            String fileName = System.currentTimeMillis() +".jpg";
            comment.setImage(fileName);
            InputStream inputStream = file.getInputStream();
            firebaseStorageService.uploadImageC(inputStream,fileName);
            inputStream.close();
        }
        if(user != foundArticle.getUser()){
            Notification notification = new Notification();
            notification.setArticle(foundArticle);
            notification.setReceiver(foundArticle.getUser());
            notification.setSender(user);
            notification.setNotif(user.getName()+" đã comment bài viết của bạn");
            notificationService.submitNotificationA(notification);
        }
        commentService.submitComment(comment);
        return "redirect:/article/Comment/"+articleID;
    }
    @GetMapping(value = "/updateComment/{commentId}")
    public String UpdateComment(ModelMap modelMap,

                                @PathVariable Long commentId,
                                HttpSession session){
        Comment comment = commentService.findById(commentId).get();
        User user = userService.findById((Long) session.getAttribute("id")).get();
        List<Comment> comments = commentService.findByArticle_ArticleID(comment.getArticle().getArticleID());
        Long articleID = comment.getArticle().getArticleID();
        modelMap.addAttribute("comment",commentService.findById(commentId).get());
        modelMap.addAttribute("comments",comments);
        modelMap.addAttribute("articleId",articleID);
        modelMap.addAttribute("article", articleService.findArticleById(articleID).get());
        return "detailArticle";
    }
    @PostMapping(value = "/updateComment/{commentId}")
    public String UpdateComment(ModelMap modelMap,
                                @RequestParam("images")MultipartFile file,
                                @PathVariable Long commentId,
                                @ModelAttribute("comment") Comment comment,
                                HttpSession session) throws IOException {
        Comment foundComment = commentService.findById(commentId).get();
        foundComment.setContent(comment.getContent());
        if(!file.isEmpty()){
            String fileName = System.currentTimeMillis() +".jpg";
            foundComment.setImage(fileName);
            InputStream inputStream = file.getInputStream();
            firebaseStorageService.uploadImageC(inputStream,fileName);
            inputStream.close();
        }
        commentService.save(foundComment);
        return "redirect:/article/Comment/"+foundComment.getArticle().getArticleID();
    }
    @PostMapping (value ="/deleteComment/{commentID}")
    public String DeleteComment(ModelMap modelMap,@PathVariable("commentID")Long commentID){
        Long articleId = commentService.findById(commentID).get().getArticle().getArticleID();
        commentService.delete(commentID);
        return "redirect:/article/Comment/" + articleId;
    }
    @GetMapping(value = "/user/{userID}")
    public String showPage(ModelMap modelMap,@PathVariable("userID")Long userID, HttpSession session){
        User user = userService.findById((Long) session.getAttribute("id")).get();
        User user1 = userService.findById(userID).get();
        Friend friend = friendService.findBySenderAndReceiverOrReceiverAndSender(user1,user);
        ArrayList<Article> articles = articleService.getArticleByUserId(userID);
        articles.sort(Comparator.comparing(Article::getTime).reversed());
        modelMap.addAttribute("user",user1);
        modelMap.addAttribute("article", new Article());
        modelMap.addAttribute("friend", friend);
        modelMap.addAttribute("countFriend", userService.countFriends(user1));
        modelMap.addAttribute("countPost", userService.countPosts(user1));
        modelMap.addAttribute("articles",articles);
        return "userPage";
    }
    @GetMapping(value = "/search")
    public String filerArticle(ModelMap modelMap, @RequestParam("filter") String filter, HttpSession session){
        User user = userService.findById((Long) session.getAttribute("id")).get();
        Long id = (Long) session.getAttribute("id");
        ArrayList<Article> articles = articleService.getAllArticle();
        modelMap.addAttribute("article", new Article());
//        modelMap.addAttribute("notics",notificationService.findByReceiver_UserID(id));
        modelMap.addAttribute("articles",articleService.findByDescriptionContains(filter));
        return "articleListTest";
    }
}
