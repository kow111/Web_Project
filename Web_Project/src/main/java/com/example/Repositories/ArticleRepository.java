package com.example.Repositories;

import com.example.Entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public interface ArticleRepository extends JpaRepository<Article, Long> {
    ArrayList<Article> findAll();
    @Query(value = "SELECT coalesce(max(articleID), 0) FROM Article")
    public Long getMaxId();
    ArrayList<Article> findByUser_UserID(Long userId);
    Optional<Article> findById(Long articleId);

    List<Article> findByDescriptionContains(String filter);
}
