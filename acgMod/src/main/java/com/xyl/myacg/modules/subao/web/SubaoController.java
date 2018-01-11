package com.xyl.myacg.modules.subao.web;

import com.xyl.myacg.common.mapper.JsonMapper;
import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.subao.entity.Subao;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;


/**
 * Created by yyq on 2017/7/22.
 */
@Controller
@RequestMapping(value = "subao")
public class SubaoController {
    @Autowired
    private ISubaoService subaoService;
    @RequestMapping(value = "getSubao")
    public String getSubao(){
        return "admin/subao";
    }

    @RequestMapping(value = "operation")
    public String operSubao(Subao subao,@RequestParam("oper")String oper){
        if(oper.equals("edit")){
            subaoService.updateSubao(subao);
        }

        if(oper.equals("del")){
            String[] strs = subao.getId().split(",");
            for(int i=0;i<strs.length;i++){
                subao.setId(strs[i]);
                subaoService.deleteSubao(subao);
            }

        }

        if(oper.equals("add")){
            subao.setId(UUID.randomUUID().toString().replaceAll("-", ""));
            subaoService.insertSubao(subao);
        }
        return "admin/subao";

    }

    @RequestMapping(value = "subaoAja")
    @ResponseBody
    public String getSubaoAja(Subao subao, HttpServletRequest request){



        Page<Subao> page = subaoService.findPage(new Page<Subao>(request),subao);

        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;
    }

}
