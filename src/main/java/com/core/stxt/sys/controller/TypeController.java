package com.core.stxt.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.Type;
import com.core.stxt.sys.service.ITypeService;
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
 * 类型表，即社团或活动的类型 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Api(tags = "类型管理")
@RestController
@RequestMapping("/sys/type")
public class TypeController {
    @Autowired
    private ITypeService typeService;
    @ApiOperation(value = "根据module获取类型")
    @GetMapping("/{module}")
    public R getAllByType(@PathVariable("module") Integer module){
        QueryWrapper<Type> wrapper = new QueryWrapper<Type>().eq("module",module);
        List<Type> typeList = typeService.list(wrapper);
        return R.ok("查询成功").put("types",typeList);
    }
    @ApiOperation(value="根据类型id获取类型名称")
    @GetMapping("/getName/{id}")
    public R getTypeNameById(@PathVariable("id") Integer id){
        Type type = typeService.getById(id);
        return R.ok("查询成功").put("typeName",type.getName());
    }

}
