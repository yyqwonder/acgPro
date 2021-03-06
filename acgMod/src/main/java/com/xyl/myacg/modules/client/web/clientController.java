package com.xyl.myacg.modules.client.web;

import com.xyl.myacg.modules.bufan.service.IBufanService;
import com.xyl.myacg.modules.mainPic.service.IMainPicService;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import com.xyl.myacg.modules.tuijian.service.ITuijianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by yyq on 2017/8/14.
 */
@Controller
@RequestMapping(value = "client")
public class clientController {
    @Autowired
    IMainPicService mainPicService;
    @Autowired
    ISubaoService subaoService;
    @Autowired
    ITuijianService tuijianService;
    @Autowired
    IBufanService bufanService;

    //这个暂时用不上了
    /*@RequestMapping(value = "showWeb")
    public String showWeb(MainPic mainPic , Subao subao,Model model){
        List<MainPic> mainPicList = mainPicService.findList(mainPic);
        List<MainPic> mainPicInitList = new ArrayList<MainPic>();
//        for(int i=0;i<mainPicList.size();i++){
//            String path = mainPicList.get(i).getPath();
//            mainPicList.get(i).setPath(path.replaceAll("upload","pic"));
//        }
        for(int i=0;i<12;i++){
            mainPicInitList.add(mainPicList.get(i));
        }
        List<Subao> subaoList = subaoService.findList(subao);
        model.addAttribute("mainPicInitList",mainPicInitList);
        model.addAttribute("subaoList",subaoList);
        return "user/index";
    }*/

    @RequestMapping(value = "showAnimation")
    public String showAnimation(){
        return "user/index";
    }

    @RequestMapping(value = "showMusic")
    public String showMusic(){
        return "user/song";
    }


}
