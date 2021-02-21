package com.core.stxt.sys.entity.vo;

import com.core.stxt.sys.entity.po.User;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * @ClassName : MemberInfo
 * @Description :
 * @Author : Starry_sky
 * @Date: 2021-02-11 21:41  //时间
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="社团成员对象", description="存放社团成员相关信息")
public class MemberInfo {
    /**
     * 成员表id
     */
    private Integer memberId;
    /**
     * 用户id
     */
    private String userId;
    /**
     * 用户姓名
     */
    private String name;
    /**
     * 用户性别
     */
    private Integer sex;
    /**
     * 用户班级
     */
    private String className;
    /**
     * 用户电话
     */
    private String phone;
    /**
     * 用户职位
     */
    private String rank;
    /**
     * 用户加入时间
     */
    private LocalDateTime createTime;
}
