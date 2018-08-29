package com.education.official.controller.proscen;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 首页controller
 *
 * @Author:weiyuanlong
 * @Date: Created in
 * @Modified By:
 */
@Controller
public class IndexController {

    /**
     * 跳转前台首页
     *
     * @return
     */
    @RequestMapping("/pro/getIndex")
    public ModelAndView getIndex(String menu, ModelAndView modelAndView) {
        modelAndView.addObject("menu",menu);
        modelAndView.setViewName("proscen/index");
        return modelAndView;
    }

    /**
     * 跳转前台首页
     *
     * @return
     */
    @RequestMapping("/")
    public ModelAndView findIndex(String menu, ModelAndView modelAndView) {
        modelAndView.addObject("menu",menu);
        modelAndView.setViewName("proscen/index");
        return modelAndView;
    }

}
