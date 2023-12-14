package com.example.Services;

import com.example.Entity.Comment;
import com.example.Repositories.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;

@Service
public class CommentService implements ICommentService{
    @Autowired
    CommentRepository commentRepository;

    @Override
    public ArrayList<Comment> findByArticle_ArticleID(Long articleID) {
        return commentRepository.findByArticle_ArticleID(articleID);
    }

    @Override
    public void submitComment(Comment comment) {
        Date date = new Date();
        long time = date.getTime();
        Timestamp dateTime = new Timestamp(time);
        comment.setId(commentRepository.getMaxId()+1);
        comment.setTime(dateTime);
        commentRepository.save(comment);
    }

    @Override
    public Optional<Comment> findById(Long commentId) {
        return commentRepository.findById(commentId);
    }

    @Override
    public void save(Comment foundComment) {
        if(!foundComment.getContent().trim().isEmpty()){
            commentRepository.save(foundComment);
        }
    }

    @Override
    public void delete(Long commendId) {
        commentRepository.deleteById(commendId);
    }

    @Override
    public void deleteByArticle_ArticleID(Long articleID) {
        commentRepository.deleteCommentByArticle_ArticleID(articleID);
    }
}
