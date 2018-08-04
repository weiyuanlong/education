package com.education.official.controller.proscen;

import com.alibaba.fastjson.JSON;
import com.education.official.service.ProfessService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 前台操作专业的controller
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-07-30 16:59:51
 * @Modified By:
 */
@Controller
@RequestMapping("pro")
public class ProProfessController {

    /** 处理专业的service层对象 */
    @Resource
    private ProfessService professService;

    /**
     * 跳转前台专业页面
     *
     * @return
     */
    @RequestMapping("getProfessPro")
    public ModelAndView getProfessPro(String menu, ModelAndView modelAndView) {
        List<Map> professAll = professService.findProfessAll();
        modelAndView.addObject("menu",menu);
        modelAndView.addObject("datas",professAll);
        modelAndView.setViewName("proscen/profess");
        return modelAndView;
    }

    /**
     * 根据ID查询专业信息
     *
     * @param professId
     * @return
     */
    @RequestMapping("findProfessById")
    @ResponseBody
    public String findProfessProById(Integer professId) {
        Map profess = professService.findProfessById(professId);
        return JSON.toJSONString(profess);
    }

}
