package treehole.controller;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import treehole.entity.Secret;
import treehole.entity.User;
import treehole.repository.SecretRepository;
import treehole.repository.UserRepository;
import treehole.repository.WishRepository;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value ="/admin")
public class AdminUserController {

    private UserRepository userRepository;

    @Autowired
    public AdminUserController(UserRepository userRepository) {
        this.userRepository=userRepository;
    }


    @RequestMapping(value = "/user/{page}",method = RequestMethod.GET)
    public String userManage(@PathVariable("page") int page,Model model){
        User user=new User();
        model.addAttribute("userBean",user);
        int count=userRepository.getPageCount();
        int pageCount=(count/11)+1;
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("current_page",page);
        List<User> users=userRepository.findPage((page-1)*10,10);
        model.addAttribute("users",users);
        return "userManage";
    }

    @RequestMapping(value = "/user/search",method = RequestMethod.GET)
    public String searchUser(@RequestParam("type")int type,@RequestParam("search")String content,Model model){
        List<User> result=new ArrayList<>();
        switch (type){
            case 1:
                if (userRepository.findById(Integer.valueOf(content))!=null){
                    result.add(userRepository.findById(Integer.valueOf(content)));
                }
                break;
            case 2:
                result.addAll(userRepository.searchByUserName(content));
                break;
            case 3:
                result.addAll(userRepository.searchByNickName(content));
                break;
            default:
                break;
        }
        User user=new User();
        model.addAttribute("userBean",user);
        model.addAttribute("pageCount",1);
        model.addAttribute("current_page",1);
        model.addAttribute("users",result);
        return "userManage";
    }


    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    public String addUser(@Valid User user, Errors errors){
        if(errors.hasErrors()){
            return "redirect:/admin/user/1";
        }
        user.setCreateDate(new Date());
        userRepository.add(user);
        return "redirect:/admin/user/1";
    }


    @RequestMapping(value = "/user/update",method = RequestMethod.POST)
    public String updateUser(User user) {
        userRepository.update(user);
        return "redirect:/admin/user/1";
    }

    @RequestMapping(value = "/user/delete/{id}",method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") int id) {
        userRepository.delete(id);
        return "redirect:/admin/user/1";
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
