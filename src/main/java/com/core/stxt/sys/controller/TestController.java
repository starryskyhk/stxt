package com.core.stxt.sys.controller;

import com.core.stxt.sys.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @ClassName : TestController
 * @Description :
 * @Author : Starry_sky
 * @Date: 2021-01-30 22:17  //时间
 */

@Controller
public class TestController {
    //访问路径
    //访问方式:get/post/delete/put
    //get：访问，获取数据
    //post：更改数据
    //delete：删除数据
    //put：增加数据
    //request:任意访问方式
    @GetMapping("/index")
    //@RequestMapping("/index")//任何访问方式都可以
    public User index(){
        return new User().setId("171340139").setName("韩坤");
    }
    @PostMapping("/user")
    public String updateUser(){
        return "post";
    }

    @GetMapping("/user")
    public String getUser(){
       System.out.println("sdfsfsdfsdf");
        return "get";
    }




}
