package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import treehole.entity.Comment;
import treehole.entity.User;
import treehole.model.CommentInfo;
import treehole.repository.CommentRepository;
import treehole.service.CommentService;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {
    private CommentService commentService;
    @Autowired
    public CommentController(CommentService commentService) {
        this.commentService=commentService;
    }

    @RequestMapping(value = "/secret/{id}/comments",method = RequestMethod.GET,produces = "application/json;charset=UTF-8")
    public @ResponseBody List<CommentInfo> getSecretComments(@PathVariable("id") int secretId) {
         return commentService.getSecretComments(secretId);
    }

    @RequestMapping(value = "/user/{id}/comments",method = RequestMethod.GET,produces = "application/json;charset=UTF-8")
    public @ResponseBody List<Comment> getUserComments(@PathVariable("id") int userId) {
        return commentService.getUserComments(userId);
    }

    @RequestMapping(value = "/comment/add",method = RequestMethod.POST)
    public @ResponseBody String addComment(@RequestParam("secretId")int secretId,
                             @RequestParam("comment")String comment,
                             @RequestParam("anonymous")boolean anonymous,
                             HttpSession session){
        Comment newComment=new Comment();
        newComment.setSecretId(secretId);
        newComment.setComment(comment);
        newComment.setAnonymous(anonymous);
        newComment.setUserId(1);
        commentService.writeComment(newComment);
        return "success";
    }

    @RequestMapping(value = "/comment/{id}/delete",method = RequestMethod.GET)
    public String deleteComment(@PathVariable("id") int commentId ){
        commentService.deleteComment(commentId);
        return "redirect:/";
    }
}
