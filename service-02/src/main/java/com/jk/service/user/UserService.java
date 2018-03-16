/** 
 * <pre>项目名称:ssm-01 
 * 文件名称:UserService.java 
 * 包名:com.jk.service 
 * 创建日期:2018年1月16日上午10:50:39 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.service.user;

import java.util.List;
import java.util.Map;

import com.jk.util.entity.UserDO;
import com.jk.util.entity.UserVO;

import com.jk.entity.user.User;
import com.jk.entity.user.UserRequset;
import org.springframework.web.multipart.MultipartFile;

/** 
 * <pre>项目名称：ssm-01    
 * 类名称：UserService    
 * 类描述：    
 * 创建人：底兴美 983602927@qq.com    
 * 创建时间：2018年1月16日 上午10:50:39    
 * 修改人：底兴美 983602927@qq.com  
 * 修改时间：2018年1月16日 上午10:50:39    
 * 修改备注：       
 * @version </pre>    
 */
public interface UserService {

	/** <pre>queryAll(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 上午11:42:08    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 上午11:42:08    
	 * 修改备注： 
	 * @param user
	 * @param page
	 * @param rows
	 * @return</pre>    
	 */
	Map<String, Object> queryAll(User user, int page, int rows);

	/** <pre>add(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午1:13:10    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午1:13:10    
	 * 修改备注： 
	 * @param user 
	 * @return</pre>    
	 */
	void add(User user);

	/** <pre>del(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午1:23:08    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午1:23:08    
	 * 修改备注： 
	 * @param user</pre>    
	 */
	void del(User user);

	/** <pre>toup(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午1:32:55    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午1:32:55    
	 * 修改备注： 
	 * @param user
	 * @return</pre>    
	 */
	User toup(User user);

	/** <pre>ups(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午1:35:55    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午1:35:55    
	 * 修改备注： 
	 * @param user</pre>    
	 */
	void ups(User user);


	void deletes(String str);

	/** <pre>insertUsers(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午9:30:33    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午9:30:33    
	 * 修改备注： 
	 * @param list</pre>    
	 */
	void insertUsers(List<UserRequset> list);

	User queryUserById1(String str);

	UserDO get(Long userId);

	Object getHobbyList(UserDO userDO);

	Object getSexList();

	int updateUserAll(List<UserRequset> list);

	int updatePersonal(UserDO user);

	void resetPwd(UserDO userDO, UserVO userVO);

    Map<String,Object> updatePersonalImg(MultipartFile file, String avatar_data, Long i) throws Exception;

}