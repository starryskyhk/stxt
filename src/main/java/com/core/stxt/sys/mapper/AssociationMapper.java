package com.core.stxt.sys.mapper;

import com.core.stxt.sys.entity.Association;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * 社团表 Mapper 接口
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-30
 */
public interface AssociationMapper extends BaseMapper<Association> {
    /**
     * 查询id为{#id}的社团的全部成员的姓名
     * @param id
     * @return
     */
    List<String> selectNames(Integer id);
}
