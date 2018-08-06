package com.education.official.service.impl;

import com.education.official.mapper.QuestionMapper;
import com.education.official.pojo.QuestionAnswer;
import com.education.official.service.BaseService;
import com.education.official.service.QuestionService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 操作问答的sercice层实现类
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-08-06 14:51:20
 * @Modified By:
 */
@Service
public class QuestionServiceImpl extends BaseService implements QuestionService {

    /** 操作问答的mapper对象 */
    @Resource
    private QuestionMapper questionMapper;

    /**
     * @see com.education.official.service.QuestionService#addQuestion(QuestionAnswer)
     *
     */
    @Override
    public void addQuestion(QuestionAnswer questionAnswer) {
        questionAnswer.setCreateTime(new Date());
        questionMapper.addQuestion(questionAnswer);
    }

    /**
     * @see com.education.official.service.QuestionService#editQuestion(QuestionAnswer)
     *
     */
    @Override
    public void editQuestion(QuestionAnswer questionAnswer) {
        questionAnswer.setUpdateTime(new Date());
        questionMapper.updateQuestin(questionAnswer);
    }

    /**
     * @see com.education.official.service.QuestionService#findQuestionList(Map)
     *
     */
    @Override
    public PageInfo findQuestionList(Map paramMap) {
        setConditionMap(paramMap);
        List<Map> result = questionMapper.findQuestionList(paramMap);
        return getPageResult(result);
    }

    /**
     * @see com.education.official.service.QuestionService#findQuestionById(Integer)
     *
     */
    @Override
    public Map findQuestionById(Integer id) {
        return questionMapper.findQuestionById(id);
    }

    /**
     * @see QuestionService#findQuestionAll()
     *
     */
    @Override
    public List<Map> findQuestionAll() {
        return questionMapper.findQuestionList(null);
    }

}
