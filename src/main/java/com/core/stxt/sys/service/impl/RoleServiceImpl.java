package com.core.stxt.sys.service.impl;

import com.core.stxt.sys.entity.po.Role;
import com.core.stxt.sys.mapper.RoleMapper;
import com.core.stxt.sys.service.IRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

}
