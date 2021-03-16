package com.core.stxt.sys.controller;

import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.User;
import com.core.stxt.sys.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @ClassName : CommonController
 * @Description :
 * @Author : Starry_sky
 * @Date: 2021-03-13 15:03  //时间
 */
@Api(tags = "公共操作")
@RestController
public class CommonController {
    @Autowired
    private IUserService userService;

    @ApiOperation(value = "登录")
    @PostMapping("/login")
    public R login(User user){
       R url = userService.login(user);
       return url;
    }
}
