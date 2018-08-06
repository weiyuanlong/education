package com.education.official.service;

import com.education.official.pojo.QuestionAnswer;
import com.github.pagehelper.PageInfo;
import java.util.Map;

/**
 * 操作问答的service接口
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-08-06 14:50:27
 * @Modified By:
 */
public interface QuestionService {

    /**
     * 添加问答
     *
     * @param questionAnswer
     */
    void addQuestion(QuestionAnswer questionAnswer);

    /**
     * 修改问答
     *
     * @param questionAnswer
     */
    void editQuestion(QuestionAnswer questionAnswer);

    /**
     * 分页查询问答列表
     *
     * @param paramMap
     * @return
     */
    PageInfo findQuestionList(Map paramMap);

    /**
     * 根据ID查询问答列表
     *
     * @param id
     * @return
     */
    Map findQuestionById(Integer id);

}
