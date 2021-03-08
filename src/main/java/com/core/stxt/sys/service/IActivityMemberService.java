package com.core.stxt.sys.service;

import com.core.stxt.sys.entity.po.ActivityMember;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 活动成员表 服务类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-09
 */
public interface IActivityMemberService extends IService<ActivityMember> {
    /**
     * 根据条件查询活动成员列表
     * @param activityMember
     * @return
     */
    List<ActivityMember> list(ActivityMember activityMember);
}
