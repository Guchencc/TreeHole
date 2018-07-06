package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import treehole.entity.Secret;
import treehole.entity.User;
import treehole.model.SecretInfo;
import treehole.repository.SecretRepository;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminSecretController {

    private SecretRepository secretRepository;

    @Autowired
    public AdminSecretController(SecretRepository secretRepository) {
        this.secretRepository=secretRepository;
    }

    @RequestMapping(value = "/secret/{page}",method = RequestMethod.GET)
    public String secretManage(@PathVariable("page") int page, Model model){
        Secret secret=new Secret();
        model.addAttribute("secretBean",secret);
        int count=secretRepository.getPageCount();
        int pageCount=(count/11)+1;
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("current_page",page);
        List<Secret> secrets=secretRepository.findPage((page-1)*10,10);
        model.addAttribute("secrets",secrets);
        return "secretManage";
    }


    @RequestMapping(value = "/secret/add",method = RequestMethod.POST)
    public String addSecret(Secret secret, Errors errors){
        if(errors.hasErrors()){
            return "redirect:/admin/secret/1";
        }
        secret.setCreateDate(new Date());
        secretRepository.add(secret);
        return "redirect:/admin/secret/1";
    }


    @RequestMapping(value = "/secret/update",method = RequestMethod.POST)
    public String updateSecret(Secret secret) {
        secretRepository.update(secret);
        return "redirect:/admin/secret/1";
    }

    @RequestMapping(value = "/secret/delete/{id}",method = RequestMethod.GET)
    public String deleteSecret(@PathVariable("id") int id) {
        secretRepository.delete(id);
        return "redirect:/admin/secret/1";
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
