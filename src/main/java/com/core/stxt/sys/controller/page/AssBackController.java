package com.core.stxt.sys.controller.page;

import com.core.stxt.sys.entity.po.*;
import com.core.stxt.sys.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName : BackController
 * @Description :  后台页面跳转
 * @Author : 孙和美
 * @Date: 2021-01-30 18:52  //时间
 */
@Controller
@RequestMapping(value = "/assBack")
public class AssBackController {
    @Autowired
    private IAssociationService  associationService;
    @Autowired
    private IActivityService activityService;
    @Autowired
    private IUserService userService;
    @Autowired
    private INoticeService noticeService;
    @Autowired
    private IMemberService memberService;
    //--------系统管理员
    @GetMapping("index")
    public String index(){
        return "assSystem/index";
    }
    @GetMapping("home")
    public String home(){
        return "assSystem/home";
    }
    @GetMapping("addAss")
    public String addAss(){
        return "assSystem/addAss";
    }
    @GetMapping("assList")
    public String assAss(){
        return "assSystem/assList";
    }
    //跳转到修改社团信息的页面，并回带数据
    @GetMapping("/editAssociation/{id}")
    public String edit(@PathVariable("id") Integer id, Model model){
        //通过id获取到社团对象
        Association association = associationService.getById(id);
        //将社团对象信息添加到model中
        model.addAttribute("association",association);
        return "assSystem/editAss";
    }
    //跳转到社团成员页面
    @GetMapping("/members/{id}")
    public String toMembers(@PathVariable("id") Integer id,Model model){
        Association association = associationService.getById(id);
        model.addAttribute("association",association);
        return "assSystem/memberList";
    }
    @GetMapping("/addMember/{id}")
    public String addMember(@PathVariable("id") Integer id,Model model){
        model.addAttribute("id",id);
        return "assSystem/addMember";
    }
    @GetMapping("/checkMemberList")
    public String checkMemberList(){
        return "assSystem/checkMemberList";
    }
    @GetMapping("/editMember/{id}")
    public String editMember(@PathVariable("id") Integer id,Model model){
        Member member = memberService.getById(id);
        model.addAttribute("member",member);
        return "assSystem/editMember";
    }
    //-------------审核管理
    @GetMapping("assCheck")
    public String assCeck(){
        return "assSystem/assCheckList";
    }

    @GetMapping("/checkAssInfo/{id}")
    public String checkAssInfo(@PathVariable("id") Integer id, Model model){
        //通过id获取到社团对象
        Association association = associationService.getById(id);
        //将社团对象信息添加到model中
        model.addAttribute("association",association);
        return "assSystem/checkAssInfo";
    }

    @GetMapping("activityList")
    public String activityCheck(){
        return "assSystem/activityList";
    }

    @GetMapping("addActivity")
    public String addActivity(){
        return "assSystem/addActivity";
    }

    @GetMapping("/activityInfo/{id}")
    public String activityInfo(@PathVariable("id") Integer id, Model model){
        //通过id获取到活动对象
        Activity activity = activityService.getById(id);
        //将社团对象信息添加到model中
        model.addAttribute("activity",activity);
        return "assSystem/activityInfo";
    }

    //-------------用户管理
    @GetMapping("userList")
    public String userList(){
        return "assSystem/userList";
    }

    //跳转到社团成员页面
    @GetMapping("/user/{id}")
    public String toUser(@PathVariable("id") Integer id,Model model){
        User user = userService.getById(id);
        model.addAttribute("user",user);
        return "assSystem/editUser";
    }
    @GetMapping("addUser")
    public String addUser(){
        return "assSystem/addUser";
    }
    @GetMapping("adminList")
    public String adminList(){
        return "assSystem/adminList";
    }
    @GetMapping("addAdmin")
    public String addAdmin(){
        return "assSystem/addAdmin";
    }
    //----------公告管理
    @GetMapping("noticeList")
    public String noticeList(){
        return "assSystem/noticeList";
    }
    @GetMapping("addNotice")
    public String addNotice(){
        return "assSystem/addNotice";
    }
    @GetMapping("editNotice/{id}")
    public String editNotice(@PathVariable("id")Integer id,Model model){
        Notice notice = noticeService.getById(id);
        model.addAttribute("notice",notice);
        return "assSystem/editNotice";
    }
    @GetMapping("login")
    public String login(){
        return "login";
    }
    @GetMapping("editInfo")
    public String editInfo(){
        return "assSystem/editInfo";
    }






}
