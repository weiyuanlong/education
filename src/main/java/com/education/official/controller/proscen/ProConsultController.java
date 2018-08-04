package com.education.official.controller.proscen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

    /**
     * 跳转前台招生咨询页面
     *
     * @return
     */
    @RequestMapping("getConsult")
    public ModelAndView getEnroll(String menu, ModelAndView modelAndView) {
        modelAndView.addObject("menu",menu);
        modelAndView.setViewName("proscen/consult");
        return modelAndView;
    }

}
