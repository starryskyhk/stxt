package com.core.stxt.sys.service.impl;

import com.core.stxt.sys.entity.Association;
import com.core.stxt.sys.entity.User;
import com.core.stxt.sys.mapper.AssociationMapper;
import com.core.stxt.sys.mapper.UserMapper;
import com.core.stxt.sys.service.IAssociationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.core.stxt.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 社团表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-30
 */
@Service
public class AssociationServiceImpl extends ServiceImpl<AssociationMapper, Association> implements IAssociationService {

    @Autowired
    private AssociationMapper associationMapper;

    @Override
    public List<String> selectNamesByAssId(Integer id) {
        List<String> names = associationMapper.selectNames(id);
        return names;
    }
}
