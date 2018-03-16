/** 
 * <pre>项目名称:controller-02 
 * 文件名称:Text.java 
 * 包名:com.jk.controller.user 
 * 创建日期:2018年1月22日上午9:20:01 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.controller.user;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.format.datetime.joda.MillisecondInstantPrinter;

/** 
 * <pre>项目名称：controller-02    
 * 类名称：Text    
 * 类描述：    
 * 创建人：王博
 * 创建时间：2018年1月22日 上午9:20:01    
 * 修改人：王博    
 * 修改时间：2018年1月22日 上午9:20:01    
 * 修改备注：       
 * @version </pre>    
 */
public class Text {
	
	
	public static void main(String[] args) {
		
		Map<Object, String>	  aa= new HashMap();
		  
		aa.put("name", "底兴美王八蛋");
		
		 Set keySet = aa.keySet();
		 
		 Iterator it = keySet.iterator();
		 
		  while (it.hasNext()) {
			
			  Object name =it.next();
			  Object 姓名 = aa.get(name)	;		
			  
			  System.out.println(name+"："+姓名);
		}
	}
	
	

}
