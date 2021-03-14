package com.core.stxt.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.core.stxt.sys.entity.po.Association;
import com.core.stxt.sys.entity.vo.MemberInfo;

import java.util.List;

/**
 * <p>
 * 社团表 Mapper 接口
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
public interface AssociationMapper extends BaseMapper<Association> {
    /**
     * 根据社团id查询社团成员信息
     * @param associationId
     * @return
     */
    List<MemberInfo> selectMemberListById(Integer associationId);

    List<MemberInfo> selectCheckMemberListById(Integer associationId);
}
