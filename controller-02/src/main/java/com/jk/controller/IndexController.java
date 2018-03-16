/** 
 * <pre>项目名称:controller-02 
 * 文件名称:IndexController.java 
 * 包名:com.jk.controller.user 
 * 创建日期:2018年1月19日下午1:50:37 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {
	@RequestMapping("/")
	public Object toindex(){
		return "index";
		
	}
	@GetMapping("/error/{code}")
	String toErrorPage(@PathVariable("code") String code) {
		return "error/" + code;
	}
}
