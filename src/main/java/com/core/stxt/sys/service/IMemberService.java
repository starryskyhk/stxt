package com.core.stxt.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.core.stxt.sys.entity.po.Member;

import java.util.List;

/**
 * <p>
 * 社团成员表 服务类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
public interface IMemberService extends IService<Member> {
    /**
     * 批量删除社团成员
     * @param ids 社团成员编号
     * @return
     */
    boolean deleteIds(List<String> ids);

    /**
     * 获取学生在该社团的状态
     * @param id
     * @param userId
     * @return
     */
    Integer getStatusByIdAndAssId(Integer id, Integer userId);
}
