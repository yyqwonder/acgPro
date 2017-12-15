package com.xyl.myacg.modules.mainPic.entity;

import com.xyl.myacg.common.persistence.BaseEntity;
import org.springframework.web.multipart.MultipartFile;
/**
 * Created by yyq on 2017/7/10.
 */
public class MainPic extends BaseEntity<MainPic> {
    String id;
    String path;
    String author;
    String classification;
    String time;
    String content;
    MultipartFile file;
    String url;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
