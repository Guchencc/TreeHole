package treehole.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import treehole.entity.Secret;
import treehole.entity.User;
import treehole.exception.DuplicateException;
import treehole.exception.VerificationFailedException;
import treehole.model.*;
import treehole.service.SecretService;
import treehole.service.UserService;
import treehole.service.WishService;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
/*@RestController*/
public class UserController {
    private UserService userService;
    private SecretService secretService;
    private WishService wishService;
    @Autowired
    public UserController(UserService userService,
                          SecretService secretService,
                          WishService wishService) {
        this.userService=userService;
        this.secretService=secretService;
        this.wishService=wishService;
    }


    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String showLoginForm() {
        return "login";
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String showRegisterForm(Model model) {
        RegisterBean registerBean=new RegisterBean();
        model.addAttribute("registerBean",registerBean);
        return "register";
    }

    @RequestMapping(value = "/user/{id}/secret/{page}",method = RequestMethod.GET)
    public String showUserProfileWithSecret(@PathVariable("id") int userId,@PathVariable("page") int pageNum, Model model) {
        UserProfile userProfile=userService.getProfile(userId);
        PageBean<SecretInfo> secretPage=secretService.getPublicSecretPageByUserId(pageNum,HomeController.PAGE_SIZE,userId);
        model.addAttribute("secretPage",secretPage);
        model.addAttribute("profile",userProfile);
        return "secretprofile";
    }

    @RequestMapping(value = "/user/{id}/wish/{page}",method = RequestMethod.GET)
    public String showUserProfileWithWish(@PathVariable("id") int userId,@PathVariable("page") int pageNum, Model model) {
        UserProfile userProfile=userService.getProfile(userId);
        PageBean<WishInfo> wishPage=wishService.getPublicWishPageByUserId(pageNum,HomeController.PAGE_SIZE,userId);
        model.addAttribute("wishPage",wishPage);
        model.addAttribute("profile",userProfile);
        return "wishprofile";
    }
    @RequestMapping(value = "/user/{id}/follow/{page}",method = RequestMethod.GET)
    public String showUserProfileWithFollow(@PathVariable("id") int userId,@PathVariable("page") int pageNum, Model model) {
        UserProfile userProfile=userService.getProfile(userId);
        PageBean<FollowInfo> userPage=userService.getFollowPageByUserId(pageNum,HomeController.PAGE_SIZE,userId);
        model.addAttribute("userPage",userPage);
        model.addAttribute("profile",userProfile);
        return "followprofile";
    }

    @RequestMapping(value = "/user/{id}/fan/{page}",method = RequestMethod.GET)
    public String showUserProfileWithFan(@PathVariable("id") int userId,@PathVariable("page") int pageNum, Model model) {
        UserProfile userProfile=userService.getProfile(userId);
        PageBean<FollowInfo> userPage=userService.getFanPageByUserId(pageNum,HomeController.PAGE_SIZE,userId);
        model.addAttribute("userPage",userPage);
        model.addAttribute("profile",userProfile);
        return "fanprofile";
    }

    @RequestMapping(value = "/user/update",method = RequestMethod.POST,produces = "application/json")
    public String updateUserProfile(@RequestBody User user,Model model) {
        userService.updateProfile(user);
        model.addAttribute("user",user);
        return "profile";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(RegisterBean registerBean,HttpSession session) {
        User user=new User();
        user.setUsername(registerBean.getUsername());
        user.setPassword(registerBean.getPassword());
        user.setNickname(registerBean.getNickname());
        user.setEmail(registerBean.getEmail());
        user.setGender(registerBean.getGender());
        user.setBirthday(registerBean.getBirthday());
        user.setCreateDate(new Date());
        userService.register(user);
        User newUser=userService.login(user.getUsername(),user.getPassword());
        session.setAttribute("user",newUser);
        return "redirect:/home";
    }

    @RequestMapping(value = "/checkUsername",method = RequestMethod.POST)
    public @ResponseBody String checkUsername(@RequestParam("username") String username) {
        return userService.checkUsername(username);
    }

    @RequestMapping(value = "/checkEmail",method = RequestMethod.POST)
    public @ResponseBody String checkEmail(@RequestParam("email") String email){
        return userService.checkEmail(email);
    }

    @RequestMapping(value = "/login",method=RequestMethod.POST)
    public @ResponseBody String login(@RequestParam("username")String username,@RequestParam("password") String password,HttpSession session) {
        User user=userService.login(username,password);
        session.setAttribute("user",user);
        return "success";
    }

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("user");
        return "redirect:/home";
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
    public @ResponseBody String handleLoginFailed() {
        return "failed";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}

