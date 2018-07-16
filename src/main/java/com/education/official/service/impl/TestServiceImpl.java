package com.education.official.service.impl;

import com.alibaba.fastjson.JSON;
import com.education.official.mapper.TestMapper;
import com.education.official.service.TestService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Author:weiyuanlong
 * @Date: Created in
 * @Modified By:
 */
@Service
public class TestServiceImpl implements TestService {

    /** mapper测试对象 */
    @Resource
    private TestMapper testMapper;

    /**
     * @see TestService#testMethod()
     *
     * @return
     * @throws Exception
     */
    @Override
    public String testMethod() throws Exception {
        Map data = testMapper.findData();
        String s = JSON.toJSONString(data);
        return s;
    }

}
