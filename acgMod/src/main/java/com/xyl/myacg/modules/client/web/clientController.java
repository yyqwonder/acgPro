package com.xyl.myacg.modules.client.web;

import com.xyl.myacg.modules.mainPic.entity.MainPic;
import com.xyl.myacg.modules.subao.entity.Subao;
import com.xyl.myacg.modules.mainPic.service.IMainPicService;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by yyq on 2017/8/14.
 */
@Controller
@RequestMapping(value = "client")
public class clientController {
    @Autowired
    IMainPicService mainPicService;
    ISubaoService subaoService;
    @RequestMapping(value = "showWeb")
    public String showWeb(MainPic mainPic , Subao subao,Model model){
        List<MainPic> mainPicList = mainPicService.findList(mainPic);
        for(int i=0;i<mainPicList.size();i++){
            String path = mainPicList.get(i).getPath();
            mainPicList.get(i).setPath(path.replaceAll("upload","pic"));
        }
        //List<Subao> subaoList = subaoService.findList(subao);
        model.addAttribute("mainPicList",mainPicList);
        //model.addAttribute("subaoList",subaoList);
        return "user/index";
    }
}
