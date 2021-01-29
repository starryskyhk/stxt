package com.core.stxt.sys.service.impl;

import com.core.stxt.sys.entity.User;
import com.core.stxt.sys.mapper.UserMapper;
import com.core.stxt.sys.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-29
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

}
