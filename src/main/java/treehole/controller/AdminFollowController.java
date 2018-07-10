package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import treehole.entity.Follow;
import treehole.entity.User;
import treehole.repository.FollowRepository;
import treehole.repository.UserRepository;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value ="/admin")
public class AdminFollowController {

    private FollowRepository followRepository;

    @Autowired
    public AdminFollowController(FollowRepository followRepository ) {
        this.followRepository=followRepository;
    }


    @RequestMapping(value = "/follow/{page}",method = RequestMethod.GET)
    public String followManage(@PathVariable("page") int page,Model model){
        Follow follow=new Follow();
        model.addAttribute("followBean",follow);
        int count=followRepository.getPageCount();
        int pageCount=(count/11)+1;
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("current_page",page);
        List<Follow> follows=followRepository.findPage((page-1)*10,10);
        model.addAttribute("follows",follows);
        return "followManage";
    }

   /* @RequestMapping(value = "/user/search",method = RequestMethod.GET)
    public String searchUser(@RequestParam("type")int type,@RequestParam("search")String content,Model model){
        List<User> result=new ArrayList<>();
        switch (type){
            case 1:
                if (followRepository.findById(Integer.valueOf(content))!=null){
                    result.add(followRepository.findById(Integer.valueOf(content)));
                }
                break;
            case 2:
                result.addAll(followRepository.searchByUserName(content));
                break;
            case 3:
                result.addAll(followRepository.searchByNickName(content));
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
    }*/


    @RequestMapping(value = "/follow/add",method = RequestMethod.POST)
    public String addFollow(Follow follow, Errors errors){
        if(errors.hasErrors()){
            return "redirect:/admin/follow/1";
        }
        follow.setFollowDate(new Date());
        followRepository.add(follow);
        return "redirect:/admin/follow/1";
    }


    @RequestMapping(value = "/follow/update",method = RequestMethod.POST)
    public String updateFollow(Follow follow) {
        followRepository.update(follow);
        return "redirect:/admin/follow/1";
    }

    @RequestMapping(value = "/follow/delete",method = RequestMethod.GET)
    public String deleteFollow(@RequestParam("userId")int userId,@RequestParam("followId")int followId) {
        followRepository.delete(userId,followId);
        return "redirect:/admin/follow/1";
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
