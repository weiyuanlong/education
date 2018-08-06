package com.education.official.mapper;

import com.education.official.pojo.QuestionAnswer;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 操作问答的mapper接口
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-08-06 14:52:06
 * @Modified By:
 */
@Repository
public interface QuestionMapper {

    /**
     * 添加问答
     *
     * @param questionAnswer
     */
    void addQuestion(QuestionAnswer questionAnswer);

    /**
     * 编辑问答
     *
     * @param questionAnswer
     */
    void updateQuestin(QuestionAnswer questionAnswer);

    /**
     * 分页查询问答列表
     *
     * @param paramMap
     * @return
     */
    List<Map> findQuestionList(Map paramMap);

    /**
     * 根据ID查询问答信息
     *
     * @param id
     * @return
     */
    Map findQuestionById(Integer id);

}
