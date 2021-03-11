package com.core.stxt.sys.controller;


import com.core.stxt.sys.entity.po.ActivitySpace;
import com.core.stxt.sys.service.IActivitySpaceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 活动场地表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Api(tags = "活动场地管理")
@RestController
@RequestMapping("/sys/activitSpace")
public class ActivitySpaceController {
    @Autowired
    private IActivitySpaceService activitySpaceService;

    @ApiOperation(value = "通过活动id获取活动场地信息")
    @GetMapping("/getByActivityId/{id}")
    public ActivitySpace getByActivityId(@PathVariable Integer id){
        return activitySpaceService.getById(id);
    }
    
}
