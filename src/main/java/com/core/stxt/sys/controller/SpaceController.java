package com.core.stxt.sys.controller;


import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.Space;
import com.core.stxt.sys.service.ISpaceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-09
 */
@Api(tags = "场地管理")
@RestController
@RequestMapping("/sys/space")
public class SpaceController {
    @Autowired
    private ISpaceService spaceService;

    @ApiOperation(value ="添加场地")
    @PutMapping("")
    public R addSpace(Space space){
        spaceService.save(space);
        return R.ok("添加成功");
    }
    @ApiOperation(value ="删除单个场地")
    @DeleteMapping("/{id}")
    public R deleteSpace(@PathVariable("id") Integer id){
        spaceService.removeById(id);
        return R.ok("删除成功");
    }
    @ApiOperation(value ="批量删除场地信息")
    @DeleteMapping("")
    public R deleteSpaces(String ids){
        spaceService.removeByIds(Arrays.asList(ids.split(",")));
        return R.ok("批量删除成功");
    }
    @ApiOperation(value = "更改场地信息")
    @PostMapping("")
    public R updateSpace(Space space){
        spaceService.updateById(space);
        return R.ok("更改成功");
    }
    @ApiOperation(value = "查询场地列表")
    @GetMapping("")
    public List<Space> getSpaceList(){
        List<Space> spaceList = spaceService.list();
        return spaceList;
    }
    @ApiOperation(value = "查询场地列表")
    @GetMapping("/getAddress/{id}")
    public Space getSpaceById(@PathVariable("id") Integer id){
        Space space = spaceService.getById(id);
        return space;
    }

}
