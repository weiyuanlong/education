package com.education.official.mapper;

import com.education.official.pojo.Profess;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

/**
 * 处理专业的mapper接口
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-07-27 15:16:27
 * @Modified By:
 */
@Repository
public interface ProfessMapper {

    /**
     * 分页条件查询专业
     *
     * @param paramMap
     * @return
     */
    List<Map> findProfessList(Map paramMap);

    /**
     * 添加专业
     *
     * @param profess
     */
    void insertProfess(Profess profess);

    /**
     * 修改专业
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

    /**
     * 查询所有一级专业
     *
     * @return
     */
    List<Map> findParentProfess();

    /**
     * 查询所有生效的专业列表
     *
     * @return
     */
    List<Map> findProfessAll();

}
