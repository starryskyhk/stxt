package com.core.stxt.sys.service.impl;

import com.core.stxt.sys.entity.Member;
import com.core.stxt.sys.mapper.MemberMapper;
import com.core.stxt.sys.service.IMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 社团成员表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-30
 */
@Service
public class MemberServiceImpl extends ServiceImpl<MemberMapper, Member> implements IMemberService {

}
