package com.core.stxt.sys.controller;


import com.core.stxt.sys.service.IActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 活动表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@RestController
@RequestMapping("/sys/activity")
public class ActivityController {
    @Autowired
    private IActivityService activityService;



}
