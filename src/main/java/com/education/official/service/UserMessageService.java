package com.education.official.service;

import com.education.official.pojo.UserMessage;
import com.github.pagehelper.PageInfo;

import java.util.Map;

/**
 * 处理用户留言service接口
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-08-08 14:14:48
 * @Modified By:
 */
public interface UserMessageService {

    /**
     * 插入用户留言
     *
     * @param userMessage
     */
    void insertUserMessage(UserMessage userMessage);

    /**
     * 条件分页查询用户留言列表数据
     *
     * @param paramMap
     * @return
     */
    PageInfo findUserMessageAll(Map paramMap);

    /**
     * 修改留言
     *
     * @param userMessage
     */
    void updateUserMessage(UserMessage userMessage);

}
