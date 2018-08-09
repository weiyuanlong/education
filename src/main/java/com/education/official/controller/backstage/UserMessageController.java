package com.education.official.controller.backstage;

import com.education.official.pojo.Profess;
import com.education.official.pojo.UserMessage;
import com.education.official.service.UserMessageService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import java.util.Map;

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

    /**
     * 跳转用户留言列表页面
     *
     * @return
     */
    @RequestMapping("getUserMessageList")
    public String getUserMessageList() {
        return "backstage/jsp/userMessageList";
    }

    /**
     * 条件查询用户留言列表
     *
     * @param paramMap
     * @return
     */
    @RequestMapping("findUserMessageAll")
    @ResponseBody
    public String findUserMessageAll(@RequestParam Map paramMap) {
        try {
            PageInfo userMessages = userMessageService.findUserMessageAll(paramMap);
            convertList(userMessages);
            return setPageResultInfo(true,"查询成功",userMessages);
        }catch (Exception e) {
            e.printStackTrace();
            return setPageResultInfo(false,"查询失败");
        }
    }

    /**
     * 修改留言状态
     *
     * @param userMessage
     * @return
     */
    @RequestMapping("updateUserMessageStatus")
    @ResponseBody
    public String updateUserMessageStatus(UserMessage userMessage) {

        try{
            userMessageService.updateUserMessage(userMessage);
            return setJsonMessage(true,"修改成功");
        }catch (Exception e) {
            e.printStackTrace();
            return setJsonMessage(false,"修改失败");
        }
    }

    /**
     * 删除留言
     *
     * @param userMessage
     * @return
     */
    @RequestMapping("deleteUserMessageStatus")
    @ResponseBody
    public String deleteUserMessageStatus(UserMessage userMessage) {
        userMessage.setDeleted(true);
        userMessageService.updateUserMessage(userMessage);
        return  setJsonMessage(true,"删除成功");
    }

}
