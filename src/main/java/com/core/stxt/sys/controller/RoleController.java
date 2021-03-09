package com.core.stxt.sys.controller;


import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.Role;
import com.core.stxt.sys.service.IRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Api(tags = "角色管理")
@RestController
@RequestMapping("/sys/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;
    @ApiOperation(value = "获取所有角色")
    @GetMapping("")
    public List<Role> getRoles(){
        List<Role> roleList = roleService.list();
        return roleList;
    }

    @ApiOperation(value = "根据id获取角色名称")
    @GetMapping("/{id}")
    public R getRoleById(@PathVariable("id") Integer id){
        Role role = roleService.getById(id);
        return R.ok("查询成功").put("roleName",role.getName());
    }
}
