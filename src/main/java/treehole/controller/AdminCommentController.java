package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import treehole.entity.Comment;
import treehole.entity.User;
import treehole.repository.CommentRepository;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value ="/admin")
public class AdminCommentController {

    private CommentRepository commentRepository;

    @Autowired
    public AdminCommentController(CommentRepository commentRepository) {
        this.commentRepository=commentRepository;
    }


    @RequestMapping(value = "/comment/{page}",method = RequestMethod.GET)
    public String commentManage(@PathVariable("page") int page, Model model){
        Comment comment=new Comment();
        model.addAttribute("commentBean",comment);
        int count=commentRepository.getPageCount();
        int pageCount=(count/11)+1;
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("current_page",page);
        List<Comment> comments=commentRepository.findPage((page-1)*10,10);
        model.addAttribute("comments",comments);
        return "commentManage";
    }


    @RequestMapping(value = "/comment/add",method = RequestMethod.POST)
    public String addComment(Comment comment, Errors errors){
        if(errors.hasErrors()){
            return "redirect:/admin/comment/1";
        }
        comment.setCommentDate(new Date());
        commentRepository.add(comment);
        return "redirect:/admin/comment/1";
    }


    @RequestMapping(value = "/comment/update",method = RequestMethod.POST)
    public String updateComment(Comment comment) {
        commentRepository.update(comment);
        return "redirect:/admin/comment/1";
    }

    @RequestMapping(value = "/comment/delete/{id}",method = RequestMethod.GET)
    public String deleteComment(@PathVariable("id") int id) {
        commentRepository.delete(id);
        return "redirect:/admin/comment/1";
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
