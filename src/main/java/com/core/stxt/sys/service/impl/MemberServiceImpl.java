package com.core.stxt.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.core.stxt.sys.entity.po.Member;
import com.core.stxt.sys.mapper.MemberMapper;
import com.core.stxt.sys.service.IMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 社团成员表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Service
public class MemberServiceImpl extends ServiceImpl<MemberMapper, Member> implements IMemberService {
    @Override
    public boolean deleteIds(List<String> ids) {
        for(String id : ids){
            this.removeById(id);
        }
        return true;
    }

    @Override
    public Integer getStatusByIdAndAssId(Integer AssociationId, Integer userId) {
        QueryWrapper<Member> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(AssociationId!=null,"association_id",AssociationId).eq(userId!=null,"user_id",userId);
        Member one = this.getOne(queryWrapper);
        if(one==null){
            return null;
        }
        return one.getStatus();
    }
}
