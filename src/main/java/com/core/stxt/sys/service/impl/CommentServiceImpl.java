package com.core.stxt.sys.service.impl;

import com.core.stxt.sys.entity.po.Comment;
import com.core.stxt.sys.mapper.CommentMapper;
import com.core.stxt.sys.service.ICommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 评论表 服务实现类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {

}
