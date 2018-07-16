package com.education.official;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * 项目启动类
 *
 */
@SpringBootApplication
@MapperScan("com.education.official.mapper")
public class OfficialApplication extends SpringBootServletInitializer {

    /**
     * 入口函数
     *
     * @param builder
     * @return
     */
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(OfficialApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(OfficialApplication.class, args);
    }

}
