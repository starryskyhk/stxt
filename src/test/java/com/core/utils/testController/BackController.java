package com.core.utils.testController;

import com.core.stxt.sys.entity.po.Association;
import com.core.stxt.sys.service.IAssociationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
    @GetMapping("/index")
    public String index(){
        return "index";
    }

    @GetMapping("/list")
    public String list(){
        return "test/list";
    }
    @GetMapping("/add")
    public String add(){
        return "test/add";
    }
    //跳转到修改社团信息的页面，并回带数据
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model){
        Association association = associationService.getById(id);
        model.addAttribute("association",association);

        List<Association> associationList = associationService.list();
        model.addAttribute("associations",associationList);
        return "test/edit";
    }

}
