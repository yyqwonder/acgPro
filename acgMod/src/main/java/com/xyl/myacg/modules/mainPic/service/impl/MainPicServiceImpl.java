package com.xyl.myacg.modules.mainPic.service.impl;

import com.xyl.myacg.common.persistence.Page;
import com.xyl.myacg.modules.mainPic.dao.IMainPicDao;
import com.xyl.myacg.modules.mainPic.entity.MainPic;
import com.xyl.myacg.modules.mainPic.service.IMainPicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by yyq on 2017/7/11.
 */
@Service("mainPicService")
public class MainPicServiceImpl implements IMainPicService {
    @Autowired
    private IMainPicDao mainPicDao;

    public int updateMainPic(MainPic mainPic){
        return mainPicDao.update(mainPic);
    }

    public int deleteMainPic(MainPic mainPic){
        return mainPicDao.delete(mainPic);
    }

    public int addMainPic(MainPic mainPic){
        return mainPicDao.insert(mainPic);
    }

    public Page<MainPic> findPage(Page<MainPic> page, MainPic mainPic){
        page.setList(mainPicDao.findList(mainPic));
        page.initial();
        List<MainPic> list = new ArrayList<MainPic>();
        for(int i=page.getBegin();i<page.getBegin()+page.getPageSize()&& i < page.getTotalRecords();i++){
            list.add(page.getList().get(i));
        }
        page.setList(list);
        return page;
    }

    public MainPic get(String id){

       return mainPicDao.get(id);
    }

    public int saveMainPic(MainPic mainPic, HttpServletRequest request){
        String isChange = request.getParameter("isChange");
        //编辑 图片位置 F:\\acgPro\\acgMod\\target\\acgArt\\upload
        if(null!=mainPic.getId()&&!mainPic.getId().equals("")) {
            if("false".equals(isChange)){
                mainPic.setPath(mainPic.getPath());
            }
            if("true".equals(isChange)){
                String path = request.getSession().getServletContext().getRealPath("upload");
                String fileName = mainPic.getFile().getOriginalFilename();
                File targetFile = new File(path, fileName);
                if(!targetFile.exists()){
                    targetFile.mkdirs();
                }

                //保存
                try {
                    mainPic.getFile().transferTo(targetFile);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                //数据库字段填值
                mainPic.setPath("/upload/"+fileName);
            }

            return mainPicDao.update(mainPic);
        }
        //添加
        if(null==mainPic.getId()||mainPic.getId().equals("")){
            mainPic.setId(UUID.randomUUID().toString().replaceAll("-", ""));
            String path = request.getSession().getServletContext().getRealPath("upload");
            String fileName = mainPic.getFile().getOriginalFilename();
            File targetFile = new File(path, fileName);
            if(!targetFile.exists()){
                targetFile.mkdirs();
            }

            try {
                mainPic.getFile().transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }

            mainPic.setPath("/upload/"+fileName);
            return mainPicDao.insert(mainPic);
        }
        return 0;
    }


    public List<MainPic> findList(MainPic mainPic){
        return mainPicDao.findList(mainPic);
    }
}

