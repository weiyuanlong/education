package com.education.official.controller.backstage;

import com.education.official.pojo.UserMessage;
import com.education.official.service.UserMessageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;

/**
 * 用户留言处理controller
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-08-08 14:13:58
 * @Modified By:
 */
@Controller
public class UserMessageController extends BaseController {

    /** service层处理用户留言的对象 */
    @Resource
    private UserMessageService userMessageService;

    /**
     * 添加用户留言
     *
     * @return
     */
    @RequestMapping("addUserMessage")
    @ResponseBody
    public String addUserMessage(UserMessage userMessage) {
        try {
            userMessageService.insertUserMessage(userMessage);
            return setJsonMessage(true,"留言成功！");
        }catch (Exception e) {
            e.printStackTrace();
            return setJsonMessage(false,"留言失败！");
        }

    }

}
