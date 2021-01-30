package com.core.stxt.sys.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 社团成员表
 * </p>
 *
 * @author 孙和美
 * @since 2021-01-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Member对象", description="社团成员表")
public class Member implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "成员表id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "成员id")
    private String userId;

    @ApiModelProperty(value = "成员状态(0—正常，1——申请退出中，)")
    private Integer status;

    @ApiModelProperty(value = "社团id")
    private Integer associationId;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;


}
