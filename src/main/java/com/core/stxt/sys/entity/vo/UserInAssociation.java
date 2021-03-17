package com.core.stxt.sys.entity.vo;

/**
 * @ClassName : UserInAssociation
 * @Description :
 * @Author : Starry_sky
 * @Date: 2021-03-17 20:14  //时间
 */

import com.core.stxt.sys.entity.po.Association;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="用户加入的社团", description="存放社团相关信息")
public class UserInAssociation {
    private Association association;
    private String type;
    private String userName;
    private String memberStatus;
}
