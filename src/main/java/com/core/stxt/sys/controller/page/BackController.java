package com.core.stxt.sys.controller.page;

import com.core.stxt.common.utils.FileHandlerUtils;
import com.core.stxt.sys.entity.po.Activity;
import com.core.stxt.sys.entity.po.Association;
import com.core.stxt.sys.entity.po.User;
import com.core.stxt.sys.service.IActivityService;
import com.core.stxt.sys.service.IAssociationService;
import com.core.stxt.sys.service.IUserService;
import net.bytebuddy.asm.Advice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @ClassName : BackController
 * @Description :  后台页面跳转
 * @Author : 孙和美
 * @Date: 2021-01-30 18:52  //时间
 */
@Controller
@RequestMapping(value = "/back")
public class BackController {
    @Autowired
    private IAssociationService  associationService;
    @Autowired
    private IActivityService activityService;
    @Autowired
    private IUserService userService;
    //--------系统管理员
    @GetMapping("index")
    public String index(){
        return "system/index";
    }
    @GetMapping("home")
    public String home(){
        return "system/home";
    }
    @GetMapping("addAss")
    public String addAss(){
        return "system/addAss";
    }
    @GetMapping("assList")
    public String assAss(){
        return "system/assList";
    }
    //跳转到修改社团信息的页面，并回带数据
    @GetMapping("/editAssociation/{id}")
    public String edit(@PathVariable("id") Integer id, Model model){
        //通过id获取到社团对象
        Association association = associationService.getById(id);
        //将社团对象信息添加到model中
        model.addAttribute("association",association);
        return "system/editAss";
    }
    //跳转到社团成员页面
    @GetMapping("/members/{id}")
    public String toMembers(@PathVariable("id") Integer id,Model model){
        Association association = associationService.getById(id);
        model.addAttribute("association",association);
        return "system/memberList";
    }
    @GetMapping("/addMember/{id}")
    public String addMember(@PathVariable("id") Integer id,Model model){
        model.addAttribute("id",id);
        return "system/addMember";
    }
    //-------------审核管理
    @GetMapping("assCheck")
    public String assCeck(){
        return "system/assCheckList";
    }

    @GetMapping("/checkAssInfo/{id}")
    public String checkAssInfo(@PathVariable("id") Integer id, Model model){
        //通过id获取到社团对象
        Association association = associationService.getById(id);
        //将社团对象信息添加到model中
        model.addAttribute("association",association);
        return "system/checkAssInfo";
    }
    @GetMapping("activityCheck")
    public String activityCheck(){
        return "system/activityCheck";
    }
    @GetMapping("/checkActivityInfo/{id}")
    public String checkActivityInfo(@PathVariable("id") Integer id, Model model){
        //通过id获取到社团对象
        Activity activity = activityService.getById(id);
        //将社团对象信息添加到model中
        model.addAttribute("activity",activity);
        return "system/checkActivityInfo";
    }

    //-------------用户管理
    @GetMapping("userList")
    public String userList(){
        return "system/userList";
    }

    //跳转到社团成员页面
    @GetMapping("/user/{id}")
    public String toUser(@PathVariable("id") Integer id,Model model){
        User user = userService.getById(id);
        model.addAttribute("user",user);
        return "system/editUser";
    }
    @GetMapping("addUser")
    public String addUser(){
        return "system/addUser";
    }
    @GetMapping("adminList")
    public String adminList(){
        return "system/adminList";
    }
    @GetMapping("addAdmin")
    public String addAdmin(){
        return "system/addAdmin";
    }
    //----------公告管理
    @GetMapping("noticeList")
    public String noticeList(){
        return "system/noticeList";
    }




}
