package com.core.utils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtil {
    /**
     * 工具类
     * @param req
     * @param file 文件流
     * @param originalFilename 上传文件名称
     * @return
     * @throws IOException
     */
    public static String writeFile(HttpServletRequest req, byte[] file, String originalFilename) throws IOException {
        // 获取文件上传要保存到的文件地址

        String path = "C:\\Users\\Lenovo\\Desktop\\sjpt_\\src\\main\\webapp\\img\\";

        //System.out.println(path);

        // 如果文件夹不存在则创建该文件夹
        File uploadDir = new File(path);
        if (!uploadDir.exists()){
            uploadDir.mkdirs();
        }
        FileOutputStream out = new FileOutputStream(path+originalFilename);
        out.write(file);
        out.flush();
        out.close();

        // 文件上传后的访问路径
        //http://localhost:8080/SMS
        String basePath = req.getRequestURL().substring(0,req.getRequestURL().lastIndexOf("/"));
        System.out.println(basePath);
        return "img/"+originalFilename;
    }
}
