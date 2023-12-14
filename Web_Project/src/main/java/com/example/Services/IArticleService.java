package com.example.Services;

import com.example.Entity.Article;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public interface IArticleService {
    ArrayList<Article> submitArticle(Article article);
    ArrayList<Article> updateArticle(Article article);
    ArrayList<Article> getAllArticle();
    ArrayList<Article> deleteArticle(Long articleID);
    ArrayList<Article> getArticleByUserId(Long userId);
    Optional<Article> findArticleById(Long articleId);
    void save(Article foundArticle);
    void clearLike(Long articleId);
    List<Article> findByDescriptionContains(String filter);
}
