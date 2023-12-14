package com.example.Repositories;

import com.example.Entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.ArrayList;
import java.util.Optional;

public interface CommentRepository extends JpaRepository<Comment,Long> {
    ArrayList<Comment> findByArticle_ArticleID(Long articleID);
    @Query(value = "SELECT coalesce(max(id), 0) FROM Comment")
    public Long getMaxId();
    Optional<Comment> findById(Long commentId);
    void deleteCommentByArticle_ArticleID(Long articleID);
}
