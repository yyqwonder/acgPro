package com.xyl.myacg.modules.mainPic.web;

import com.xyl.myacg.modules.mainPic.entity.MainPic;
import com.xyl.myacg.modules.mainPic.service.IMainPicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;



/**
 * Created by yyq on 2017/7/10.
 */
@Controller

public class MainPicController {
    @Autowired
    IMainPicService mainPicService;
    @RequestMapping(value = "/bb")
    public String getMainPic(Model model, HttpServletRequest re){
        List<MainPic> list = mainPicService.getMainPic();
        model.addAttribute("list",list);
        String s = re.getContextPath();
        System.out.println(s);
        return "user/index";
    }

}
