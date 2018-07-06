package treehole.service;

import treehole.entity.Comment;
import treehole.model.CommentInfo;

import java.util.List;

public interface ICommentService {
    List<Comment> getUserComments(int userId);
    List<CommentInfo> getSecretComments(int secretId);
    void writeComment(Comment comment);
    Comment getComment(int commentId);
    void deleteComment(int commentId);

}
