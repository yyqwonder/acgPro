package com.xyl.myacg.modules.subao.web;

import com.xyl.myacg.common.mapper.JsonMapper;
import com.xyl.myacg.modules.subao.entity.Subao;
import com.xyl.myacg.modules.subao.service.ISubaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by yyq on 2017/7/22.
 */
@Controller
public class SubaoController {
    @Autowired
    ISubaoService subaoService;
    @RequestMapping(value = "/subao")
    public String getSubao(){
        return "admin/subao";
    }

    @RequestMapping(value = "/subaoAja")
    @ResponseBody
    public String getSubaoAja(){
        List<Subao> list = subaoService.getSubao();
        String jsonString = JsonMapper.toJsonString(list);
        return jsonString;
    }

}
