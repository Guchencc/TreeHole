package treehole.model;

import java.util.List;

public class PageBean<T> {
    //当前页
    private int pageNum;
    //每页条目数
    private int pageSize;
    //总条目数
    private int totalRecord;

    private int totalPage;
    private int startIndex;

    private List<T> list;
    private int start;
    private int end;

    public PageBean(int pageNum, int pageSize, int totalRecord){
        this.pageNum=pageNum;
        this.pageSize=pageSize;
        this.totalRecord=totalRecord;
        if (totalRecord%pageSize==0) {
            totalPage=totalRecord/pageSize;
        }else{
            totalPage=totalRecord/pageSize+1;
        }
        this.startIndex=(pageNum-1)*pageSize;
        this.start=1;
        this.end=5;

        if (totalPage<5){
            this.end=this.totalPage;
        }else{
            start=pageNum-2;
            end=pageNum+2;
            if (start<=0){
                start=1;
                end=5;
            }
            if (end>totalPage) {
                end=totalPage;
                start=end-5;
            }
        }
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(int startIndex) {
        this.startIndex = startIndex;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", totalRecord=" + totalRecord +
                ", totalPage=" + totalPage +
                ", startIndex=" + startIndex +
                ", list=" + list +
                ", start=" + start +
                ", end=" + end +
                '}';
    }
}
