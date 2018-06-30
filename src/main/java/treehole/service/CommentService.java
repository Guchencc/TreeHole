package treehole.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import treehole.entity.Comment;
import treehole.repository.CommentRepository;

import java.util.Date;
import java.util.List;

@Service
public class CommentService implements ICommentService {
    private CommentRepository commentRepository;
    @Autowired
    public CommentService(CommentRepository commentRepository) {
        this.commentRepository=commentRepository;
    }

    @Override
    public List<Comment> getComments(int userId) {
        return commentRepository.findByUserId(userId);
    }
    @Override
    public void writeComment(Comment comment) {
        comment.setCommentDate(new Date());
        commentRepository.add(comment);
    }

    @Override
    public Comment getComment(int commentId) {
        return commentRepository.findByCommentId(commentId);
    }

    @Override
    public void deleteComment(int commentId) {
        commentRepository.delete(commentId);
    }
}
