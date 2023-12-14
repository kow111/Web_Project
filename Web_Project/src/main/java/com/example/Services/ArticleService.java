package com.example.Services;

import com.example.Entity.Article;
import com.example.Entity.User;
import com.example.Repositories.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.*;

@Service
public class ArticleService implements IArticleService{
    @Autowired
    ArticleRepository articleRepository;

    public ArrayList<Article> submitArticle(Article article){
        Date date = new Date();
        long time = date.getTime();
        Timestamp dateTime = new Timestamp(time);
        article.setArticleID(articleRepository.getMaxId()+1);
        article.setLikes(0);
        article.setTime(dateTime);
        articleRepository.save(article);
        return getAllArticle();
    }
    public ArrayList<Article> updateArticle(Article article){
        articleRepository.save(article);
        return getAllArticle();
    }
    public ArrayList<Article> getAllArticle(){
        return articleRepository.findAll();
    }
    public ArrayList<Article> getArticleByUserId(Long userId){
        return articleRepository.findByUser_UserID(userId);
    }

    @Override
    public Optional<Article> findArticleById(Long articleId) {
        return articleRepository.findById(articleId);
    }

    @Override
    public void save(Article foundArticle) {
        articleRepository.save(foundArticle);
    }

    @Override
    public void clearLike(Long articleId) {
        Set<User> users = null;
        Article article = articleRepository.findById(articleId).get();
        users = article.getUsersWhoLiked();
        users.clear();
        article.setUsersWhoLiked(users);
        articleRepository.save(article);
    }

    @Override
    public List<Article> findByDescriptionContains(String filter) {
        return articleRepository.findByDescriptionContains(filter);
    }

    public ArrayList<Article> deleteArticle(Long articleID){
        articleRepository.deleteById(articleID);
        return articleRepository.findAll();
    }
}
