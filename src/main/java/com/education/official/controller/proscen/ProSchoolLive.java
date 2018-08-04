package com.education.official.controller.proscen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 前台 校园生活
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-08-01 13:57:35
 * @Modified By:
 */
@Controller
@RequestMapping("pro")
public class ProSchoolLive {

    /**
     * 跳转前台校园生活页面
     *
     * @return
     */
    @RequestMapping("getSchoolLive")
    public ModelAndView getScholLive(String menu, ModelAndView modelAndView) {
        modelAndView.addObject("menu",menu);
        modelAndView.setViewName("proscen/schoolLive");
        return modelAndView;
    }

}
