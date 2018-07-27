package com.education.official.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import java.io.File;
import java.util.Date;
import java.util.Iterator;

/**
 * 上传文件的处理controller
 *
 * @Author:weiyuanlong
 * @Date: Created in 2018-07-27 20:20:09
 * @Modified By:
 */
@Controller
public class FileController extends BaseController {

    /**
     * 跳转到添加文件页面
     *
     * @return
     */
    @RequestMapping("getFilePage")
    public String getFilePage() {
        return "backstage/jsp/testFileUpload";
    }

    /**
     * logo图片上传
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "logoUpload",method = {RequestMethod.POST})
    @ResponseBody
    public String logoUpload(MultipartHttpServletRequest request) {
        String localPath = "";
        try{
            MultipartFile orgLogo = request.getFile("orgLogo");
            String logoPath = request.getParameter("logoPath");
            deleteOldLogo(logoPath);

            if (orgLogo != null) {
                String path = request.getSession().getServletContext().getRealPath("") + "res\\images\\";
                // 获取解析器
                CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
                // 判断是否是文件
                if (resolver.isMultipart(request)) {
                    // 进行转换
                    MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) (request);
                    // 获取所有文件名称
                    Iterator<String> it = multiRequest.getFileNames();
                    while (it.hasNext()) {
                        // 定义文件名和路径
                        MultipartFile file = multiRequest.getFile(it.next());
                        String fileType = file.getOriginalFilename();
                        fileType = fileType.split("\\.")[fileType.split("\\.").length-1];
                        String fileName = "driverLogo" + new Date().getTime() + "." + fileType;

                        localPath = path + fileName;
                        // 创建一个新的文件对象，创建时需要一个参数，参数是文件所需要保存的位置
                        File newFile = new File(localPath);
                        // 上传的文件写入到指定的文件中
                        file.transferTo(newFile);
                    }
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return setJsonMessage(true,localPath);
    }

    /**
     * 删除旧图片
     *
     * @param oldPath
     */
    private void deleteOldLogo(String oldPath) {
        File oldFile = new File(oldPath);
        if(oldFile.exists()) {
            oldFile.delete();
        }
    }

}
