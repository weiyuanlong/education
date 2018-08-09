package com.education.official.mapper;

import com.education.official.pojo.UserMessage;

import java.util.List;
import java.util.Map;

/**
 * 处理用户留言的mapper接口
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-08-08 14:17:04
 * @Modified By:
 */
public interface UserMessageMapper {

    /**
     * 插入用户留言
     *
     * @param userMessage
     */
    void insertUserMessage(UserMessage userMessage);

    /**
     * 条件查询用用户留言列表
     *
     * @param paramMap
     * @return
     */
    List<Map> findUserMessageAll(Map paramMap);

    /**
     * 修改留言
     *
     * @param userMessage
     */
    void updateUserMessage(UserMessage userMessage);

}
