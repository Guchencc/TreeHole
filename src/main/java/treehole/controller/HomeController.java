package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import treehole.entity.Secret;
import treehole.entity.User;
import treehole.model.PageBean;
import treehole.repository.UserRepository;
import treehole.service.SecretService;
import treehole.service.UserService;

import java.util.List;


@Controller
public class HomeController  {
    private SecretService secretService;

    @Autowired
    public HomeController(SecretService secretService) {
        this.secretService=secretService;
    }

    @RequestMapping(value = {"/","/home"},method =RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String home(Model model) {
        model.addAttribute("secrets",secretService.getAllSecrets());
        return "home";
    }

}
