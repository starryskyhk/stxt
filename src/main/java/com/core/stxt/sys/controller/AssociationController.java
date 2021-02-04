package com.core.stxt.sys.controller;


import cn.hutool.core.io.FileUtil;
import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.Association;
import com.core.stxt.sys.service.IAssociationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.io.*;

/**
 * <p>
 * 社团表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Api(tags = "社团管理")
@RestController
@RequestMapping("/sys/association")
public class AssociationController {
    @Autowired
    private IAssociationService associationService;

    /**
     * 添加社团
     * @param association 社团实体字段
     * @return
     */
    @ApiOperation(value = "添加社团")
    @PutMapping("/addAssociation")
    public R addAssociation(Association association, MultipartFile imgFile) throws IOException {
        System.out.println(association);
        System.out.println(new File(imgFile.getOriginalFilename()).getAbsolutePath());
        return R.ok("创建成功");
    }

    //上传文件
    @PostMapping("/upload")
    public R upload(@RequestParam("file") MultipartFile file) throws IOException {
        File file1 = new File(ResourceUtils.getURL("classpath:").getPath()+"static/"+"5.jpg");
        System.out.println(file1.getAbsolutePath());
        FileOutputStream fos = new FileOutputStream(file1);
        FileInputStream fis = (FileInputStream) file.getInputStream();
        byte[] buf = new byte[10];
        int len;
        while((len = fis.read(buf))!=-1){
            fos.write(buf,0,len);
        }
        fos.close();
        fis.close();
        return R.ok();
    }


}
