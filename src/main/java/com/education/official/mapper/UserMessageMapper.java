package com.education.official.mapper;

import com.education.official.pojo.UserMessage;

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

}
