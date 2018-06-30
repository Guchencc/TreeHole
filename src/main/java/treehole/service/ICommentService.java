package treehole.service;

import treehole.entity.Comment;

import java.util.List;

public interface ICommentService {
    List<Comment> getComments(int userId);
    void writeComment(Comment comment);
    Comment getComment(int commentId);
    void deleteComment(int commentId);
}
