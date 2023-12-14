package com.example.Services;

import com.example.Entity.Article;
import com.example.Entity.Comment;

import java.util.ArrayList;
import java.util.Optional;

public interface ICommentService {
    ArrayList<Comment> findByArticle_ArticleID(Long articleID);
    void submitComment(Comment comment);

    Optional<Comment> findById(Long commentId);
    void save(Comment foundComment);

    void delete(Long commendId);
    void deleteByArticle_ArticleID(Long articleID);
}
