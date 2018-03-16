/** 
 * <pre>项目名称:mapper-02 
 * 文件名称:FileMapper.java 
 * 包名:com.jk.mapper.file 
 * 创建日期:2018年1月19日下午6:41:21 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.mapper.file;

import java.util.List;

import org.apache.ibatis.annotations.Insert;

import com.jk.entity.user.FileDO;
import com.jk.entity.user.Query;

/** 
 * <pre>项目名称：mapper-02    
 * 类名称：FileMapper    
 * 类描述：    
 * 创建人：王博
 * 创建时间：2018年1月19日 下午6:41:21    
 * 修改人：王博    
 * 修改时间：2018年1月19日 下午6:41:21    
 * 修改备注：       
 * @version </pre>    
 */
public interface FileMapper {

	/** <pre>insertFile(这里用一句话描述这个方法的作用)   
	 * 创建人：王博
	 * 创建时间：2018年1月19日 下午6:50:58    
	 * 修改人:王博      
	 * 修改时间：2018年1月19日 下午6:50:58    
	 * 修改备注： 
	 * @param fileDo</pre>    
	 */
	@Insert("insert into sys_file values(id,#{type},#{url},#{createDate})")
	void insertFile(FileDO fileDo);

	/** <pre>list(这里用一句话描述这个方法的作用)   
	 * 创建人：王博
	 * 创建时间：2018年1月19日 下午7:17:56    
	 * 修改人:王博      
	 * 修改时间：2018年1月19日 下午7:17:56    
	 * 修改备注： 
	 * @param query
	 * @return</pre>    
	 */
	List<FileDO> list(Query query);

	/** <pre>count(这里用一句话描述这个方法的作用)   
	 * 创建人：王博
	 * 创建时间：2018年1月19日 下午7:18:19    
	 * 修改人:王博      
	 * 修改时间：2018年1月19日 下午7:18:19    
	 * 修改备注： 
	 * @param query
	 * @return</pre>    
	 */
	int count(Query query);

	/** <pre>deleteByIdFile(这里用一句话描述这个方法的作用)   
	 * 创建人：王博
	 * 创建时间：2018年1月19日 下午10:02:51    
	 * 修改人:王博      
	 * 修改时间：2018年1月19日 下午10:02:51    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	
	
	
	void deleteByIdFile(int id);

    int save(FileDO sysFile);

    /** <pre>insertFile(这里用一句话描述这个方法的作用)   
	 * 创建人：王博
	 * 创建时间：2018年1月19日 下午6:42:01    
	 * 修改人:王博      
	 * 修改时间：2018年1月19日 下午6:42:01    
	 * 修改备注： 
	 * @param fileDo</pre>    
	 */
	
	

}
