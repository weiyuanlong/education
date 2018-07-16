package com.education.official.controller;

import com.education.official.service.TestService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * 测试控制层实现类
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-07-16 16:41:07
 * @Modified By: weiyuanlong
 */
@Controller
public class TestController {

    /** service层测试对象 */
    @Resource
    private TestService testService;

    /**
     * 编写第一个测试方法
     *
     * @param modelAndView
     * @return
     */
    @RequestMapping("testJsp")
    public ModelAndView testJsp(ModelAndView modelAndView) throws Exception {
        String s = testService.testMethod();

        modelAndView.setViewName("testOne");
        modelAndView.addObject("hello",s);

        return modelAndView;
    }

}
