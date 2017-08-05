package com.xyl.myacg.common.persistence;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yyq on 2017/8/3.
 */
public class Page<T> {
    String page;
    String rows;
    int pageSize;
    int totalRecords;
    int begin;
    int end;
    int totalPages;
    private List<T> list = new ArrayList<T>();

    public Page(HttpServletRequest request){
        page = request.getParameter("page");
        rows = request.getParameter("rows");
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getRows() {
        return rows;
    }

    public void setRows(String rows) {
        this.rows = rows;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    public int getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(int totalRecords) {
        this.totalRecords = totalRecords;
    }

    public int getBegin() {
        return begin;
    }

    public void setBegin(int begin) {
        this.begin = begin;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public void initial(){
        pageSize = Integer.parseInt(rows);

        totalRecords = list.size();

        begin = (Integer.parseInt(page) - 1) * Integer.parseInt(rows); // 开始记录数
        end = (begin+pageSize)>=totalRecords?totalRecords:(begin+pageSize);



        totalPages = totalRecords % Integer.parseInt(rows) == 0 ? totalRecords
                / Integer.parseInt(rows) : totalRecords / Integer.parseInt(rows)
                + 1; // 计算总页数
    }


}
