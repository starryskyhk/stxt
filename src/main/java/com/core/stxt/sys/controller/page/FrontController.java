package com.core.stxt.sys.controller.page;

import com.core.stxt.sys.entity.po.Notice;
import com.core.stxt.sys.entity.po.User;
import com.core.stxt.sys.entity.vo.UserInAssociation;
import com.core.stxt.sys.service.IAssociationService;
import com.core.stxt.sys.service.IMemberService;
import com.core.stxt.sys.service.INoticeService;
import com.core.stxt.sys.service.IUserService;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @ClassName : FrontController
 * @Description : 前台页面跳转
 * @Author : Starry_sky
 * @Date: 2021-01-30 18:52  //时间
 */
@Controller
@RequestMapping(value = "/front")
public class FrontController {
    @Autowired
    private INoticeService noticeService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IAssociationService associationService;
    @Autowired
    private IMemberService memberService;
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
    @GetMapping("stad/{id}/{userId}")
    public String stad(@PathVariable("id") Integer id,@PathVariable("userId") Integer userId,Model model){
        UserInAssociation association =  associationService.getAssociationInfoById(id);
        Integer status = memberService.getStatusByIdAndAssId(id,userId);
        model.addAttribute("assInfo",association);
        model.addAttribute("status",status);
        return "student/st_ade";
    }
    //社团
    @GetMapping("st")
    public String st(){
        return "student/st";
    }
    //通知公告
    @GetMapping("notice")
    public String notice(Model model){
        List<Notice> notices = noticeService.list();
        String[] ass = {"123","233"};
        model.addAttribute("notices",notices);
        model.addAttribute("ass",ass);
        return "student/notice";
    }
    //基本资料
    @GetMapping("myinfo/{id}")
    public String myinfo(@PathVariable("id") Integer id,Model model){
        User user = userService.getById(id);
        model.addAttribute("user",user);
        return "student/myinfo";
    }
    //个人社团
    @GetMapping("mycom/{id}")
    public String mycom(@PathVariable("id") Integer id,Model model){
        //查询被该用户创建的社团
        List<UserInAssociation> userCreate=associationService.getCreateByUser(id);
        //查询该用户参加的社团
        List<UserInAssociation> userJoin = associationService.getJoinByUser(id);
        model.addAttribute("userCreate",userCreate);
        model.addAttribute("userJoin",userJoin);
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
        return "student/hd_ade";
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
