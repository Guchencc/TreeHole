package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import treehole.entity.Follow;
import treehole.entity.User;
import treehole.model.FollowInfo;
import treehole.service.FollowService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class FollowController {
    private FollowService followService;
    @Autowired
    public FollowController(FollowService  followService ){
        this.followService=followService;
    }

    @RequestMapping(value = "/user/follow/{id}",method = RequestMethod.GET,produces = "text/html;charset=utf-8")
    public @ResponseBody String followUser(@PathVariable("id")int followUserId, HttpSession session) {
        User user=(User)session.getAttribute("user");
        followService.addFollow(user.getUserId(),followUserId);
        return "success";
    }

    @RequestMapping(value = "/user/notFollow/{id}",method = RequestMethod.GET)
    public @ResponseBody String StopFollowUser(@PathVariable("id")int followUserId, HttpSession session) {
        User user=(User)session.getAttribute("user");
        followService.stopFollow(user.getUserId(),followUserId);
        return "success";
    }

    @RequestMapping(value = "/user/specialFollow/{id}",method = RequestMethod.GET)
    public @ResponseBody String SpecialFollowUser(@PathVariable("id")int followUserId, HttpSession session) {
        User user=(User)session.getAttribute("user");
        if (user==null) {
            return "请先登录！";
        }else {
            followService.setSpecialFollow(user.getUserId(),followUserId);
        }
        return "特别关注成功!";
    }

    @RequestMapping(value = "/user/stopSpecialFollow/{id}",method = RequestMethod.GET)
    public @ResponseBody String StopSpecialFollow(@PathVariable("id")int followUserId, HttpSession session) {
        User user=(User)session.getAttribute("user");
        if (user==null) {
            return "请先登录！";
        }else {
            followService.cancelSpecialFollow(user.getUserId(),followUserId);
        }
        return "取消特别关注成功!";
    }

    @RequestMapping(value = "/user/{id}/follows",method = RequestMethod.GET,produces = "application/json")
    public @ResponseBody List<FollowInfo> getFollows(@PathVariable("id")int userId) {
        return  followService.getFollows(userId);
    }

    @RequestMapping(value = "/user/{id}/sfollows",method = RequestMethod.GET,produces = "application/json")
    public @ResponseBody List<FollowInfo> getSpecialFollows(@PathVariable("id")int userId) {
        return followService.getSpecialFollows(userId);
    }

    @RequestMapping(value = "/checkfollow/{followId}",method = RequestMethod.GET)
    public @ResponseBody String checkFollow(@PathVariable("followId")int followId,HttpSession session){
        User user=(User)session.getAttribute("user");
        boolean isFollow=followService.checkFollow(user.getUserId(),followId);
        if (isFollow){
            return "true";
        }else{
            return "false";
        }
    }
}
