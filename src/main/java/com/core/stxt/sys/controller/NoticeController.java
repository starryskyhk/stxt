package com.core.stxt.sys.controller;


import com.core.stxt.common.model.R;
import com.core.stxt.sys.entity.po.Notice;
import com.core.stxt.sys.service.INoticeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * <p>
 * 公告表 前端控制器
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Api(tags = "公告管理")
@RestController
@RequestMapping("/sys/notice")
public class NoticeController {
    @Autowired
    private INoticeService noticeService;

    @ApiOperation(value = "添加公告")
    @PutMapping("")
    public R addNotice(Notice notice){
        noticeService.save(notice);
        return R.ok("添加成功");
    }
    @ApiOperation(value = "删除公告")
    @DeleteMapping("/{id}")
    public R deleteNotice(@PathVariable("id") Integer id){
        noticeService.removeById(id);
        return R.ok("删除成功");
    }
    @ApiOperation(value = "批量删除公告")
    @DeleteMapping("")
    public R deleteNotices(String ids){
        noticeService.removeByIds(Arrays.asList(ids.split(",")));
        return R.ok("批量删除成功");
    }
    @ApiOperation(value="更改公告")
    @PostMapping("")
    public R updateNotice(Notice notice){
        noticeService.updateById(notice);
        return R.ok("更改成功");
    }
    @ApiOperation(value = "条件查询公告")
    @GetMapping("")
    public List<Notice> getNoticeList(Notice notice){
        List<Notice> noticeList = noticeService.list(notice);
        return noticeList;
    }
}
