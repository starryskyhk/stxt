package com.core.utils.testExcel;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.core.stxt.sys.entity.po.User;
import org.junit.jupiter.api.Test;

import java.util.List;

/**
 * @ClassName : read
 * @Description :
 * @Author : Starry_sky
 * @Date: 2021-02-25 14:16  //时间
 */

public class read {
    @Test
    public void test01() {
        ExcelReader reader = ExcelUtil.getReader("C:\\Users\\Lenovo\\Desktop\\用户信息导入模板.xlsx");
        List<User> read = reader.readAll(User.class);
        for(User user :read){
            System.out.println(user);
        }
    }
}
