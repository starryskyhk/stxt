package com.core.stxt.sys.entity.po;

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
 * 活动场地表
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="ActivitySpace对象", description="活动场地表")
public class ActivitySpace implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "场地id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "场地名称")
    private String name;

    @ApiModelProperty(value = "社团id")
    private Integer associationId;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更改时间")
    private LocalDateTime updateTime;


}
