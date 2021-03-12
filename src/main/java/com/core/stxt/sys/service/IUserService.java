package com.core.stxt.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.core.stxt.sys.entity.po.User;
import org.springframework.web.multipart.MultipartFile;

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

    /**
     * 批量导入用户
     * @param file
     * @return
     */
    boolean saveBath(MultipartFile file);

    /**
     * 更改用户信息
     * @param user
     * @param file
     * @return
     */
    boolean updateUser(User user, MultipartFile file);

    /**
     * 添加用户
     * @param user 用户信息
     * @param file 用户头像
     * @return
     */
    boolean saveUser(User user, MultipartFile file);

    /**
     * 条件查询所有的管理员
     * @param user
     * @return
     */
    List<User> adminlist(User user);
}
