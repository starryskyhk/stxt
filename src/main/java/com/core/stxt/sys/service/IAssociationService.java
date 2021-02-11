package com.core.stxt.sys.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.core.stxt.sys.entity.po.Association;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 社团表 服务类
 * </p>
 *
 * @author 孙和美
 * @since 2021-02-03
 */
public interface IAssociationService extends IService<Association> {
    /**
     * 添加社团信息
     * @param association 社团对象
     * @param file 图片文件
     * @return 返回是否添加成功
     */
    boolean saveAssociation(Association association, MultipartFile file);


    /**
     * 更改社团信息
     * @param association 社团信息
     * @param file 文献
     * @return
     */
    boolean updateAssociationInfo(Association association, MultipartFile file);

    /**
     * 批量删除
     * @param asList
     * @return
     */
    boolean deleteIds(List<String> asList);

    /**
     * 删除单条信息
     * @param id 社团id
     */
    boolean deleteById(Integer id);

    /**
     * 根据条件查询社团列表
     * @param association 社团字段
     * @return 返回查询到的社团列表
     */
    List<Association> list(Association association);
}
