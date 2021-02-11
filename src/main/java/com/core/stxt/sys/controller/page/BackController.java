package com.core.stxt.sys.controller.page;

import com.core.stxt.common.utils.FileHandlerUtils;
import com.core.stxt.sys.entity.po.Association;
import com.core.stxt.sys.service.IAssociationService;
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



    //TODO:需更改访问路径
    //跳转到修改社团信息的页面，并回带数据
    @GetMapping("/editAssociation/{id}")
    public String edit(@PathVariable("id") Integer id, Model model){
        //通过id获取到社团对象
        Association association = associationService.getById(id);
        //将社团对象信息添加到model中
        model.addAttribute("association",association);
        return "test/edit";
    }

}