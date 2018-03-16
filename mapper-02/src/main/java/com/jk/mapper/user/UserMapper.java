/** 
 * <pre>项目名称:ssm-01 
 * 文件名称:UserMapper.java 
 * 包名:com.jk.mapper 
 * 创建日期:2018年1月16日上午10:52:46 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.mapper.user;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jk.util.entity.DeptDO;
import com.jk.util.entity.DictDO;
import com.jk.util.entity.UserDO;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jk.entity.user.User;
import com.jk.entity.user.UserRequset;


public interface UserMapper {

	/** <pre>queryTotal(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 上午11:42:57    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 上午11:42:57    
	 * 修改备注： 
	 * @param user
	 * @return</pre>    
	 */
	long queryTotal(User user);

	/** <pre>queryTypePage(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 上午11:43:01    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 上午11:43:01    
	 * 修改备注： 
	 * @param user
	 * @param start
	 * @param end
	 * @return</pre>    
	 */
	List queryTypePage(User user, @Param(value="start")int start,  @Param(value="end")int end);

	/** <pre>add(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午1:14:01    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午1:14:01    
	 * 修改备注： 
	 * @param user
	 * @return</pre>    
	 */
	void add(User user);

	/** <pre>del(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午1:23:22    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午1:23:22    
	 * 修改备注： 
	 * @param user</pre>    
	 */
	void del(User user);

	/** <pre>toup(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午1:33:19    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午1:33:19    
	 * 修改备注： 
	 * @param user
	 * @return</pre>    
	 */
	User toup(User user);

	/** <pre>ups(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午1:36:08    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午1:36:08    
	 * 修改备注： 
	 * @param user</pre>    
	 */
	void ups(User user);

	/** <pre>deletes(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午9:23:25    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午9:23:25    
	 * 修改备注： 
	 * @param str</pre>    
	 */
	@Delete("delete from t_user where userID=#{str}")
	void deletes(String str);

	/** <pre>insertUsers(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午9:31:29    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午9:31:29    
	 * 修改备注： 
	 * @param list</pre>    
	 */
	void insertUsers(List<UserRequset> list);

	/** <pre>queryUserById1(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午9:47:19    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午9:47:19    
	 * 修改备注： 
	 * @param str
	 * @return</pre>    
	 */
	@Select("select *  from t_user where userID=#{str}")
	User queryUserById1(String str);

	/** <pre>updateUserAll(这里用一句话描述这个方法的作用)   
	 * 创建人：底兴美 983602927@qq.com     
	 * 创建时间：2018年1月16日 下午9:55:22    
	 * 修改人：底兴美 983602927@qq.com      
	 * 修改时间：2018年1月16日 下午9:55:22    
	 * 修改备注： 
	 * @param userRequset
	 * @return</pre>    
	 */
	@Update("update t_user set userAcount=#{userAcount},userPass=#{userPass} where userID=#{userID}")
	int updateUserAll(UserRequset userRequset);

    List<Long> listRoleId(Long userId);

	UserDO get(Long userId);

	List<DictDO> list(Map<String, Object> param);

	DeptDO get1(Long deptId);

	int updatePersonal(UserDO user);

	void resetPwd(@Param("userId") Long userId,@Param("pwdNew") String pwdNew);

	int update(UserDO userDO);

    Set<String> selectUserRoleListByUserID(Long userId);

	UserDO login(UserDO userRequest);

    int remove(Long userId);

	int save(UserDO user);
}
