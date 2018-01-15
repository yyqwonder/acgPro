package com.xyl.myacg.modules.mainPic.web;

import com.xyl.myacg.common.mapper.JsonMapper;
import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.common.utils.StringUtils;
import com.xyl.myacg.modules.mainPic.entity.MainPic;
import com.xyl.myacg.modules.mainPic.service.IMainPicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by yyq on 2017/7/10.
 */
/**
 * 添加编辑流程
 * 1    mainPic.jsp带着参数id进入${ctxPath}/mainPic/form
 * 2    控制器带着mainPic(除id外别的属性全是空，添加时id为空，编辑时id有值)进入admin/mainPicForm
 * 3    mainPicForm.jsp里表单有modelAttribute="mainPic" -> 控制器里有带@ModelAttribute的方法get -> 根据之前id的值，返回一个MainPic实体
 *      -> 具体的一个MainPic进入mainPicForm.jsp的表单，各个属性分别填入各个path
 * 4    从表单进入${ctxPath}/mainPic/save
 */

@Controller
@RequestMapping(value = "mainPic")
public class MainPicController {
    @Autowired
    private IMainPicService mainPicService;

    @ModelAttribute
    public MainPic get(@RequestParam(required = false) String id) {
        //@ModelAttribute和form里的ModelAttribute对应，编辑就有值了,添加是空值
        //@RequestParam(required = false) String id添加的时候，id为null，所以@RequestParam(required = false)
        MainPic entity = null;
        if (StringUtils.isNotBlank(id)) {
            //有whitespace就不行
            entity = mainPicService.get(id);
        }
        if (entity == null) {
            entity = new MainPic();
        }
        return entity;
    }

    //到了这个页面，页面通过ajax加载数据
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

        //mainPic,只加载数据null；查找时肯定里面有属性不为空
        //new Page<MainPic>(request)构造函数初始化
        //controller的HttpServletRequest request
        Page<MainPic> page = mainPicService.findPage(new Page<MainPic>(request),mainPic);

        String jsonString = JsonMapper.toJsonString(page.getList());
        jsonString = "{\"total\":"+page.getTotalPages()+", \"page \":" + page.getPage() + ",\"records\": " + page.getTotalRecords() + ",\"rows\":"+jsonString+"}";
        return jsonString;
    }

    //点击添加或编辑，带着id来到这里；从这里再去表单网页
    @RequestMapping(value = "form")
    public String form(MainPic mainPic, Model model) {
        model.addAttribute("mainPic", mainPic);
        return "admin/mainPicForm";
    }

    @RequestMapping(value = "save")
    public String save(MainPic mainPic, HttpServletRequest request,RedirectAttributes redirectAttributes) {
        mainPicService.saveMainPic(mainPic,request);
        //return "admin/mainPic";
        //这个要redirect，否则按浏览器刷新按钮会要求重复提交表单(注意浏览器地址栏http://localhost/mainPic/save)
        return "redirect:/mainPic/getMainPic";
    }

    //搜索番剧未找到
    @RequestMapping(value = "getNotFound")
    public String getNotFound(){
        return "notFound";
    }

    //搜索番剧用到
    @RequestMapping(value = "list")
    public String findList(MainPic mainPic) {
        String content = mainPic.getContent();
        //转码
        try {
           content=new String(content.getBytes("ISO-8859-1"),"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        mainPic.setContent(content);
        List<MainPic> list = mainPicService.findList(mainPic);
        if(list.size()==0){
            return "redirect:/mainPic/getNotFound";
        }else{
            String url = list.get(0).getUrl();
            if("".equals(url)){
                return "redirect:/mainPic/getNotFound";
            }else{
                return "redirect:"+url;
            }
        }
    }
}


