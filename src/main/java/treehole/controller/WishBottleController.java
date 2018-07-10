package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
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
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
public class WishBottleController {
    private WishService wishService;
    private DriftingBottleService driftingBottleService;
    private BottleMessageService bottleMessageService;
    private static final String WISH_PICTURE_UPLOAD="C:\\Program Files\\Tomcat\\apache-tomcat-9.0.0.M26\\webapps\\wish\\image\\";
    private static final String WISH_VOICE_UPLOAD="C:\\Program Files\\Tomcat\\apache-tomcat-9.0.0.M26\\webapps\\wish\\voice\\";
    private static final String WISH_VIDEO_UPLOAD="C:\\Program Files\\Tomcat\\apache-tomcat-9.0.0.M26\\webapps\\wish\\video\\";
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


    @RequestMapping(value = "/mywishes",method = RequestMethod.GET)
    public String showMyWishesPage(Model model, HttpSession session) {
        User user=(User)session.getAttribute("user");
        List<Wish> wishes= wishService.getWishes(user.getUserId());
        model.addAttribute("wishes",wishes);
        return "mywishes";
    }

    @RequestMapping(value = "/pickedbottles",method = RequestMethod.GET)
    public String showPickedBottlesPage(Model model,HttpSession session) {
        User user=(User)session.getAttribute("user");
        List<BottleInfo> bottles=driftingBottleService.getPickedBottles(user.getUserId());
        model.addAttribute("bottles",bottles);
        return "pickedbottles";
    }

    @RequestMapping(value = "/thrownbottles",method = RequestMethod.GET)
    public String showThrownBottlesPage(Model model,HttpSession session) {
        User user=(User)session.getAttribute("user");
        List<BottleInfo> bottles=driftingBottleService.getThrownBottles(user.getUserId());
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

    @RequestMapping(value="/wish/write",method = RequestMethod.POST)
    public String writeWish(@RequestParam("wishcontent")String wishcontent,
                            @RequestParam("fileupload")MultipartFile multipartFile,
                            @RequestParam("wishprivacy")boolean isPrivacy,
                            HttpSession session){
        String filetype=multipartFile.getContentType();
        System.out.println(filetype);
        Wish wish=new Wish();
        wish.setCreateDate(new Date());
        wish.setWish(wishcontent);
        User user=(User)session.getAttribute("user");
        wish.setUserId(user.getUserId());
        wish.setPrivacy(isPrivacy);
        wishService.writerWish(wish);
        //这里上传文件的保存设计有问题，无法提前获得自动生成的wishId,先采取应急方法
        List<Wish> wishes=wishService.getWishes(user.getUserId());
        for (Wish w:wishes){
            if(w.getWish().equals(wish.getWish())) {
                wish = w;
                break;
            }
        }
        //在此简单支持3中媒体类型，用户上传的文件也只是保存在服务器目录下，重新发布之前上传的用户图片会消失
        switch (filetype){
            case "image/jpeg":
                wish.setHasPicture(true);
                try {
                    multipartFile.transferTo(new File(session.getServletContext().getRealPath("wish/image/")+wish.getWishId()+".jpg"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            case "audio/mpeg":
                wish.setHasVoice(true);
                try {
                    multipartFile.transferTo(new File(session.getServletContext().getRealPath("wish/voice/")+wish.getWishId()+".mp3"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            case "video/mp4":
                wish.setHasVideo(true);
                try {
                    multipartFile.transferTo(new File(session.getServletContext().getRealPath("wish/video/")+wish.getWishId()+".mp4"));
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            default:
                System.out.println("不支持的文件类型:"+filetype);
        }
        wishService.updateWish(wish);
        return "redirect:/mywishes";
    }

    @RequestMapping(value = "/bottle/pick",method = RequestMethod.GET)
    public @ResponseBody String pickBottle(HttpSession session) {
        User user=(User)session.getAttribute("user");
        int randomBottle=driftingBottleService.getRandomBottle(user.getUserId());
        if (randomBottle>0)
            return String.valueOf(randomBottle);
        else
            return "failed";
    }
}
