package com.core.stxt.sys.controller;


import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.User;
import com.core.stxt.sys.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
    @Autowired
    private IUserService userService;
    @ApiOperation(value = "添加用户")
    @PutMapping("")
    public R addUser(User user,MultipartFile file){
        userService.saveUser(user,file);
        return R.ok("添加成功");
    }
    @ApiOperation(value = "删除用户")
    @DeleteMapping("/{id}")
    public R deleteUser(@PathVariable("id") String id){
        userService.deleteAllById(id);
        return R.ok("删除成功");
    }
    @ApiOperation(value = "批量删除用户")
    @DeleteMapping("")
    public R deleteUsers( String ids){
        userService.deleteAllByIds(Arrays.asList(ids.split(",")));
        return R.ok("删除成功");
    }
    @ApiOperation(value = "更改用户")
    @PostMapping("")
    public R updateUser(User user,MultipartFile file){
        userService.updateUser(user,file);
        return R.ok("更改成功");
    }
    @ApiOperation(value = "条件查询所有用户")
    @GetMapping("")
    public List<User> getUsers(User user){
        List<User> userList = userService.list(user);
        return userList;
    }
    @ApiOperation(value = "根据模板导入用户")
    @PutMapping("/import")
    public R importUser(MultipartFile file){
        userService.saveBath(file);
        return R.ok("批量导入成功");
    }
}
