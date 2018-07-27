package com.education.official.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 非模块controller
 *
 * @Author:weiyuanlong
 * @Date: Created in
 * @Modified By:
 */
@Controller
public class MainController {

    /**
     * 跳转首页
     *
     * @return
     */
    @RequestMapping("indexJsp")
    public String indexJsp() {
        return "backstage/jsp/index";
    }

    /**
     * 跳转主页
     *
     * @return
     */
    @RequestMapping("getMain")
    public String getMain() {
        return "backstage/jsp/main";
    }

}
