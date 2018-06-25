package treehole.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import treehole.entity.User;
import treehole.exception.UserNotFoundException;

import java.net.URI;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
/*@RestController*/
public class HomeController {

    @RequestMapping(value = "/home",method = RequestMethod.GET)
    public String showHomePage() {
        return "test";
    }

    @RequestMapping(value = "/users",produces = "application/json",method = RequestMethod.GET)
    public List<User> showUsers() {
        List<User> userList =new ArrayList<>();
        User user=new User();
        user.setUsername("guchen");
        user.setPassword("213124");
        user.setBirthday(new Date());
        userList.add(user);
        user=new User();
        user.setUsername("kevin");
        user.setPassword("GJ");
        userList.add(user);
        return userList;
    }

    @RequestMapping(value = "/register",consumes = "application/json",method = RequestMethod.POST)
    public @ResponseBody ResponseEntity<User> register(@RequestBody User newUser) {
        newUser.setUserId(312312);
        newUser.setCreateDate(new Date());
        HttpHeaders headers=new HttpHeaders();
        URI locationUri=URI.create("http://localhost:8888/user/"+newUser.getUserId());
        headers.setLocation(locationUri);
        return new ResponseEntity<>(newUser,headers,HttpStatus.CREATED);
    }

   /* @RequestMapping(value = "/user/{id}",method = RequestMethod.GET )
    public ResponseEntity<User> queryById(@PathVariable int id) {
        User user=new User();
        user.setUserId(id);
        user.setUsername("test");
        user.setPassword("dasd");
        if (id.equals("123")){
            throw new UserNotFoundException(id);
        }
        return new ResponseEntity<>(user,HttpStatus.OK);
    }*/

    @RequestMapping(value = "/user/{id}",method = RequestMethod.GET,produces = "text/html;charset=utf-8")
    public @ResponseBody ResponseEntity<String> showUserProfile(@PathVariable int id,UriComponentsBuilder ucb) {
        HttpHeaders headers=new HttpHeaders();
        URI locationUri=ucb.path("/user/555")
    }

    @ExceptionHandler(UserNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public @ResponseBody String handleUserNotFound(UserNotFoundException e) {
        return "ID:"+e.getUserId()+"用户不存在！";
    }
}

