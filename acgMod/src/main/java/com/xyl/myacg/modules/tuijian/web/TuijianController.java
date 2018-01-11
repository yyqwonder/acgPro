package com.xyl.myacg.modules.tuijian.web;

import com.xyl.myacg.common.mapper.JsonMapper;
import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.tuijian.entity.Tuijian;
import com.xyl.myacg.modules.tuijian.service.ITuijianService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * Created by yyq on 2017/9/11.
 */
@Controller
@RequestMapping(value = "tuijian")
public class TuijianController {
    @Autowired
    private ITuijianService tuijianService;
    @RequestMapping(value = "getTuijian")
    public String getTuijian(){
        return "admin/tuijian";
    }

    @RequestMapping(value = "operation")
    public String operTuijian(Tuijian tuijian, @RequestParam("oper")String oper){
        if(oper.equals("edit")){
            tuijianService.updateTuijian(tuijian);
        }

        if(oper.equals("del")){
            String[] strs = tuijian.getId().split(",");
            for(int i=0;i<strs.length;i++){
                tuijian.setId(strs[i]);
                tuijianService.deleteTuijian(tuijian);
            }

        }

        if(oper.equals("add")){
            tuijian.setId(UUID.randomUUID().toString().replaceAll("-", ""));
            tuijianService.insertTuijian(tuijian);
        }
        return "admin/tuijian";

    }

    @RequestMapping(value = "tuijianAja")
    @ResponseBody
    public String getTuijianAja(Tuijian tuijian, HttpServletRequest request){



        Page<Tuijian> page = tuijianService.findPage(new Page<Tuijian>(request),tuijian);

        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;
    }

}
