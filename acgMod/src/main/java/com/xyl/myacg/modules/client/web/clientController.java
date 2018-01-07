package com.xyl.myacg.modules.client.web;

import com.xyl.myacg.common.mapper.JsonMapper;
import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.bufan.entity.Bufan;
import com.xyl.myacg.modules.bufan.service.IBufanService;
import com.xyl.myacg.modules.mainPic.entity.MainPic;
import com.xyl.myacg.modules.mainPic.service.IMainPicService;
import com.xyl.myacg.modules.subao.entity.Subao;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import com.xyl.myacg.modules.tuijian.entity.Tuijian;
import com.xyl.myacg.modules.tuijian.service.ITuijianService;
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
    @Autowired
    ITuijianService tuijianService;
    @Autowired
    IBufanService bufanService;

    //这个暂时用不上了
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

    @RequestMapping(value = "showAnimation")
    public String showAnimation(){
        return "user/index";
    }

    @RequestMapping(value = "showMusic")
    public String showMusic(){
        return "user/song";
    }

    //ajax方法获得主要图片
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

    @RequestMapping(value = "tuijianAja")
    @ResponseBody
    public String getTuijianAja(Tuijian tuijian, HttpServletRequest request){
        Page<Tuijian> page = tuijianService.findPage(new Page<Tuijian>(request),tuijian);
//        for(int i=0;i<page.getList().size();i++){
//            String path = page.getList().get(i).getPath();
//            page.getList().get(i).setPath(path.replaceAll("upload","pic"));
//        }

        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;
    }

    @RequestMapping(value = "subaoAja")
    @ResponseBody
    public String getSubaoAja(Subao subao, HttpServletRequest request){
        Page<Subao> page = subaoService.findPage(new Page<Subao>(request),subao);
//        for(int i=0;i<page.getList().size();i++){
//            String path = page.getList().get(i).getPath();
//            page.getList().get(i).setPath(path.replaceAll("upload","pic"));
//        }

        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;
    }

    @RequestMapping(value = "bufanAja")
    @ResponseBody
    public String getBufanAja(Bufan bufan, HttpServletRequest request){
        Page<Bufan> page = bufanService.findPage(new Page<Bufan>(request),bufan);
//        for(int i=0;i<page.getList().size();i++){
//            String path = page.getList().get(i).getPath();
//            page.getList().get(i).setPath(path.replaceAll("upload","pic"));
//        }

        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;
    }
}
