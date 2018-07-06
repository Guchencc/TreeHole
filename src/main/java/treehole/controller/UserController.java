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
import treehole.entity.User;
import treehole.exception.DuplicateException;
import treehole.exception.VerificationFailedException;
import treehole.model.LoginBean;
import treehole.model.RegisterBean;
import treehole.service.UserService;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
/*@RestController*/
public class UserController {
    private UserService userService;
    @Autowired
    public UserController(UserService userService) {
        this.userService=userService;
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

    @RequestMapping(value = "/user/{id}",method = RequestMethod.GET)
    public String showUserProfile(@PathVariable("id") int userId,Model model) {
        User user=userService.getProfile(userId);
        model.addAttribute("userProfile",user);
        return "profile";
    }

    @RequestMapping(value = "/user/update",method = RequestMethod.POST,produces = "application/json")
    public String updateUserProfile(@RequestBody User user,Model model) {
        userService.updateProfile(user);
        model.addAttribute("user",user);
        return "profile";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(RegisterBean registerBean, Errors errors) {
        if (errors.hasErrors()){
            System.out.println(errors);
            return "register";
        }
        User user=new User();
        user.setUsername(registerBean.getUsername());
        user.setPassword(registerBean.getPassword());
        user.setNickname(registerBean.getNickname());
        user.setEmail(registerBean.getEmail());
        user.setGender(registerBean.getGender());
        user.setBirthday(registerBean.getBirthday());
        user.setCreateDate(new Date());
        userService.register(user);
        return "profile";
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

