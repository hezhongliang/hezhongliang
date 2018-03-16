/** 
 * <pre>项目名称:ssm-01 
 * 文件名称:UserServiceImpl.java 
 * 包名:com.jk.service.impl.user 
 * 创建日期:2018年1月16日上午10:54:47 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.service.user.impl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.*;


import com.jk.entity.user.FileDO;
import com.jk.service.file.FileService;

import com.jk.util.entity.DictDO;
import com.jk.util.entity.StringUtils;
import com.jk.util.entity.UserDO;
import com.jk.util.entity.UserVO;
import com.jk.util.file.FileType;
import com.jk.util.file.FileUtil;
import com.jk.util.file.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk.entity.user.User;
import com.jk.entity.user.UserRequset;
import com.jk.mapper.user.UserMapper;
import com.jk.service.user.UserService;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;

/** 
 * <pre>项目名称：ssm-01    
 * 类名称：UserServiceImpl    
 * 类描述：    
 * 创建人：底兴美 983602927@qq.com    
 * 创建时间：2018年1月16日 上午10:54:47    
 * 修改人：底兴美 983602927@qq.com  
 * 修改时间：2018年1月16日 上午10:54:47    
 * 修改备注：       
 * @version </pre>    
 */
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	@Autowired
	private FileService sysFileService;
	@Override
	public Map<String, Object> queryAll(User user, int page, int rows) {
		Map<String, Object> map = new HashMap<>();
		long tot = userMapper.queryTotal(user);
		int start = (page-1)*rows;
		int end = rows;
		List types2 = userMapper.queryTypePage(user,start,end);
		map.put("total", tot);
		map.put("rows", types2);
		return map;
	}
	/* (non-Javadoc)    
	 * @see com.jk.service.user.UserService#add()    
	 */
	@Override
	public void add(User user) {
		// TODO Auto-generated method stub
		 userMapper.add(user);
	}
	/* (non-Javadoc)    
	 * @see com.jk.service.user.UserService#del(com.jk.entity.user.User)    
	 */
	@Override
	public void del(User user) {
		// TODO Auto-generated method stub
		userMapper.del(user);
	}
	/* (non-Javadoc)    
	 * @see com.jk.service.user.UserService#toup(com.jk.entity.user.User)    
	 */
	@Override
	public User toup(User user) {
		// TODO Auto-generated method stub
		return userMapper.toup(user);
	}
	/* (non-Javadoc)    
	 * @see com.jk.service.user.UserService#ups(com.jk.entity.user.User)    
	 */
	@Override
	public void ups(User user) {
		// TODO Auto-generated method stub
		userMapper.ups(user);
	}
	/* (non-Javadoc)    
	 * @see com.jk.service.user.UserService#deletes(java.lang.String)    
	 */
	@Override
	public void deletes(String str) {
		userMapper.deletes(str);
		
	}
	/* (non-Javadoc)    
	 * @see com.jk.service.user.UserService#insertUsers(java.util.List)    
	 */
	@Override
	public void insertUsers(List<UserRequset> list) {
		
		userMapper.insertUsers(list);
	}
	/* (non-Javadoc)    
	 * @see com.jk.service.user.UserService#queryUserById1(java.lang.String)    
	 */
	@Override
	public User queryUserById1(String str) {
		// TODO Auto-generated method stub
		return userMapper.queryUserById1(str);
	}
	/* (non-Javadoc)    
	 * @see com.jk.service.user.UserService#updateUserAll(java.util.List)    
	 */
	@Override
	public int updateUserAll(List<UserRequset> list) {
		int count=0;
		
		
		
		 for (int i = 0; i < list.size(); i++) {
			 count += 	userMapper.updateUserAll(list.get(i));
		}
		return count;
	}


	@Override
	public UserDO get(Long userId) {
		List<Long> roleIds = userMapper.listRoleId(userId);
		UserDO user = userMapper.get(userId);
		user.setDeptName(userMapper.get1(user.getDeptId()).getName());
		user.setRoleIds(roleIds);
		return user;
	}

	@Override
	public List<DictDO> getHobbyList(UserDO userDO) {
		Map<String, Object> param = new HashMap<>(16);
		param.put("type", "hobby");
		List<DictDO> hobbyList = userMapper.list(param);

		if (StringUtils.isNotEmpty(userDO.getHobby())) {
			String userHobbys[] = userDO.getHobby().split(";");
			for (String userHobby : userHobbys) {
				for (DictDO hobby : hobbyList) {
					if (!Objects.equals(userHobby, hobby.getId().toString())) {
						continue;
					}
					hobby.setRemarks("true");
					break;
				}
			}
		}

		return hobbyList;
	}

	@Override
	public List<DictDO> getSexList() {
		Map<String, Object> param = new HashMap<>(16);
		param.put("type", "sex");
		return userMapper.list(param);
	}

	@Override
	public int updatePersonal(UserDO user) {

		return userMapper.updatePersonal(user);
	}

	@Override
	public void resetPwd(UserDO userDO, UserVO userVO) {
		userMapper.resetPwd(userDO.getUserId(),userVO.getPwdNew());
	}

    @Override
    public Map<String, Object> updatePersonalImg(MultipartFile file, String avatar_data, Long i) throws Exception {
		String fileName = file.getOriginalFilename();
		fileName = FileUtil.renameToUUID(fileName);
		FileDO sysFile = new FileDO(FileType.fileType(fileName), "/files/" + fileName, new Date());
		//获取图片后缀
		String prefix = fileName.substring((fileName.lastIndexOf(".")+1));
		String[] str=avatar_data.split(",");
		//获取截取的x坐标
		int x = (int)Math.floor(Double.parseDouble(str[0].split(":")[1]));
		//获取截取的y坐标
		int y = (int)Math.floor(Double.parseDouble(str[1].split(":")[1]));
		//获取截取的高度
		int h = (int)Math.floor(Double.parseDouble(str[2].split(":")[1]));
		//获取截取的宽度
		int w = (int)Math.floor(Double.parseDouble(str[3].split(":")[1]));
		//获取旋转的角度
		int r = Integer.parseInt(str[4].split(":")[1].replaceAll("}", ""));
		try {
			BufferedImage cutImage = ImageUtils.cutImage(file,x,y,w,h,prefix);
			BufferedImage rotateImage = ImageUtils.rotateImage(cutImage, r);
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			boolean flag = ImageIO.write(rotateImage, prefix, out);
			//转换后存入数据库
			byte[] b = out.toByteArray();
			FileUtil.uploadFile(b,"upload/" , fileName);
		} catch (Exception e) {
			throw new Exception("图片裁剪错误！！");
		}
		Map<String, Object> result = new HashMap<>();
		if(sysFileService.save(sysFile)>0){
			UserDO userDO = new UserDO();
			userDO.setUserId(i);
			userDO.setPicId(sysFile.getId());
			if(userMapper.update(userDO)>0){
				result.put("url",sysFile.getUrl());
			}
		}
		return result;
    }
}
