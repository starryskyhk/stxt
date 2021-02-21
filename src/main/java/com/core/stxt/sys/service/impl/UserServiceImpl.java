package com.core.stxt.sys.service.impl;

import com.core.stxt.sys.entity.po.User;
import com.core.stxt.sys.mapper.UserMapper;
import com.core.stxt.sys.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Override
    public boolean deleteAllById(String id) {
        //TODO:删除用户逻辑待完成
        return false;
    }

    @Override
    public List<User> list(User user) {
        //TODO:条件查询用户逻辑待完成
        return null;
    }
}
