package com.core.stxt.sys.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.ActivityMember;
import com.core.stxt.sys.service.IActivityMemberService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.poi.ss.formula.functions.T;
import org.apache.xmlbeans.impl.common.ValidatorListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 活动成员表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-09
 */
@Api(tags = "活动成员管理")
@RestController
@RequestMapping("/sys/activity-member")
public class ActivityMemberController {
    @Autowired
    private IActivityMemberService activityMemberService;

    @ApiOperation(value = "添加活动成员(即申请)")
    @PutMapping("")
    public R addActivityMember(ActivityMember activityMember){
        activityMemberService.save(activityMember);
        return R.ok("申请成功");
    }
    @ApiOperation(value = "删除活动成员(即取消报名)")
    @DeleteMapping("/{id}")
    public R deleteActivityMember(@PathVariable("id") Integer id){
        activityMemberService.removeById(id);
        return R.ok("取消报名成功");
    }
    @ApiOperation(value = "更改活动成员信息(即审核)")
    @PostMapping("")
    public R updateActivityMember(ActivityMember activityMember){
        //包括通过、拒绝、成员退出
        activityMemberService.updateById(activityMember);
        return R.ok("审核完成");
    }
    @ApiOperation(value = "条件查询活动成员")
    @GetMapping("")
    public List<ActivityMember> getActivityMembers(ActivityMember activityMember){
        List<ActivityMember> activityMemberList = activityMemberService.list(activityMember);
        return activityMemberList;
    }
}
