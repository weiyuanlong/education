package com.education.official.controller.proscen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 联系我们
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-08-01 14:06:38
 */
@Controller
@RequestMapping("pro")
public class ProContact {

    /**
     * 跳转前台联系我们页面
     *
     * @return
     */
    @RequestMapping("getConcat")
    public ModelAndView getConcat(String menu, ModelAndView modelAndView) {
        modelAndView.addObject("menu",menu);
        modelAndView.setViewName("proscen/contact");
        return modelAndView;
    }

}
