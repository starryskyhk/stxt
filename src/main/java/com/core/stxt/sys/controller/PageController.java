package com.core.stxt.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName : PageController
 * @Description :
 * @Author : Starry_sky
 * @Date: 2021-01-29 12:44  //时间
 */
@Controller
@RequestMapping("")
public class PageController {
    @GetMapping("index")
    public String toIndex(){
        return "index";
    }
}
