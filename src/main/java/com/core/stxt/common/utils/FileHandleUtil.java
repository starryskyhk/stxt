package com.core.stxt.common.utils;


import com.core.stxt.common.model.R;
import org.apache.commons.io.FileUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.UUID;

/**
 * SpringBoot上传文件工具类
 * @author LinkinStar
 */
public class FileHandleUtil {

    /** 绝对路径 **/
    private static String absolutePath = "";

    /** 静态目录 **/
    private static String staticDir = "static";

    /** 文件存放的目录 **/
    private static String fileDir = "/upload/";

    /**
     * 上传单个文件
     * 最后文件存放路径为：static/upload/image/test.jpg
     * 文件访问路径为：http://127.0.0.1:8080/upload/image/test.jpg
     * 该方法返回值为：/upload/image/test.jpg
     * @param inputStream 文件流
     * @param path 文件路径，如：image/
     * @param relfilename 文件名，如：test.jpg
     * @return 成功：上传后的文件访问路径，失败返回：null
     */
    public static String upload(InputStream inputStream, String path, String relfilename) {
        //第一次会创建文件夹
        createDirIfNotExists();
        String filename = UUID.randomUUID().toString().replace("-", "")+relfilename;
        String resultPath = fileDir + path + filename;
        //存文件
        File uploadFile = new File(absolutePath, staticDir + resultPath);
        try {
            FileUtils.copyInputStreamToFile(inputStream, uploadFile);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        return resultPath;
    }

    /**
     * 创建文件夹路径
     */
    private static void createDirIfNotExists() {
        if (!absolutePath.isEmpty()) {return;}

        //获取跟目录
        File file = null;
        try {
            file = new File(ResourceUtils.getURL("classpath:").getPath());
        } catch (FileNotFoundException e) {
            throw new RuntimeException("获取根目录失败，无法创建上传目录！");
        }
        if(!file.exists()) {
            file = new File("");
        }

        absolutePath = file.getAbsolutePath();

        File upload = new File(absolutePath, staticDir + fileDir);
        if(!upload.exists()) {
            upload.mkdirs();
        }
    }

    /**
     * 删除文件
     * @param path 文件访问的路径upload开始 如： /upload/image/test.jpg
     * @return true 删除成功； false 删除失败
     */
    public static boolean delete(String path) {
        File file = new File(absolutePath, staticDir + path);
        if (file.exists()) {
            return file.delete();
        }
        return false;
    }
    //上传文件
    @PostMapping("/upload")
    public R upload(@RequestParam("file") MultipartFile file) throws IOException {
        File file1 = new File("src\\main\\webapp\\WEB-INF\\file\\ddd.docx");
        System.out.println(file1.getAbsolutePath());
        FileOutputStream fos = new FileOutputStream(file1);
        FileInputStream fis = (FileInputStream) file.getInputStream();
        byte[] buf = new byte[10];
        int len;
        while((len = fis.read(buf))!=-1){
            fos.write(buf,0,len);
        }
        fos.close();
        fis.close();
        return R.ok();
    }
}
