package com.core.stxt.sys.controller;


import com.core.stxt.common.model.Result;
import com.core.stxt.sys.entity.User;
import com.core.stxt.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-29
 */
@RestController
@RequestMapping("/sys/user")
public class UserController {
    @Autowired
    private IUserService userService;

    @GetMapping("/getAllUser")
    public Result getAllUser(){
        List<User> list = userService.list();
        return Result.ok("查询成功",list);
    }


}
