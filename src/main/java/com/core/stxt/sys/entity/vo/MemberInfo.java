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
     * 用户信息
     */
    private User user;
    /**
     * 加入社团的时间
     */
    private LocalDateTime joinTime;
}
