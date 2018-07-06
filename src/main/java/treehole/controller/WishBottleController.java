package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import treehole.entity.BottleMessage;
import treehole.entity.User;
import treehole.entity.Wish;
import treehole.model.BottleDetail;
import treehole.model.BottleInfo;
import treehole.model.BottleMessageInfo;
import treehole.service.BottleMessageService;
import treehole.service.DriftingBottleService;
import treehole.service.WishService;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class WishBottleController {
    private WishService wishService;
    private DriftingBottleService driftingBottleService;
    private BottleMessageService bottleMessageService;

    @Autowired
    public WishBottleController(WishService wishService,
                                DriftingBottleService driftingBottleService,
                                BottleMessageService bottleMessageService) {
        this.wishService=wishService;
        this.driftingBottleService=driftingBottleService;
        this.bottleMessageService=bottleMessageService;
    }

    @RequestMapping(value = "/wishbottle",method = RequestMethod.GET)
    public String showWishBottlePage() {
        return "wishbottle";
    }


    @RequestMapping(value = "/writewish",method = RequestMethod.GET)
    public String showWriteWishPage() {
        return "writewish";
    }

    @RequestMapping(value = "/salvagebottle",method = RequestMethod.GET)
    public String showSalvageBottlePage() {
        return "salvagebottle";
    }

    @RequestMapping(value = "/mywishes",method = RequestMethod.GET)
    public String showMyWishesPage(Model model, HttpSession session) {
        /*User user=(User)session.getAttribute("user");*/
        List<Wish> wishes= wishService.getWishes(1);
        model.addAttribute("wishes",wishes);
        return "mywishes";
    }

    @RequestMapping(value = "/pickedbottles",method = RequestMethod.GET)
    public String showPickedBottlesPage(Model model) {
        List<BottleInfo> bottles=driftingBottleService.getPickedBottles(1);
        model.addAttribute("bottles",bottles);
        return "pickedbottles";
    }

    @RequestMapping(value = "/thrownbottles",method = RequestMethod.GET)
    public String showThrownBottlesPage(Model model) {
        List<BottleInfo> bottles=driftingBottleService.getThrownBottles(1);
        model.addAttribute("bottles",bottles);
        return "thrownbottles";
    }

    @RequestMapping(value = "/bottle/{id}",method = RequestMethod.GET)
    public String showBottleDetail(@PathVariable("id") int bottleId, Model model) {
        BottleInfo bottleInfo=driftingBottleService.getBottleInfo(bottleId);
        List<BottleMessageInfo> messageInfos=bottleMessageService.getBottleMessageInfo(bottleId);
        BottleDetail bottleDetail=new BottleDetail(bottleInfo,messageInfos);
        model.addAttribute("bottle",bottleDetail);
        return "bottledetail";
    }

    @RequestMapping(value = "/wish/{id}/bottle",method = RequestMethod.GET)
    public String showBottleDetailFromWish(@PathVariable("id") int wishId) {
        int bottleId=driftingBottleService.getBottleFromWish(wishId);
        return "redirect:/bottle/"+bottleId;
    }
    @RequestMapping(value = "/wish/throw",method = RequestMethod.POST)
    public @ResponseBody String throwBottleIntoWishSea(@RequestParam("wishId") int wishId, @RequestParam("anonymous") boolean anonymous, HttpSession session) {
        User user=(User)session.getAttribute("user");
        driftingBottleService.throwBottleIntoWishSea(wishId,user.getUserId(),anonymous);
        wishService.setThrown(wishId);
        return "success";
    }

    @RequestMapping(value = "/leavemessage",method = RequestMethod.POST)
    public @ResponseBody String leaveMessage(@RequestParam("bottleId")int bottleId,@RequestParam("message")String message,@RequestParam("anonymous")boolean anonymous,HttpSession session){
        BottleMessage bottleMessage=new BottleMessage();
        bottleMessage.setBottleId(bottleId);
        bottleMessage.setMessage(message);
        bottleMessage.setAnonymous(anonymous);
        User user=(User)session.getAttribute("user");
        bottleMessage.setUserId(user.getUserId());
        bottleMessage.setWriteDate(new Date());
        bottleMessageService.leaveMessage(bottleMessage);
        return "success";
    }
}
