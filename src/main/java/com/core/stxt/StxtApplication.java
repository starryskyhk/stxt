package com.core.stxt;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@SpringBootApplication
@EnableTransactionManagement //开启事务
@EnableCaching(proxyTargetClass = true)//强制使用cglib代理
@MapperScan("com.core.stxt.sys.mapper")
@ComponentScan(basePackages ={"com.core"})
public class StxtApplication {

    public static void main(String[] args) {
        SpringApplication.run(StxtApplication.class, args);
    }

}
