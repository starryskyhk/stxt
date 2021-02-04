package com.core.stxt.sys.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName : BackController
 * @Description :  后台页面跳转
 * @Author : 孙和美
 * @Date: 2021-01-30 18:52  //时间
 */
@Controller
@RequestMapping(value = "/back")
public class BackController {
    @GetMapping("/index")
    public String index(){
        return "index";
    }
}
