package com.xyl.myacg.modules.mainPic.web;

import com.xyl.myacg.common.mapper.JsonMapper;
import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.mainPic.entity.MainPic;
import com.xyl.myacg.modules.mainPic.service.IMainPicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by yyq on 2017/7/10.
 */
@Controller
@RequestMapping(value = "mainPic")
public class MainPicController {
    @Autowired
    IMainPicService mainPicService;

    @ModelAttribute
    public MainPic get(@RequestParam(required = false) String id) {
        MainPic entity = null;
        if (id!=null&&!id.equals("")) {
            entity = mainPicService.get(id);
        }
        if (entity == null) {
            entity = new MainPic();
        }
        return entity;
    }

    @RequestMapping(value = "getMainPic")
    public String getMainPic(){
        return "admin/mainPic";
    }

    @RequestMapping(value = "operation")
    public String operMainPic(MainPic mainPic, @RequestParam("oper")String oper){
        if(oper.equals("del")){
            String[] strs = mainPic.getId().split(",");
            for(int i=0;i<strs.length;i++){
                mainPic.setId(strs[i]);
                mainPicService.deleteMainPic(mainPic);
            }
        }
        return "admin/mainPic";
    }

    @RequestMapping(value = "mainPicAja")
    @ResponseBody
    public String getMainPicAja(MainPic mainPic, HttpServletRequest request){



        Page<MainPic> page = mainPicService.findPage(new Page<MainPic>(request),mainPic);

        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;
    }

    @RequestMapping(value = "form")
    public String form(MainPic mainPic, Model model) {
        model.addAttribute("mainPic", mainPic);
        return "admin/mainPicForm";
    }

    @RequestMapping(value = "save")
    public String save(MainPic mainPic, HttpServletRequest request) {
        mainPicService.saveMainPic(mainPic,request);
        return "admin/mainPic";
    }
}
