package com.core.stxt.sys.controller;


import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.Member;
import com.core.stxt.sys.service.IMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

/**
 * <p>
 * 社团成员表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Api(tags = "社团成员管理")
@RestController
@RequestMapping("/sys/member")
public class MemberController {
    @Autowired
    private IMemberService memberService;

    @ApiOperation(value = "添加社团成员")
    @PutMapping("")
    public R add(Member member){
        memberService.save(member);
        return R.ok("添加社团成员成功");
    }
    @ApiOperation(value = "删除社团成员")
    @DeleteMapping("/{id}")
    public R delete(@PathVariable("id")  Integer id){
        memberService.removeById(id);
        return R.ok("删除社团成员成功");
    }
    @ApiOperation(value = "批量删除社团成员")
    @DeleteMapping("")
    public R delete(String ids){
        memberService.deleteIds(Arrays.asList(ids.split(",")));
        return R.ok("批量删除成功");
    }



}
