package com.core.stxt.sys.service.impl;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.common.utils.FileHandlerUtils;
import com.core.stxt.common.utils.TransferUtils;
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
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

    @Override
    public boolean saveBath(MultipartFile file) {
        try {
            //Hutools工具类获得excel内容
            List<List<Object>> excelReader = ExcelUtil.getReader(file.getInputStream()).read();
            //将列表转化为用户List
            List<User> userList = TransferUtils.toUserList(excelReader);
            //保存这些用户信息
            this.saveBatch(userList);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    @Override
    public boolean updateUser(User user, MultipartFile file) {
        //1:如果文件不为空，则上传文件，并获取路径设置进去，同时删除原来的文件
        if(file!=null&&!StringUtils.isEmpty(file.getOriginalFilename())){
            //1.1:上传文件
            String imgUrl = FileHandlerUtils.upload(file);
            //1.2:删除原来的文件;
            FileHandlerUtils.deleteFile(user.getImgUrl());
            //1.3：设置文件名
            user.setImgUrl(imgUrl);
        }
        //2:执行更新操作
        this.updateById(user);
        return true;
    }

    @Override
    public boolean saveUser(User user, MultipartFile file) {
        try {
            //1：上传封面图片文件，拿到图片路径
            String imgUrl = FileHandlerUtils.upload(file);
            //2：将用户信息添加进用户表中
            user.setImgUrl(imgUrl).setPassword(user.getPassword());
            this.save(user);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
