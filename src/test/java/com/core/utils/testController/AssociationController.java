package com.core.utils.testController;


import com.core.stxt.common.model.R;
import com.core.stxt.common.utils.FileHandlerUtils;
import com.core.stxt.sys.entity.po.Association;
import com.core.stxt.sys.service.IAssociationService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.Arrays;
import java.util.List;

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
    @PutMapping("")
    public R addAssociation(Association association) throws IOException {
        associationService.save(association);
        return R.ok("添加成功");
    }
    @ApiOperation(value = "删除社团")
    @DeleteMapping("{id}")
    public R delete(@PathVariable("id") Integer id){
        associationService.removeById(id);
        return R.ok("删除成功");
    }
    @ApiOperation(value = "批量删除社团")
    @DeleteMapping("")
    public R delete(String ids){
        associationService.removeByIds(Arrays.asList(ids.split(",")));
        return R.ok("批量删除成功");
    }
    @ApiOperation(value = "更改社团信息")
    @PostMapping("")
    public R update(Association association){
        associationService.updateById(association);
        return R.ok("更改成功");
    }
    @ApiOperation(value = "查询所有社团")
    @GetMapping("")
    public List<Association> getAssociationList(){
        List<Association> associationList = associationService.list();
        return associationList;
    }

    @PostMapping("/upload")
    public R upload(MultipartFile file){
        String upload = FileHandlerUtils.upload(file);
        return R.ok(upload);
    }


}
