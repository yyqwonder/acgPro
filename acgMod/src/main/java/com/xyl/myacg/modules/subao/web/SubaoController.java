package com.xyl.myacg.modules.subao.web;

import com.xyl.myacg.common.mapper.JsonMapper;
import com.xyl.myacg.modules.subao.entity.Subao;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.UUID;


/**
 * Created by yyq on 2017/7/22.
 */
@Controller
@RequestMapping(value = "subao")
public class SubaoController {
    @Autowired
    ISubaoService subaoService;
    @RequestMapping(value = "getSubao")
    public String getSubao(){
        return "admin/subao1";
    }

    @RequestMapping(value = "operation")
    public String editSubao(@RequestParam("id")String id , @RequestParam(value="content", required=false)String content,@RequestParam("oper")String oper){
        if(oper.equals("edit")){
            Subao subao = new Subao();
            subao.setId(id);
            subao.setContent(content);
            subaoService.updateSubao(subao);
        }

        if(oper.equals("del")){
            Subao subao = new Subao();
            subao.setId(id);
            subaoService.deleteSubao(subao);
        }

        if(oper.equals("add")){
            Subao subao = new Subao();
            subao.setId(UUID.randomUUID().toString().replaceAll("-", ""));
            subao.setContent(content);
            subaoService.addSubao(subao);
        }

        return "admin/subao1";

    }

    @RequestMapping(value = "subaoAja")
    @ResponseBody
    public String getSubaoAja(Subao subao){
        List<Subao> list = subaoService.getSubao(subao);
        String jsonString = JsonMapper.toJsonString(list);
        return jsonString;
    }

}
