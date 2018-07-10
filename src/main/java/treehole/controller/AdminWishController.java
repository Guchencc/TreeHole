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
import treehole.entity.Wish;
import treehole.repository.SecretRepository;
import treehole.repository.WishRepository;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminWishController {

    private WishRepository wishRepository;

    @Autowired
    public AdminWishController(WishRepository wishRepository) {
        this.wishRepository=wishRepository;
    }

    @RequestMapping(value = "/wish/{page}",method = RequestMethod.GET)
    public String wishManage(@PathVariable("page") int page, Model model){
        Wish wish=new Wish();
        model.addAttribute("wishBean",wish);
        int count=wishRepository.getPageCount();
        int pageCount=(count/11)+1;
        model.addAttribute("pageCount",pageCount);
        model.addAttribute("current_page",page);
        List<Wish> wishes=wishRepository.findPage((page-1)*10,10);
        model.addAttribute("wishes",wishes);
        return "wishManage";
    }


    @RequestMapping(value = "/wish/add",method = RequestMethod.POST)
    public String addWish(Wish wish, Errors errors){
        if(errors.hasErrors()){
            return "redirect:/admin/wish/1";
        }
        wish.setCreateDate(new Date());
        wishRepository.add(wish);
        return "redirect:/admin/wish/1";
    }


    @RequestMapping(value = "/wish/update",method = RequestMethod.POST)
    public String updateWish(Wish wish) {
        wishRepository.update(wish);
        return "redirect:/admin/wish/1";
    }

    @RequestMapping(value = "/wish/delete/{id}",method = RequestMethod.GET)
    public String deleteWish(@PathVariable("id") int id) {
        wishRepository.delete(id);
        return "redirect:/admin/wish/1";
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}