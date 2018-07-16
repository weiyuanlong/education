package com.education.official.mapper;

import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * mapper测试接口
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-07-16 17:26:32
 * @Modified By:
 */
@Repository
public interface TestMapper {

    /**
     * 查询数据
     *
     * @return
     */
    Map findData();

}
