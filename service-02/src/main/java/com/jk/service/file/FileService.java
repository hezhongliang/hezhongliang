/** 
 * <pre>项目名称:service-02 
 * 文件名称:FileService.java 
 * 包名:com.jk.service.file 
 * 创建日期:2018年1月19日下午5:16:41 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.service.file;

import java.util.List;

import com.jk.entity.user.FileDO;
import com.jk.entity.user.Query;

/** 
 * <pre>项目名称：service-02    
 * 类名称：FileService    
 * 类描述：    
 * 创建人：王博
 * 创建时间：2018年1月19日 下午5:16:41    
 * 修改人：王博    
 * 修改时间：2018年1月19日 下午5:16:41    
 * 修改备注：       
 * @version </pre>    
 */
public interface FileService {

	/** <pre>insertFile(这里用一句话描述这个方法的作用)   
	 * 创建人：王博
	 * 创建时间：2018年1月19日 下午6:38:57    
	 * 修改人:王博      
	 * 修改时间：2018年1月19日 下午6:38:57    
	 * 修改备注： 
	 * @param fileDo</pre>    
	 */
	void insertFile(FileDO fileDo);

	/** <pre>list(这里用一句话描述这个方法的作用)   
	 * 创建人：王博
	 * 创建时间：2018年1月19日 下午7:13:11    
	 * 修改人:王博      
	 * 修改时间：2018年1月19日 下午7:13:11    
	 * 修改备注： 
	 * @param query
	 * @return</pre>    
	 */
	List<FileDO> list(Query query);

	/** <pre>count(这里用一句话描述这个方法的作用)   
	 * 创建人：王博
	 * 创建时间：2018年1月19日 下午7:13:15    
	 * 修改人:王博      
	 * 修改时间：2018年1月19日 下午7:13:15    
	 * 修改备注： 
	 * @param query
	 * @return</pre>    
	 */
	int count(Query query);

	/** <pre>deleteByIdFile(这里用一句话描述这个方法的作用)   
	 * 创建人：王博
	 * 创建时间：2018年1月19日 下午10:00:41    
	 * 修改人:王博      
	 * 修改时间：2018年1月19日 下午10:00:41    
	 * 修改备注： 
	 * @param id</pre>    
	 */
	void deleteByIdFile(int id);

	int save(FileDO sysFile);
}
