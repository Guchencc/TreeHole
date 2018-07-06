package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import treehole.entity.Secret;
import treehole.service.SecretService;

import java.util.List;

@Controller
public class SecretController {
    private SecretService secretService;

    @Autowired
    public SecretController(SecretService secretService) {
        this.secretService=secretService;
    }

    @RequestMapping(value = "/user/{id}/secret",method = RequestMethod.GET,produces = "application/json;charset=UTF-8")
    public @ResponseBody List<Secret> getUserSecrets(@PathVariable("id")int userId) {
        return secretService.getSecrets(userId);
    }

    @RequestMapping(value = "/secret/add",method = RequestMethod.POST)
    public @ResponseBody String addSecret(@RequestParam("content") String content,
                            @RequestParam("tags") String tags,
                            @RequestParam("anonymous")boolean anonymous){
        Secret secret=new Secret();
        secret.setContent(content);
        secret.setTags(tags);
        secret.setAnonymous(anonymous);
        secret.setUserId(1);
        secretService.writeSecret(secret);
        return "success";
    }

    @RequestMapping(value = "/secret/{id}/delete",method = RequestMethod.GET)
    public String deleteSecret(@PathVariable("id")int secretId) {
        secretService.deleteSecret(secretId);
        return "redirect:/";
    }

    @RequestMapping(value = "/secret/{id}/upvote",method = RequestMethod.GET)
    public @ResponseBody String upVote(@PathVariable("id")int secretId) {
        secretService.upVote(secretId);
        return "success";
    }

    @RequestMapping(value = "/secret/{id}/downvote",method = RequestMethod.GET)
    public @ResponseBody String downVote(@PathVariable("id")int secretId) {
        secretService.downVote(secretId);
        return "success";
    }

}
