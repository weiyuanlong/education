package com.education.official.controller;

import com.education.official.message.JsonMessage;
import com.education.official.message.PageResultInfo;
import com.github.pagehelper.PageInfo;
import com.polaris.base.utils.map.MapUtils;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author:Bill
 * @Description:
 * @Date:2018/3/29 17:55
 * @version:1.0
 **/
public class BaseController {

    /**
     * 数据封装
     */
    private JsonMessage jsonMessage;

    private PageResultInfo pageResultInfo;

    protected BaseController() {
        jsonMessage=new JsonMessage();
        pageResultInfo = new PageResultInfo();
    }

    protected String setSuccess(boolean success){
        jsonMessage.setSuccess(success);
        return toJsonMessage();
    }
    protected String setMessage(String message){
        jsonMessage.setMessage(message);
        return toJsonMessage();
    }
    protected String setData(Object data){
        jsonMessage.setData(data);
        return toJsonMessage();
    }

    protected String setJsonMessage(JsonMessage jsonMessage) {
        this.jsonMessage = jsonMessage;
        return toJsonMessage();
    }

    protected String setJsonMessage(boolean sussess, String messgae,Object data) {
        jsonMessage=new JsonMessage();
        setSuccess(sussess);
        setMessage(messgae);
        setData(data);
        return toJsonMessage();
    }

    protected String setJsonMessage(boolean sussess, String messgae) {
        jsonMessage=new JsonMessage();
        setSuccess(sussess);
        setMessage(messgae);
        return toJsonMessage();
    }

    protected JsonMessage getJsonMessage() {
        return this.jsonMessage;
    }

    protected  String toJsonMessage(){
        return com.alibaba.fastjson.JSON.toJSONString(jsonMessage);
    }

    //分页
    protected String setPageResultInfo(boolean success, String msg, long count ,long pageSize,Object data)
    {
        pageResultInfo = new PageResultInfo();
        pageResultInfo.setCode(success?0:1);
        pageResultInfo.setMsg(msg);
        pageResultInfo.setCount(count);
        pageResultInfo.setData(data);
        pageResultInfo.setPageSize(pageSize);
        return toJsonPageInfoMsg();
    }
    protected String setPageResultInfo(boolean success, String msg, PageInfo pageInfo)
    {
        return setPageResultInfo(success,msg,pageInfo.getTotal(),pageInfo.getPageSize(),pageInfo.getList());
    }
    protected String setPageResultInfo(boolean success, String msg)
    {
        pageResultInfo = new PageResultInfo();
        pageResultInfo.setCode(success?0:1);
        pageResultInfo.setMsg(msg);
        return toJsonPageInfoMsg();
    }

    protected  String toJsonPageInfoMsg(){
        return com.alibaba.fastjson.JSON.toJSONString(pageResultInfo);
    }

    /**
     * 列表数据转换
     * @param userPageInfo
     */
    protected void convertList(PageInfo userPageInfo){
        for (Object object:userPageInfo.getList()) {
            convert(object);
        }
    }

    /**
     * 数据转换
     * @param object
     */
    protected void convert(Object object){
        HashMap<String, Object> hasMap=null;
        if(object instanceof Map)
             hasMap = (HashMap<String, Object>) object;
        else
             hasMap= (HashMap) MapUtils.toMap(object);

    }

}
