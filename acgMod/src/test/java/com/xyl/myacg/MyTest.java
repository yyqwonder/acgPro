package com.xyl.myacg;

import com.xyl.myacg.modules.subao.service.ISubaoService;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by yyq on 2017/8/23.
 */

public class MyTest extends BaseJunit4Test{
    @Resource
    private ISubaoService subaoService;
    private static Logger logger = Logger.getLogger(MyTest.class);

    @Test
    @Transactional   //标明此方法需使用事务
    @Rollback(false)  //标明使用完此方法后事务不回滚,true时为回滚
    public void test(){
        logger.info("ooooo");
    }
}
