package com.education.official.service.impl;

import com.education.official.mapper.ProfessMapper;
import com.education.official.pojo.Profess;
import com.education.official.service.BaseService;
import com.education.official.service.ProfessService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 处理专业的service层实现类
 *
 * @Author:weiyuanlong
 * @Date: Created in
 * @Modified By:
 */
@Service
public class ProfessServiceImpl extends BaseService implements ProfessService {

    /** mapper层操作专业的对象 */
    @Resource
    private ProfessMapper professMapper;

    /**
     * @see com.education.official.service.ProfessService#findProfessList(Map)
     *
     */
    @Override
    public PageInfo findProfessList(Map paramMap) {
        setConditionMap(paramMap);
        List<Map> profess =  professMapper.findProfessList(paramMap);
        return getPageResult(profess);
    }

    /**
     * @see com.education.official.service.ProfessService#addProfess(Profess)
     *
     */
    @Override
    public void addProfess(Profess profess) {
        profess.setCreateTime(new Date());
        professMapper.insertProfess(profess);
    }

    /**
     * @see com.education.official.service.ProfessService#updateProfess(Profess)
     *
     */
    @Override
    public void updateProfess(Profess profess) {
        profess.setUpdateTime(new Date());
        professMapper.updateProfess(profess);
    }

    /**
     * @see com.education.official.service.ProfessService#findProfessById(Integer)
     *
     */
    @Override
    public Map findProfessById(Integer id) {
        return professMapper.findProfessById(id);
    }

    /**
     * @see ProfessService#findParentProfess()
     *
     */
    @Override
    public List<Map> findParentProfess() {
        return professMapper.findParentProfess();
    }

    /**
     * @see ProfessService#findProfessAll()
     *
     */
    @Override
    public List<Map> findProfessAll() {
        return professMapper.findProfessAll();
    }

}
