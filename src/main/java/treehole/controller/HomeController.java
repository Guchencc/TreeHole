package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import treehole.entity.Bulletin;
import treehole.entity.Secret;
import treehole.entity.User;
import treehole.model.PageBean;
import treehole.model.SecretInfo;
import treehole.repository.UserRepository;
import treehole.service.BulletinService;
import treehole.service.SecretService;
import treehole.service.UserService;

import java.util.List;


@Controller
public class HomeController  {
    public static final int PAGE_SIZE=5;
    public static final int BULLETIN_SIZE=3;
    private SecretService secretService;
    private BulletinService bulletinService;
    @Autowired
    public HomeController(SecretService secretService,BulletinService bulletinService) {
        this.secretService=secretService;
        this.bulletinService=bulletinService;
    }

    @RequestMapping(value = {"/","/home"},method =RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String home(Model model) {
        List<Bulletin> bulletins= bulletinService.getLatestBulletin(BULLETIN_SIZE);
        PageBean<SecretInfo> secretPage=secretService.getSecretsInPage(1,PAGE_SIZE);
        model.addAttribute("bulletins",bulletins);
        model.addAttribute("secretPage",secretPage);
        return "home";
    }

    @RequestMapping(value = "/treehole/{page}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String treeHole(@PathVariable("page")int pageNum,Model model){
        List<Bulletin> bulletins= bulletinService.getLatestBulletin(BULLETIN_SIZE);
        PageBean<SecretInfo> secretPage=secretService.getSecretsInPage(pageNum,PAGE_SIZE);
        model.addAttribute("bulletins",bulletins);
        model.addAttribute("secretPage",secretPage);
        return "home";
    }

    @RequestMapping(value = "/treehole/{tag}/{page}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String treeHole(@PathVariable("page")int pageNum,@PathVariable("tag") String tag,Model model){
        List<Bulletin> bulletins= bulletinService.getLatestBulletin(BULLETIN_SIZE);
        PageBean<SecretInfo> secretPage=secretService.getSecretPageByTag(pageNum,PAGE_SIZE,tag);
        model.addAttribute("bulletins",bulletins);
        model.addAttribute("secretPage",secretPage);
        model.addAttribute("tag",tag);
        return "tagsecret";
    }


}
