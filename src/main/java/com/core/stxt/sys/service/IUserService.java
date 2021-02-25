package com.core.stxt.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.core.stxt.sys.entity.po.User;

import java.util.List;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
public interface IUserService extends IService<User> {
    /**
     * 根据用户id删除用户相关信息
     * @param id
     * @return
     */
    boolean deleteAllById(String id);

    /**
     * 条件查询用户信息
     * @param user
     * @return
     */
    List<User> list(User user);

    /**
     * 批量删除用户
     * @param ids
     * @return
     */
    boolean deleteAllByIds(List<String> ids);
}
