package com.core.stxt.sys.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 社团表
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="Association对象", description="社团表")
public class Association implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "社团id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "社团名称")
    private String name;

    @ApiModelProperty(value = "社团人数")
    private Integer num;

    @ApiModelProperty(value = "社团简介")
    private String brief;

    @ApiModelProperty(value = "社团封面图片地址")
    private String imgUrl;

    @ApiModelProperty(value = "官方QQ")
    private String qq;

    @ApiModelProperty(value = "官方邮箱")
    private String email;

    @ApiModelProperty(value = "社团状态（0——审批中，1——正常,2----已注销）")
    private Integer status;

    @ApiModelProperty(value = "社团类型id")
    private Integer typeId;

    @ApiModelProperty(value = "社团负责人id")
    private String studentId;

    @ApiModelProperty(value = "负责老师id")
    private String teacherId;

    @ApiModelProperty(value = "创建时间")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更改时间")
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @JsonSerialize(using = LocalDateTimeSerializer.class)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updateTime;


}
