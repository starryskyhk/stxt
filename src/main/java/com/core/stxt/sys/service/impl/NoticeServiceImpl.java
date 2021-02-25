package com.core.stxt.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.sys.entity.po.Notice;
import com.core.stxt.sys.mapper.NoticeMapper;
import com.core.stxt.sys.service.INoticeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 公告表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Service
public class NoticeServiceImpl extends ServiceImpl<NoticeMapper, Notice> implements INoticeService {

    @Override
    public List<Notice> list(Notice notice) {
        QueryWrapper<Notice> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(notice.getAssociationId()!=null,"association_id",notice.getAssociationId());
        List<Notice> noticeList = this.list(queryWrapper);
        return noticeList;
    }
}
