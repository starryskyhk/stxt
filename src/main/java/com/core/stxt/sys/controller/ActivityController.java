package com.core.stxt.sys.controller;


import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.Activity;
import com.core.stxt.sys.service.IActivityService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 活动表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Api(tags = "活动管理")
@RestController
@RequestMapping("/sys/activity")
public class ActivityController {
    @Autowired
    private IActivityService activityService;

    @ApiOperation(value = "根据条件获取活动列表")
    @GetMapping("")
    public List<Activity> getActivityList(Activity activity){
        List<Activity> activityList = activityService.list(activity);
        return activityList;
    }
    @ApiOperation(value = "修改活动")
    @PostMapping("")
    public R updateActivity(Activity activity){
        activityService.updateById(activity);
        return R.ok("修改成功");
    }
    @ApiOperation(value = "删除活动")
    @DeleteMapping("/{id}")
    public R deleteActivity(@PathVariable("id") Integer id){
        activityService.removeAllById(id);
        return R.ok("删除成功");
    }




}
