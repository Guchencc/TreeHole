package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import treehole.entity.User;
import treehole.exception.DuplicateException;
import treehole.exception.UserNotFoundException;
import treehole.exception.VerificationFailedException;
import treehole.model.UserProfile;
import treehole.service.UserService;

import javax.servlet.http.HttpSession;
import java.net.URI;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
/*@RestController*/
public class UserController {
    private UserService userService;
    @Autowired
    public UserController(UserService userService) {
        this.userService=userService;
    }

    @RequestMapping(value = "/user/{id}",method = RequestMethod.GET)
    public String showUserProfile(@PathVariable("id") int userId,Model model) {
        User user=userService.getProfile(userId);
        UserProfile profile=new UserProfile(user,"");
        model.addAttribute("userProfile",profile);
        return "userProfile";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(@RequestBody User newUser, HttpSession session) {
        userService.register(newUser);
        session.setAttribute("user",newUser);
        return "home";
    }

    @RequestMapping(value = "/login",method=RequestMethod.POST)
    public String login(@RequestParam("username")String username,@RequestParam("password") String password,HttpSession session) {
        User user=userService.login(username,password);
        session.setAttribute("user",user);
        return "home";
    }

 /*   @RequestMapping(value = "/user/{id}",method = RequestMethod.GET,produces = "text/html;charset=utf-8")
    public @ResponseBody ResponseEntity<String> showUserProfile(@PathVariable int id,UriComponentsBuilder ucb) {
        HttpHeaders headers=new HttpHeaders();
        URI locationUri=ucb.path("/user/555")
                .build()
                .toUri();
        headers.setLocation(locationUri);
        return new ResponseEntity<>("成功了",headers,HttpStatus.CREATED);
    }*/

    @ExceptionHandler(DuplicateException.class)
    public @ResponseBody String handleRegisterFailed(DuplicateException e) {
        return e.getMessage();
    }

    @ExceptionHandler(VerificationFailedException.class)
    public @ResponseBody String handleLoginFailed(VerificationFailedException e) {
        return e.getMessage();
    }
}

