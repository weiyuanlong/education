package com.education.official.controller.proscen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 前台 操作招生动态的controller
 *
 * @Author:weiyuanlong
 * @Date: Created in
 * @Modified By:
 */
@Controller
@RequestMapping("pro")
public class ProEnrollmentController {

    /**
     * 跳转前台招生动态页面
     *
     * @return
     */
    @RequestMapping("getEnroll")
    public ModelAndView getEnroll(String menu, ModelAndView modelAndView) {
        modelAndView.addObject("menu",menu);
        modelAndView.setViewName("proscen/enrollment");
        return modelAndView;
    }

}
