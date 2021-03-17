package com.core.stxt.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.common.utils.FileHandlerUtils;
import com.core.stxt.sys.entity.po.Association;
import com.core.stxt.sys.entity.po.Member;
import com.core.stxt.sys.entity.vo.MemberInfo;
import com.core.stxt.sys.entity.vo.UserInAssociation;
import com.core.stxt.sys.mapper.AssociationMapper;
import com.core.stxt.sys.service.IAssociationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.core.stxt.sys.service.IMemberService;
import com.core.stxt.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.logging.FileHandler;

/**
 * <p>
 * 社团表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Service
public class AssociationServiceImpl extends ServiceImpl<AssociationMapper,Association> implements IAssociationService{
    @Autowired
    private AssociationMapper associationMapper;
    @Autowired
    private IMemberService memberService;
    @Override
    @Transactional
    public boolean saveAssociation(Association association, MultipartFile file) {
        try {
            //1：上传封面图片文件，拿到图片路径
            String imgUrl = FileHandlerUtils.upload(file);
            //2：将社团信息添加进社团表中
            association.setImgUrl(imgUrl);
            associationMapper.insert(association);
            //3：将该成员信息录入
            Member member = new Member().setUserId(association.getStudentId())
                    .setAssociationId(association.getId())
                    .setStatus(0)
                    .setRank("社长");
            memberService.save(member);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }


    @Override
    public boolean updateAssociationInfo(Association association, MultipartFile file) {
        //1:如果文件不为空，则上传文件，并获取路径设置进去，同时删除原来的文件
        if(file!=null&&!StringUtils.isEmpty(file.getOriginalFilename())){
            //1.1:上传文件
            String imgUrl = FileHandlerUtils.upload(file);
            //1.2:删除原来的文件
            System.out.println("img:"+association.getImgUrl());
            FileHandlerUtils.deleteFile(association.getImgUrl());
            //1.3：设置文件名
            association.setImgUrl(imgUrl);
        }
        //2:执行更新操作
        associationMapper.updateById(association);
        return true;
    }

    @Override
    public boolean deleteIds(List<String> ids) {
        //循环id进行删除
        for(String id : ids){
            this.deleteById(Integer.valueOf(id));
        }
        return true;
    }

    @Override
    public boolean deleteById(Integer id) {
        //删除社团信息，即状态更改为2,已注销状态
        associationMapper.updateById( new Association().setId(id).setStatus(2));
        return true;
    }

    @Override
    public List<Association> list(Association association) {
        //定义查询器
        QueryWrapper<Association> wrapper = new QueryWrapper<Association>();
        //设置查询条件
        wrapper.eq(association.getStatus()!=null,"status",association.getStatus())
                .eq(association.getTypeId()!=null,"type_id",association.getTypeId())
                .like(association.getName()!=null,"name",association.getName());
        //进行查询
        List<Association> associationList = associationMapper.selectList(wrapper);
        //返回查询到的列表
        return associationList;
    }

    @Override
    public List<MemberInfo> getMemberByAssociationId(Integer associationId) {
        List<MemberInfo> memberInfoList = associationMapper.selectMemberListById(associationId);
        return memberInfoList;
    }

    @Override
    public List<MemberInfo> getCheckMemberByAssociationId(Integer associationId) {
        List<MemberInfo> memberInfoList = associationMapper.selectCheckMemberListById(associationId);
        return memberInfoList;
    }

    @Override
    public List<UserInAssociation> getCreateByUser(Integer id) {
       return  associationMapper.selectCreateByUser(id);
    }

    @Override
    public List<UserInAssociation> getJoinByUser(Integer id) {
        return  associationMapper.selectJoinByUser(id);
    }

    @Override
    public UserInAssociation getAssociationInfoById(Integer id) {
        return  associationMapper.selectAssociationById(id);
    }
}
