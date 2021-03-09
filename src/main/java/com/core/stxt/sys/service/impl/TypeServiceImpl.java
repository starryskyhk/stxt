package com.core.stxt.sys.service.impl;

import com.core.stxt.sys.entity.po.Type;
import com.core.stxt.sys.mapper.TypeMapper;
import com.core.stxt.sys.service.ITypeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 类型表，即社团或活动的类型 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Service
public class TypeServiceImpl extends ServiceImpl<TypeMapper, Type> implements ITypeService {

}
