package com.education.official.controller.proscen;

import com.education.official.service.QuestionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 前台 招生咨询controller
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-07-30 17:36:07
 * @Modified By:
 */
@Controller
@RequestMapping("pro")
public class ProConsultController {

    /** 操作问答的service层对象 */
    @Resource
    private QuestionService questionService;

    /**
     * 跳转前台招生咨询页面
     *
     * @return
     */
    @RequestMapping("getConsult")
    public ModelAndView getEnroll(String menu, ModelAndView modelAndView) {
        List<Map> questions = questionService.findQuestionAll();

        modelAndView.addObject("menu",menu);
        modelAndView.addObject("questions",questions);
        modelAndView.setViewName("proscen/consult");
        return modelAndView;
    }

}
