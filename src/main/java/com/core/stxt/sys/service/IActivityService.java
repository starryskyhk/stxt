package com.core.stxt.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.core.stxt.sys.entity.po.Activity;

import java.util.List;

/**
 * <p>
 * 活动表 服务类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
public interface IActivityService extends IService<Activity> {
    /**
     * 根据条件获取待审核活动情况
     * @param activity
     * @return
     */
    List<Activity> list(Activity activity);

    /**
     * 根据活动id删除活动相关内容
     * @param id
     * @return
     */
    boolean removeAllById(Integer id);
}
