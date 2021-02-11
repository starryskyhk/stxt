package com.core.stxt.common.utils;


import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IORuntimeException;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.Instant;

/**
 * SpringBoot上传文件工具类
 * @author LinkinStar
 */
public class FileHandlerUtils {

    /** 绝对路径 **/
    private static String ROOTPATH = "src/main/webapp";
    private static String IMGPATH="/file/";

    //上传单个文件到file中去,并返回文件路径
    public static String upload(MultipartFile file) {
        //获取文件名称
        String filename = file.getOriginalFilename();
        InputStream inputStream = null;
        String path = "";
        //获取文件输入流
        try {
            inputStream = file.getInputStream();
            //文件名
            filename = String.valueOf(Instant.now().toEpochMilli()) + "-" + filename;
            //重命名文件,为路径+现在时间戳+文件名
            path = ROOTPATH+IMGPATH+ filename;
            //将文件上传到path路径下
            FileUtils.copyInputStreamToFile(inputStream, new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return IMGPATH+ filename;
    }
    //删除文件
    public static boolean deleteFile(String fileName){
        try {
            String path = ROOTPATH+fileName;
            System.out.println("path:"+path);
            FileUtil.del(new File(path));
            return true;
        } catch (IORuntimeException e) {
            e.printStackTrace();
            return false;
        }
    }
}
