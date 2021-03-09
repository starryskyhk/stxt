package com.core.stxt.sys.controller.page;

import com.core.stxt.common.utils.FileHandlerUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

/**
 * @ClassName : TestController
 * @Description :
 * @Author : Starry_sky
 * @Date: 2021-02-09 21:26  //时间
 */
@Controller
@RequestMapping("/test")
//访问路径
//访问方式:get/post/delete/put
//get：访问，获取数据
//post：更改数据
//delete：删除数据
//put：增加数据
//request:任意访问方式
public class TestController {
    //访问到测试首页
    @GetMapping("/index")
    public String index(){
        return "test/index";
    }
    //访问到测试页
    @GetMapping("/ceshi")
    public String test(){
        return "test/ceshi";
    }
    //访问到测试上传页
    @PostMapping("/upload")
    public String upload(MultipartFile file, Model model){
        String imgUrl = FileHandlerUtils.upload(file);
        model.addAttribute("imgUrl",imgUrl);
        return "test/ceshi";
    }
    //访问到测试添加页
    @GetMapping("/add")
    public String add(){
        return "test/add";
    }
    //访问到测试列表页
    @GetMapping("list")
    public String list(){
        return "test/list";
    }
    //访问到测试修改页
    @GetMapping("edit")
    public String edit(){
        return "test/edit";
    }
}
