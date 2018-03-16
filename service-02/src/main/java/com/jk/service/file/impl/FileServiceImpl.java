/** 
 * <pre>项目名称:service-02 
 * 文件名称:FileServiceImpl.java 
 * 包名:com.jk.service.file.impl 
 * 创建日期:2018年1月19日下午5:31:02 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.service.file.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk.entity.user.FileDO;
import com.jk.entity.user.Query;
import com.jk.mapper.file.FileMapper;
import com.jk.service.file.FileService;

/** 
 * <pre>项目名称：service-02    
 * 类名称：FileServiceImpl    
 * 类描述：    
 * 创建人：王博
 * 创建时间：2018年1月19日 下午5:31:02    
 * 修改人：王博    
 * 修改时间：2018年1月19日 下午5:31:02    
 * 修改备注：       
 * @version </pre>    
 */
@Service
public class FileServiceImpl implements FileService {
	@Autowired
	private FileMapper fileMapper;
	
	/* (non-Javadoc)    
	 * @see com.jk.service.file.FileService#insertFile(com.jk.entity.user.FileDO)    
	 */
	@Override
	public void insertFile(FileDO fileDo) {
		fileMapper.insertFile(fileDo);
		
		
	}

	/* (non-Javadoc)    
	 * @see com.jk.service.file.FileService#list(com.jk.entity.user.Query)    
	 */
	@Override
	public List<FileDO> list(Query query) {
		// TODO Auto-generated method stub
		return fileMapper.list(query);
	}

	/* (non-Javadoc)    
	 * @see com.jk.service.file.FileService#count(com.jk.entity.user.Query)    
	 */
	@Override
	public int count(Query query) {
		
		return fileMapper.count(query);
	}

	/* (non-Javadoc)    
	 * @see com.jk.service.file.FileService#deleteByIdFile(java.lang.String)    
	 */
	@Override
	public void deleteByIdFile(int id) {
		fileMapper.deleteByIdFile(id);
		
	}


	@Override
	public int save(FileDO sysFile) {
		return fileMapper.save(sysFile);
	}
}
