package com.core.stxt.sys.service;

import com.core.stxt.sys.entity.Association;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 社团表 服务类
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-30
 */
public interface IAssociationService extends IService<Association> {
    /**
     * 查询id为{#id}的社团的全部成员的姓名
     * @param id 社团id
     * @return
     */
    List<String> selectNamesByAssId(Integer id);
}
