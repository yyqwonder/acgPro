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
            String[] strs = id.split(",");
            for(int i=0;i<strs.length;i++){
                subao.setId(strs[i]);
                subaoService.deleteSubao(subao);
            }

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
    public String getSubaoAja(Subao subao, HttpServletRequest request){
        /*String page = request.getParameter("page");
        String rows = request.getParameter("rows");

        int begin = (Integer.parseInt(page) - 1) * Integer.parseInt(rows); // 开始记录数
        int pageSize = Integer.parseInt(rows);
        int totalRecord = 12;
        int end = (begin+pageSize)>=totalRecord?totalRecord:(begin+pageSize);

        int totalPage = totalRecord % Integer.parseInt(rows) == 0 ? totalRecord
                / Integer.parseInt(rows) : totalRecord / Integer.parseInt(rows)
                + 1; // 计算总页数

        //List<Subao> list = subaoService.getSubao(subao);
        Page<Subao> pageBean = new Page<Subao>();
        pageBean.setBegin(begin);
        pageBean.setEnd(end);
*/
        Page<Subao> page = subaoService.findPage(new Page<Subao>(request),subao);

        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;
    }

}
