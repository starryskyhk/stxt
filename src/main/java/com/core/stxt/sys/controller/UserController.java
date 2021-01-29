package com.core.stxt.sys.controller;


import com.core.stxt.common.model.Result;
import com.core.stxt.sys.entity.User;
import com.core.stxt.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-29
 */
@RestController
@RequestMapping("/sys/user")
public class UserController {
    @Autowired
    private IUserService userService;

    @GetMapping("/getAllUser")
    public Result getAllUser(){
        List<User> list = userService.list();
        return Result.ok("查询成功",list);
    }
//    @PostMapping("/upload")
//    public Result upload(@RequestParam("file") MultipartFile file) throws IOException {
//        File file1 = new File("src\\main\\webapp\\WEB-INF\\file\\ddd.docx");
//        System.out.println(file1.getAbsolutePath());
//        FileOutputStream fos = new FileOutputStream(file1);
//
//        FileInputStream fis = (FileInputStream) file.getInputStream();
//        byte[] buf = new byte[10];
//        int len;
//        while((len = fis.read(buf))!=-1){
//            fos.write(buf,0,len);
//        }
//        fos.close();
//        fis.close();
//       return Result.ok();
//    }
    @PostMapping("/upload")
    public Result upload(@RequestParam("file") MultipartFile file) throws IOException {
        File file1 = new File("src\\main\\webapp\\WEB-INF\\file\\ddd.docx");
        FileOutputStream fos = new FileOutputStream(file1);
        FileInputStream fis = (FileInputStream) file.getInputStream();
        return Result.ok();
    }


}
