package com.education.official.controller.backstage;

import com.education.official.pojo.QuestionAnswer;
import com.education.official.service.QuestionService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import java.util.Map;

/**
 * 招生问答
 *
 * @Author:weiyuanlong
 * @Date: Created in
 * @Modified By:
 */
@Controller
public class QuestionAnswerController extends BaseController {

    /** 操作问答的service层对象 */
    @Resource
    private QuestionService questionService;

    /**
     * 跳转到问答管理页面
     *
     * @return
     */
    @RequestMapping("getQuestionList")
    public String getQuestionList() {
        return "backstage/jsp/questionAnswerList";
    }

    /**
     * 跳转到添加/编辑问答页面
     *
     * @param id
     * @param modelAndView
     * @return
     */
    @RequestMapping("getAddOrEditQuestion")
    public ModelAndView getAddOrEditQuestion(Integer id, ModelAndView modelAndView) {
        modelAndView.addObject("id",id);
        modelAndView.setViewName("backstage/jsp/questionAddOrEdit");
        return modelAndView;
    }

    /**
     * 查询问答列表
     *
     * @param paramMap
     * @return
     */
    @RequestMapping("queryQuestion")
    @ResponseBody
    public String queryQuestion(Map paramMap) {
        try {
            PageInfo pageInfo = questionService.findQuestionList(paramMap);
            convertList(pageInfo);
            return setPageResultInfo(true,"查询成功",pageInfo);
        }catch (Exception e) {
            e.printStackTrace();
            return setJsonMessage(false,"查询失败");
        }
    }

    /**
     * 添加或编辑问答
     *
     * @param questionAnswer
     * @return
     */
    @RequestMapping("addOrEditQuestion")
    @ResponseBody
    public String addOrEditQuestion(@RequestBody QuestionAnswer questionAnswer) {
        try {
            if(questionAnswer.getId() == null) {
                // 添加操作
                questionService.addQuestion(questionAnswer);
            }else {
                // 编辑操作
                questionService.editQuestion(questionAnswer);
            }
            return setJsonMessage(true,"添加成功");
        }catch(Exception e) {
            e.printStackTrace();
            return setJsonMessage(true,"添加/编辑失败");
        }
    }

    /**
     * 删除问答
     *
     * @return
     */
    @RequestMapping("deleteQuestion")
    @ResponseBody
    public String deleteQuestion(QuestionAnswer questionAnswer) {
        try {
            questionAnswer.setDeleted(true);
            questionService.editQuestion(questionAnswer);
            return setJsonMessage(true,"删除成功");
        }catch (Exception e) {
            e.printStackTrace();
            return  setJsonMessage(false,"删除失败");
        }
    }

    /**
     * 修改问答状态
     *
     * @param questionAnswer
     * @return
     */
    @RequestMapping("updateQuestion")
    @ResponseBody
    public String updateQuestion(QuestionAnswer questionAnswer) {
        try {
            questionService.editQuestion(questionAnswer);
            return setJsonMessage(true,"修改成功");
        }catch (Exception e) {
            e.printStackTrace();
            return  setJsonMessage(false,"修改失败");
        }
    }

    /**
     * 根据ID查询问答信息
     *
     * @param id
     * @return
     */
    @RequestMapping("findQuestionById")
    @ResponseBody
    public String findQuestionById(Integer id) {
        try {
            Map question = questionService.findQuestionById(id);
            return setJsonMessage(true,"查询成功",question);
        }catch (Exception e) {
            e.printStackTrace();
            return setJsonMessage(false,"查询失败");
        }
    }

}
