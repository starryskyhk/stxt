package com.core.stxt.sys.service.impl;

import com.core.stxt.sys.entity.po.Activity;
import com.core.stxt.sys.mapper.ActivityMapper;
import com.core.stxt.sys.service.IActivityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 活动表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Service
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper, Activity> implements IActivityService {

}
