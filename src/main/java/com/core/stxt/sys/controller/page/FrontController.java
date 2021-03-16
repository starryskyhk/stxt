package com.core.stxt.sys.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName : FrontController
 * @Description : 前台页面跳转
 * @Author : Starry_sky
 * @Date: 2021-01-30 18:52  //时间
 */
@Controller
@RequestMapping(value = "/front")
public class FrontController {
    //新闻动态
    @GetMapping("xwdt")
    public String xwdt(){
        return "student/xwdt";
    }
    //新闻详情
    @GetMapping("xwad")
    public String xwad(){
        return "student/xw_ade";
    }
    //社团详情
    @GetMapping("stad")
    public String stad(){
        return "student/st_ade";
    }
    //社团
    @GetMapping("st")
    public String st(){
        return "student/st";
    }
    //通知公告
    @GetMapping("notice")
    public String notice(){
        return "student/notice";
    }
    //基本资料
    @GetMapping("myinfo")
    public String myinfo(){
        return "student/myinfo";
    }
    //个人社团
    @GetMapping("mycom")
    public String mycom(){
        return "student/mycom";
    }
    //个人活动
    @GetMapping("myact")
    public String myact(){
        return "student/myact";
    }
    //登录
    @GetMapping("login")
    public String login(){
        return "student/login";
    }
    //首页
    @GetMapping("index")
    public String index(){
        return "student/index";
    }
    //活动详情
    @GetMapping("hdad")
    public String hdad(){
        return "student/hdad";
    }
    //活动
    @GetMapping("hd")
    public String hd(){
        return "student/hd";
    }
    //创建社团
    @GetMapping("createst")
    public String createst(){
        return "student/createst";
    }
}
