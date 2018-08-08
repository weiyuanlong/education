package com.education.official.service.impl;

import com.education.official.mapper.UserMessageMapper;
import com.education.official.pojo.UserMessage;
import com.education.official.service.BaseService;
import com.education.official.service.UserMessageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;

/**
 * 处理用户留言的service层实现类
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-08-08 14:15:36
 * @Modified By:
 */
@Service
public class UserMessageServieImpl extends BaseService implements UserMessageService {

    /** 操作用户留言的mapper对象 */
    @Resource
    private UserMessageMapper userMessageMapper;

    /**
     * @see com.education.official.service.UserMessageService#insertUserMessage(UserMessage)
     *
     */
    @Override
    public void insertUserMessage(UserMessage userMessage) {
        userMessage.setCreateTime(new Date());
        userMessageMapper.insertUserMessage(userMessage);
    }

}
