package com.education.official.service;

import com.education.official.pojo.UserMessage;

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

}
