package com.education.official.controller;

import com.education.official.pojo.Profess;
import com.education.official.service.ProfessService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 专业管理
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-07-27 13:27:57
 * @Modified By:
 */
@Controller
public class ProfessController extends BaseController {

    /** 处理专业的service层对象 */
    @Resource
    private ProfessService professService;

    /**
     * 跳转到专业列表页面
     *
     * @return
     */
    @RequestMapping("professList")
    public String professList() {

        return "backstage/jsp/professList";
    }

    /**
     * 跳转到专业添加、编辑页面
     *
     * @return
     */
    @RequestMapping("addOrProfessPage")
    public ModelAndView addOrProfessPage(Integer id, ModelAndView modelAndView) {
        modelAndView.addObject("id",id);
        modelAndView.setViewName("backstage/jsp/professAddOrEdit");
        return modelAndView;
    }

    /**
     * 查询专业列表数据
     *
     * @return
     */
    @RequestMapping("findProfessList")
    @ResponseBody
    public String findProfessList(Map paramMap) {
        try {
            PageInfo professList = professService.findProfessList(paramMap);
            convertList(professList);
            return setPageResultInfo(true,"查询成功",professList);
        }catch (Exception e) {
            return setPageResultInfo(true,"查询失败");
        }
    }

    /**
     * 查询专业详情
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("findProfessInfo")
    public String findProfessInfo(Integer id) {
        try {
            Map profess = professService.findProfessById(id);
            return setJsonMessage(true,"查询成功",profess);
        }catch (Exception e) {
            e.printStackTrace();
            return setJsonMessage(true,"查询失败");
        }
    }

    /**
     * 添加/编辑专业
     *
     * @return
     */
    @RequestMapping("addOrEditProfess")
    @ResponseBody
    public String addOrEditProfess(@RequestBody Profess profess) {
        try{
            if(profess.getId() == null || profess.getId() == 0) {
                // 新增
                professService.addProfess(profess);
                return setJsonMessage(true,"添加成功");
            }else {
                // 编辑
                professService.updateProfess(profess);
                return setJsonMessage(true,"编辑成功");
            }
        }catch (Exception e) {
            e.printStackTrace();
            return setJsonMessage(true,"添加/编辑失败");
        }
    }

    /**
     * 修改专业状态
     *
     * @param profess
     * @return
     */
    @RequestMapping("updateProfess")
    @ResponseBody
    public String updateProfess(Profess profess) {

        try{
            professService.updateProfess(profess);
            return setJsonMessage(true,"修改成功");
        }catch (Exception e) {
            e.printStackTrace();
            return setJsonMessage(false,"修改失败");
        }
    }

    /**
     * 删除专业
     *
     * @param profess
     * @return
     */
    @RequestMapping("deleteProfess")
    @ResponseBody
    public String deleteProfess(Profess profess) {
        profess.setDeleted(true);
        return  setJsonMessage(true,"删除成功");
    }

}
