package com.core.stxt.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.core.stxt.common.utils.FileHandlerUtils;
import com.core.stxt.sys.entity.po.Activity;
import com.core.stxt.sys.entity.po.ActivityMember;
import com.core.stxt.sys.entity.po.ActivitySpace;
import com.core.stxt.sys.entity.po.Member;
import com.core.stxt.sys.mapper.ActivityMapper;
import com.core.stxt.sys.service.IActivityMemberService;
import com.core.stxt.sys.service.IActivityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.core.stxt.sys.service.IActivitySpaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

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
    @Autowired
    private ActivityMapper activityMapper;
    @Autowired
    private IActivityMemberService activityMemberService;
    @Autowired
    private IActivitySpaceService activitySpaceService;
    @Override
    public List<Activity> list(Activity activity) {
        QueryWrapper<Activity> wrapper = new QueryWrapper<Activity>();
        wrapper.eq(activity.getStatus()!=null,"status",activity.getStatus());
        List<Activity> activityList = this.list(wrapper);
        return activityList;
    }

    @Override
    @Transactional
    public boolean removeAllById(Integer id) {
        //先删除活动成员
        activityMemberService.remove(new UpdateWrapper<ActivityMember>().eq("activity_id",id));
        //再删除活动场地表
        activitySpaceService.remove(new UpdateWrapper<ActivitySpace>().eq("activity_id",id));
        //再删除活动表
        activityMapper.deleteById(id);

        return true;
    }

    @Override
    public boolean updateActivityInfo(Activity activity, MultipartFile file) {
        //1:如果文件不为空，则上传文件，并获取路径设置进去，同时删除原来的文件
        if(file!=null&&!StringUtils.isEmpty(file.getOriginalFilename())){
            //1.1:上传文件
            String imgUrl = FileHandlerUtils.upload(file);
            //1.2:删除原来的文件
            FileHandlerUtils.deleteFile(activity.getImgUrl());
            //1.3：设置文件名
            activity.setImgUrl(imgUrl);
        }
        //2:执行更新操作
        activityMapper.updateById(activity);
        return true;
    }

    @Override
    public boolean saveActivity(Activity activity, MultipartFile file) {
        try {
            //1：上传封面图片文件，拿到图片路径
            String imgUrl = FileHandlerUtils.upload(file);
            //2：将活动信息添加进活动表中
            activity.setImgUrl(imgUrl);
            this.save(activity);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean removeAllByIs(List<String> ids) {
        for(String id :ids){
            this.removeAllById(Integer.valueOf(id));
        }
        return true;
    }
}
