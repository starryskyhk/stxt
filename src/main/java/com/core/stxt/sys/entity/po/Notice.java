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
 * 公告表
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Notice对象", description="公告表")
public class Notice implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "公告id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "公告标题")
    private String title;

    @ApiModelProperty(value = "公告内容")
    private String content;

    @ApiModelProperty(value = "浏览次数")
    private Integer count;

    @ApiModelProperty(value = "发布者id")
    private String userId;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更改时间")
    private LocalDateTime updateTime;


}
