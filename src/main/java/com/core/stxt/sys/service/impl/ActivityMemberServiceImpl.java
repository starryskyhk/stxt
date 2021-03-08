package com.core.stxt.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.sys.entity.po.ActivityMember;
import com.core.stxt.sys.mapper.ActivityMemberMapper;
import com.core.stxt.sys.service.IActivityMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 活动成员表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-09
 */
@Service
public class ActivityMemberServiceImpl extends ServiceImpl<ActivityMemberMapper, ActivityMember> implements IActivityMemberService {
    @Autowired
    private ActivityMemberMapper activityMemberMapper;
    @Override
    public List<ActivityMember> list(ActivityMember activityMember) {
        //定义查询器，可根据状态，学生id查询
        QueryWrapper<ActivityMember> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(activityMember.getStatus()!=null,"status",activityMember.getStatus())
                .like(activityMember.getUserId()!=null,"user_id",activityMember.getUserId());
        List<ActivityMember> activityMemberList = activityMemberMapper.getMemberByAssociation(queryWrapper);
        return activityMemberList;
    }
}
