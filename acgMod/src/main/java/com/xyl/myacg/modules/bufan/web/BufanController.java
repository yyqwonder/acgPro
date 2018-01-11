package com.xyl.myacg.modules.bufan.web;

import com.xyl.myacg.common.mapper.JsonMapper;
import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.bufan.entity.Bufan;
import com.xyl.myacg.modules.bufan.service.IBufanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * Created by yyq on 2018/1/5.
 */
@Controller
@RequestMapping(value = "bufan")
public class BufanController {
    @Autowired
    private IBufanService bufanService;
    @RequestMapping(value = "getBufan")
    public String getBufan(){
        return "admin/bufan";
    }

    @RequestMapping(value = "operation")
    public String operBufan(Bufan bufan, @RequestParam("oper")String oper){
        if(oper.equals("edit")){
            bufanService.updateBufan(bufan);
        }

        if(oper.equals("del")){
            String[] strs = bufan.getId().split(",");
            for(int i=0;i<strs.length;i++){
                bufan.setId(strs[i]);
                bufanService.deleteBufan(bufan);
            }

        }

        if(oper.equals("add")){
            bufan.setId(UUID.randomUUID().toString().replaceAll("-", ""));
            bufanService.insertBufan(bufan);
        }
        return "admin/bufan";

    }

    @RequestMapping(value = "bufanAja")
    @ResponseBody
    public String getBufanAja(Bufan bufan, HttpServletRequest request){



        Page<Bufan> page = bufanService.findPage(new Page<Bufan>(request),bufan);

        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;
    }
}
