package com.core.stxt.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.core.stxt.sys.entity.po.Notice;

import java.util.List;

/**
 * <p>
 * 公告表 服务类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
public interface INoticeService extends IService<Notice> {
    /**
     * 条件查询公告
     * @param notice
     * @return
     */
    List<Notice> list(Notice notice);
}
