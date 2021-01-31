package com.core.stxt.sys.controller;


import com.core.stxt.common.model.R;
import com.core.stxt.sys.service.IAssociationService;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 社团表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-30
 */
@Api(tags = "社团管理")
@RestController
@RequestMapping("/sys/association")
public class AssociationController {

    @Autowired
    private IAssociationService associationService;

    /**
     * 查询id为{#id}的社团的全部成员的姓名
     */
    @GetMapping("/getNamesByAss")
    public R getNamesByAss(Integer id){
        //有了id
        //调用service中的方法查询（id为{#id}的社团的全部成员的姓名）
        List<String> names = associationService.selectNamesByAssId(id);
        //返回结果
        return R.ok("查询成功",names);
    }

}
