package com.core.stxt.common.utils;

import com.core.stxt.sys.entity.po.User;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName : TransferUtils
 * @Description :
 * @Author : Starry_sky
 * @Date: 2021-02-25 14:39  //时间
 */

public class TransferUtils {
    public static List<User> toUserList(List<List<Object>> list){
        List<User> userList = new ArrayList<>();
        List<Object> user;
        for(int i=1;i<list.size();i++){
            user = list.get(i);
            //学号,姓名，性别，邮箱，手机号码，班级
            //密码默认为学号，角色默认为学生
            String id = String.valueOf(user.get(0));
            String name = (String) user.get(1);
            Integer sex = "男".equals(user.get(2)) ? 0 : 1;
            String email = (String) user.get(3);
            String phone = String.valueOf(user.get(4));
            String className = (String) user.get(5);
            User newUser = new User().setId(id).setName(name).setSex(sex).
                    setEmail(email).setPhone(phone).setClassName(className)
                    .setPassword(id).setRoleId(1);
            userList.add(newUser);
        }
        return userList;
    }
}
