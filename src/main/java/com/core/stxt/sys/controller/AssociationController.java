package com.core.stxt.sys.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.Association;
import com.core.stxt.sys.entity.vo.MemberInfo;
import com.core.stxt.sys.entity.vo.UserInAssociation;
import com.core.stxt.sys.service.IAssociationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 社团表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Api(tags = "社团管理")
@RestController
@RequestMapping("/sys/association")
public class AssociationController {
    @Autowired
    private IAssociationService associationService;
    @ApiOperation(value = "添加社团")
    @PutMapping("")
    public R addAssociation(Association association, MultipartFile file){
        //添加社团信息
        try {
            associationService.saveAssociation(association,file);
            return R.ok("添加成功");
        } catch (Exception e) {
            e.printStackTrace();
            return R.error("添加失败");
        }
    }

    @ApiOperation(value = "删除社团")
    @DeleteMapping("{id}")
    public R delete(@PathVariable("id") Integer id){
        //更改社团状态为删除
        associationService.deleteById(id);
        return R.ok("删除成功");
    }

    @ApiOperation(value = "批量删除社团")
    @DeleteMapping("")
    public R delete(String ids){
        associationService.deleteIds(Arrays.asList(ids.split(",")));
        return R.ok("批量删除成功");
    }
    @ApiOperation(value = "更改社团信息")
    @PostMapping("")
    public R updateAssociation(Association association,MultipartFile file){
        associationService.updateAssociationInfo(association,file);
        return R.ok("修改成功");
    }
    @ApiOperation(value = "条件查询所有社团")
    @GetMapping("")
    public List<Association> getAssociationList(Association association){
        List<Association> associationList = associationService.list(association);
        return associationList;
    }
    @ApiOperation(value = "根据社团id获取社团信息")
    @GetMapping("/getAss/{id}")
    public Association getAssociationById(@PathVariable("id") Integer id){
        Association associationList = associationService.getById(id);
        return associationList;
    }

    @ApiOperation(value = "查看某社团中的成员")
    @GetMapping("/{associationId}")
    public List<MemberInfo> getMember(@PathVariable("associationId") Integer associationId){
        List<MemberInfo> memberList = associationService.getMemberByAssociationId(associationId);
        return memberList;
    }
    @ApiOperation(value = "查看某社团中的待审核成员")
    @GetMapping("/check/{associationId}")
    public List<MemberInfo> getCheckMember(@PathVariable("associationId") Integer associationId){
        List<MemberInfo> memberList = associationService.getCheckMemberByAssociationId(associationId);
        return memberList;
    }

    @ApiOperation(value = "社团审核")
    @PostMapping("/audit")
    public R auditAssociation(Association association){
        associationService.updateById(association);
        return R.ok("审核成功");
    }
    @ApiOperation(value = "获取用户创建社团信息")
    @GetMapping("/createByUser/{id}")
    public R createByUser(@PathVariable("id") Integer id){
        List<UserInAssociation> createByUser = associationService.getCreateByUser(id);
        return R.ok("成功",createByUser);
    }




}
