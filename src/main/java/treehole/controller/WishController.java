package treehole.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import treehole.service.IWishService;
import treehole.service.WishService;

@Controller
public class WishController {
    private WishService wishService;

    @Autowired
    public WishController(WishService wishService) {
        this.wishService=wishService;
    }

}
