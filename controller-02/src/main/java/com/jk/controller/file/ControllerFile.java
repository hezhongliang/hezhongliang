/**
 * <pre>项目名称:controller-02
 * 文件名称:ControllerFile.java
 * 包名:com.jk.controller.file
 * 创建日期:2018年1月19日下午4:36:03
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre>
 */
package com.jk.controller.file;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import com.jk.util.file.FTPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jk.entity.user.FileDO;
import com.jk.entity.user.PageUtils;
import com.jk.entity.user.Query;
import com.jk.entity.user.R;
import com.jk.service.file.FileService;

@Controller
@RequestMapping("file")
public class ControllerFile {
	@Autowired
	private FileService  fileService;

	@RequestMapping("toFileListPage")
	String toFileListPage(){
		return "file/fileList";

	}

	/*	@RequestMapping("uploadFile")
        @ResponseBody
        String uploadFile(@RequestParam("file") MultipartFile file) {
            if (null != file) {
                System.out.println(file.getOriginalFilename());


            }
            return "{}";
        }*/
	@RequestMapping("uploadFileOne")
	@ResponseBody
	R uploadFileOne(@RequestParam("file") MultipartFile file,HttpServletRequest req) throws Exception {
		String fileName = file.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String folderPath = req.getSession().getServletContext().getRealPath("/")+
				"upload/";
		File files = new File(folderPath);
//        该目录是否已经存在
		if(!files.exists()){
			//   创建文件夹
			files.mkdir();
		}
		String onlyFileName = sdf.format(new Date())+fileName.substring(fileName.lastIndexOf('.'));
		FileOutputStream fos = new FileOutputStream(folderPath+onlyFileName);
		fos.write(file.getBytes());
		fos.flush();
		fos.close();
		req.setAttribute("urlStr", "upload/"+onlyFileName);
		System.out.println("upload/"+onlyFileName);
		FileDO fileDo = new FileDO();
		fileDo.setCreateDate(new Date());
		fileDo.setType(1);
		fileDo.setUrl(req.getContextPath()+"/upload/"+onlyFileName);
		fileService.insertFile(fileDo);
		FTPUtil.uploadFile(file.getInputStream(),onlyFileName,"upload");
		return  R.ok();
		//  return "../../tab1";
	}


//	@RequestMapping("uploadFileOne")
//	@ResponseBody
//	R uploadFileOne(@RequestParam("file") MultipartFile file,HttpServletRequest req) throws Exception {
//		if (null != file) {
//			String uid = UUID.randomUUID().toString();
//			FTPUtil.uploadFile(file.getInputStream(), uid+"dsdsd.jpg", "demoOne");
//			return  R.ok();
//		}else {
//			return  R.error();
//		}
//	}



	@RequestMapping("toquerylist")
	@ResponseBody
	public   PageUtils  toquerylist(@RequestParam Map<String, Object> params) {
		Query query = new Query(params);
		List<FileDO> sysFileList = fileService.list(query);
		int total = fileService.count(query);
		PageUtils pageUtils = new PageUtils(sysFileList, total);
		return pageUtils;



	}
	@RequestMapping("deleteByIdFile")
	@ResponseBody
	public R  deleteByIdFile(int id) {
		fileService.deleteByIdFile(id);
		return R.ok();

	}



	/*@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("common:sysFile:sysFile")
	public PageUtils list(@RequestParam Map<String, Object> params) {
		// 查询列表数据
		Query query = new Query(params);
		List<FileDO> sysFileList = sysFileService.list(query);
		int total = sysFileService.count(query);
		PageUtils pageUtils = new PageUtils(sysFileList, total);
		return pageUtils;
	}*/


}
