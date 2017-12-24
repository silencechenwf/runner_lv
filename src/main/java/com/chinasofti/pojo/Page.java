package com.chinasofti.pojo;

/**
 * Created by Administrator on 2017/8/2.
 */
public class Page {
    private Integer pageNum;
    private Integer pagSize;

    public Page() {
    }

    public Page(Integer pageNum, Integer pagSize) {
        this.pageNum = pageNum;
        this.pagSize = pagSize;
    }

    public Integer getTotalCount(){
        return pageNum*pagSize;
    }
    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPagSize() {
        return pagSize;
    }

    public void setPagSize(Integer pagSize) {
        this.pagSize = pagSize;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNum=" + pageNum +
                ", pagSize=" + pagSize +
                '}';
    }
}
