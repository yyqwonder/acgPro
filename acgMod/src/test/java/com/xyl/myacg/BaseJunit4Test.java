package com.xyl.myacg;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by yyq on 2017/8/23.
 */
@RunWith(SpringJUnit4ClassRunner.class) //使用junit4进行测试
@ContextConfiguration(locations={"classpath*:/spring-mvc.xml","classpath*:/spring-mybatis.xml" })

public class BaseJunit4Test {
}
