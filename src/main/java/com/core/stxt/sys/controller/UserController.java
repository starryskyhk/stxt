package com.core.stxt.sys.controller;


import com.core.stxt.common.model.R;
import com.core.stxt.sys.service.IUserService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-30
 */
@Api(tags = "用户管理")
@RestController
@RequestMapping("/sys/user")
public class UserController {
    @Autowired
    private IUserService userService;

    @ApiOperation("获取所有的用户")
    @GetMapping("/getAllUsers")
    public R getAllUsers(){
        return R.ok("请求成功",userService.list());
    }

    @ApiOperation("根据id获取用户")
    @GetMapping("/getUserById/{id}")
    @ApiImplicitParams(@ApiImplicitParam(paramType="path", name = "id",value = "用户id",required = true,dataType = "String"))
    public R getUserById(@PathVariable String id){
        return R.ok("查询成功",userService.getById(id));
    }

}
