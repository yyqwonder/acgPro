package com.xyl.myacg.modules.client.web;

import com.xyl.myacg.common.mapper.JsonMapper;
import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.mainPic.entity.MainPic;
import com.xyl.myacg.modules.subao.entity.Subao;
import com.xyl.myacg.modules.mainPic.service.IMainPicService;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

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
    @RequestMapping(value = "showWeb")
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
    }
    @RequestMapping(value = "mainPicMoreAja")
    @ResponseBody
    public String getMainPicAja(MainPic mainPic, HttpServletRequest request){
        Page<MainPic> page = mainPicService.findPage(new Page<MainPic>(request),mainPic);
//        for(int i=0;i<page.getList().size();i++){
//            String path = page.getList().get(i).getPath();
//            page.getList().get(i).setPath(path.replaceAll("upload","pic"));
//        }


        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;

    }
}
