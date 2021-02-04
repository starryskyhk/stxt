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
 * 活动表
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Activity对象", description="活动表")
public class Activity implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "活动id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "活动标题")
    private String title;

    @ApiModelProperty(value = "活动内容")
    private String content;

    @ApiModelProperty(value = "活动地址")
    private String address;

    @ApiModelProperty(value = "开始时间")
    private LocalDateTime beginTime;

    @ApiModelProperty(value = "结束时间")
    private LocalDateTime endTime;

    @ApiModelProperty(value = "活动图片地址")
    private String imgUrl;

    @ApiModelProperty(value = "活动允许最大人数")
    private Integer maxNum;

    @ApiModelProperty(value = "活动实际参加人数")
    private Integer num;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更改时间")
    private LocalDateTime updateTime;


}
