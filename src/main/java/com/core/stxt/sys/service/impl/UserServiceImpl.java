package com.core.stxt.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.sys.entity.po.Member;
import com.core.stxt.sys.entity.po.User;
import com.core.stxt.sys.mapper.UserMapper;
import com.core.stxt.sys.service.IActivityMemberService;
import com.core.stxt.sys.service.IMemberService;
import com.core.stxt.sys.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Autowired
    private IMemberService memberService;
    @Override
    @Transactional
    public boolean deleteAllById(String id) {
        //删除用户表
        this.removeById(id);
        //删除社团成员表中信息
        memberService.remove(new QueryWrapper<Member>().eq("user_id",id));
        return true;
    }

    @Override
    public List<User> list(User user) {
        QueryWrapper<User> wrapper = new QueryWrapper<User>();
        wrapper.like(user.getName()!=null,"name",user.getName())
                .like(user.getId()!=null,"id",user.getId())
                .eq(user.getRoleId()!=null,"role_id",user.getRoleId());
        List<User> userList = this.list(wrapper);
        return userList;
    }

    @Override
    public boolean deleteAllByIds(List<String> ids) {
        for(String id:ids){
            this.deleteAllById(id);
        }
        return true;
    }
}
