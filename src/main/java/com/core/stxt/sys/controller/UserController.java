package com.core.stxt.sys.controller;


import com.core.stxt.common.model.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Api(tags = "用户管理")
@RestController
@RequestMapping("/sys/user")
public class UserController {
    @ApiOperation(value = "添加用户")
    @PutMapping("")
    public R addUser(){
        return R.ok("添加成功");
    }
    @ApiOperation(value = "删除用户")
    @DeleteMapping("")
    public R deleteUser(){
        return R.ok("删除成功");
    }
    @ApiOperation(value = "更改用户")
    @PostMapping("")
    public R updateUser(){
        return R.ok("更改成功");
    }
    @ApiOperation(value = "查询所有用户")
    @GetMapping("")
    public R getUsers(){
        return R.ok("查询成功");
    }

}
