package com.education.official.service;

import com.education.official.pojo.Profess;
import com.github.pagehelper.PageInfo;

import java.util.Map;

/**
 * 处理专业的service层接口
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-07-27 15:15:23
 * @Modified By:
 */
public interface ProfessService {

    /**
     * 条件分页查询专业
     *
     * @param paramMap
     * @return
     */
    PageInfo findProfessList(Map paramMap);

    /**
     * 添加专业
     *
     * @param profess
     */
    void addProfess(Profess profess);

    /**
     * 编辑专业
     *
     * @param profess
     */
    void updateProfess(Profess profess);

    /**
     * 根据ID查询专业
     *
     * @param id
     * @return
     */
    Map findProfessById(Integer id);

}
