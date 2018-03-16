/** 
 * <pre>项目名称:ssm-01 
 * 文件名称:UserController.java 
 * 包名:com.jk.controller 
 * 创建日期:2018年1月16日上午10:49:14 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.jk.util.entity.UserDO;

import com.jk.entity.user.R;
import com.jk.util.entity.UserVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.jk.entity.user.User;
import com.jk.entity.user.UserRequset;
import com.jk.service.user.UserService;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("user")
public class UserController {
	@Resource
	private UserService userService;
	@RequestMapping("queryAll")
	@ResponseBody
	public Object queryAll(User user,int page,int rows){
		Map<String, Object> map =userService.queryAll(user,page,rows);
		return map;
	}
	@RequestMapping("add")
	@ResponseBody
	public void add(User user){
		userService.add(user);
	}
	@RequestMapping("del")
	@ResponseBody
	public void del(User user){
		userService.del(user);
	}
	@RequestMapping("toup")
	public String toup(User user,HttpServletRequest request){
		user=userService.toup(user);
		request.setAttribute("u", user);
		return "myuser/edit";
	}
	@RequestMapping("ups")
	@ResponseBody
	public void ups(User user){
		userService.ups(user);
	}
	
	@RequestMapping("deletes")
	@ResponseBody
	public Object deletes(String ids){
		String[] arr = ids.split(",");
		for (int i = 0; i < arr.length; i++) {
			userService.deletes(arr[i]);
		}
	
		return "1";
	
	}
	@RequestMapping("insertUsers")
	@ResponseBody
	String insertUsers(@RequestBody List<UserRequset> list) {
		userService.insertUsers(list);
		return "{}";
	}
	
	@RequestMapping("queryUserById1")
	public String queryUserById1(String ids1,ModelMap map){
		String[] arr = ids1.split(",");
		List <User>list1= new ArrayList<User>();
		for (int i = 0; i < arr.length; i++) {
			
		User  user =  	userService.queryUserById1(arr[i]);
		
		list1.add(user);
		
		}
		map.addAttribute("list",list1);
		
		return "myuser/list2";
		
	}

	@RequestMapping("updateUserAll")
	@ResponseBody
	public  Object  updateUserAll(@RequestBody List<UserRequset> list){
		
	 int count = userService.updateUserAll(list);
	 
	  return  count;
	
	}
	
	@RequestMapping("toindex")
	public Object toindex(){
		return "index";
		
	}
	@RequestMapping("tolist")
	public Object tolist(){
		return "myuser/list";
		
	}
	@RequestMapping("toadd")
	public Object toadd(){
		return "myuser/add";
	}
	@RequestMapping("toadds")
	public Object toadds(){
		return "myuser/adds";
	}


//	个人设置
		@GetMapping("/personal")
		public String personal(HttpServletRequest request) {
			UserDO userDO  = userService.get(1L);
			request.setAttribute("pwd",userDO.getPassword());
			request.setAttribute("user",userDO);
			request.setAttribute("hobbyList",userService.getHobbyList(userDO));
			request.setAttribute("sexList",userService.getSexList());
			return "system/user/personal";
		}


		@PostMapping("updatePeronal")
		@ResponseBody
		public R updatePeronal(UserDO user) {

			if (userService.updatePersonal(user) > 0) {
				return R.ok();
			}
			return R.error();
		}

//		@GetMapping("/resetPwd/{id}")
//		public String resetPwd(@PathVariable("id") Long userId, HttpServletRequest request) {
//
//			UserDO userDO = new UserDO();
//			userDO.setUserId(userId);
//			request.setAttribute("user", userDO);
//			return "/reset_pwd";
//		}

	@PostMapping("/resetPwd")
	@ResponseBody
	public R resetPwd(UserVO userVO, UserDO userDO) {
//		try{
//			userService.resetPwd(userVO,getUser());
//			return R.ok();
//		}catch (Exception e){
//			return R.error(1,e.getMessage());
//		}
		userService.resetPwd(userDO,userVO);
		return R.ok();
	}

	@ResponseBody
	@PostMapping("/uploadImg")
	R uploadImg(@RequestParam("avatar_file") MultipartFile file, String avatar_data, HttpServletRequest request,UserDO user) {

		Map<String, Object> result = new HashMap<>();
		long a=1;

		try {

			result = userService.updatePersonalImg(file, avatar_data, a);
		} catch (Exception e) {
			return R.error("更新图像失败！");
		}
		if(result!=null && result.size()>0){
			return R.ok(result);
		}else {
			return R.error("更新图像失败！");
		}
	}

}
