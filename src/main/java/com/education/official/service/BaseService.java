package com.education.official.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.polaris.base.utils.date.DateUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author:lixiayu
 * @Description:
 * @Date: Created in  2018/4/4 0004 下午 3:06
 * @Modified By:
 */
public  class BaseService<T> {

    protected  int pageNum = 1 ;
    protected  int pageSize = 10;
    private    Map conditionMap;

    /**
     * 是否分页
     * @param isPage
     */
    public  void setPage(boolean isPage){
        if(isPage)
            PageHelper.startPage(pageNum,pageSize);
    }

    public void setPageNumOrSize(int pageNum,int pageSize) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        setPage(true);
    }

    public void setConditionMap(Map _conditionMap) {
        this.conditionMap = _conditionMap;
        if (conditionMap.containsKey("page")&&conditionMap.containsKey("limit"))
        {
            pageNum = Integer.parseInt(conditionMap.get("page").toString());
            pageSize = Integer.parseInt(conditionMap.get("limit").toString());
            setPage(true);
        }

    }
    /**
     *  分页结果集
     */
    protected  PageInfo<T> getPageResult(List<T> list){
        PageInfo<T> result= new PageInfo(list);
        return result;
    }

    /**
     * 获取时间
     * @return
     */
    protected Date getDate(){
        return  DateUtils.getUTCDate();//世界标准时间
    }

    /**
     * 获取时间戳
     * @return
     */
    protected  Long getLastTimesTamp(){
        return DateUtils.getCNDate().getTime();
    }


    public Map getConditionMap() {
        return conditionMap;
    }

    public int getPageNum() {
        return pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

}
