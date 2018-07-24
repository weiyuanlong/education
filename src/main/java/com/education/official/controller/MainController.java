package com.education.official.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
     * 跳转主页
     *
     * @return
     */
    @RequestMapping("main.html")
    public String getMain() {
        return "backstage/jsp/main";
    }

}
