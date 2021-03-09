package com.core.stxt.sys.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.sys.entity.po.ActivityMember;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 活动成员表 Mapper 接口
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-09
 */
public interface ActivityMemberMapper extends BaseMapper<ActivityMember> {
    /**
     * 查询活动成员信息
     * @param queryWrapper
     * @return
     */
    List<ActivityMember> getMemberByAssociation(@Param("ew") QueryWrapper<ActivityMember> queryWrapper);
}
