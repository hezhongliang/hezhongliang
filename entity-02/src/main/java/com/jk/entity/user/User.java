/** 
 * <pre>项目名称:ssm-01 
 * 文件名称:User.java 
 * 包名:com.jk.entity.user 
 * 创建日期:2018年1月16日上午11:02:22 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */  
package com.jk.entity.user;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/** 
 * <pre>项目名称：ssm-01    
 * 类名称：User    
 * 类描述：    
 * 创建人：底兴美 983602927@qq.com    
 * 创建时间：2018年1月16日 上午11:02:22    
 * 修改人：底兴美 983602927@qq.com  
 * 修改时间：2018年1月16日 上午11:02:22    
 * 修改备注：       
 * @version </pre>    
 */
public class User implements Serializable{
	private Integer userID;

	private String  userAcount;

	private String userPass;

	private Long userId;
	// 用户名
	private String username;
	// 用户真实姓名
	private String name;
	// 密码
	private String password;
	// 部门
	private Long deptId;
	private String deptName;
	// 邮箱
	private String email;
	// 手机号
	private String mobile;
	// 状态 0:禁用，1:正常
	private Integer status;
	// 创建用户id
	private Long userIdCreate;
	// 创建时间
	private Date gmtCreate;
	// 修改时间
	private Date gmtModified;
	//角色
	private List<Long> roleIds;
	//性别
	private Long sex;
	//出身日期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	//图片ID
	private Long picId;
	//现居住地
	private String liveAddress;
	//爱好
	private String hobby;
	//省份
	private String province;
	//所在城市
	private String city;
	//所在地区
	private String district;

	public Integer getUserID() {
		return userID;
	}


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getUserIdCreate() {
		return userIdCreate;
	}

	public void setUserIdCreate(Long userIdCreate) {
		this.userIdCreate = userIdCreate;
	}

	public Date getGmtCreate() {
		return gmtCreate;
	}

	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}

	public Date getGmtModified() {
		return gmtModified;
	}

	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}

	public List<Long> getRoleIds() {
		return roleIds;
	}

	public void setRoleIds(List<Long> roleIds) {
		this.roleIds = roleIds;
	}

	public Long getSex() {
		return sex;
	}

	public void setSex(Long sex) {
		this.sex = sex;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Long getPicId() {
		return picId;
	}

	public void setPicId(Long picId) {
		this.picId = picId;
	}

	public String getLiveAddress() {
		return liveAddress;
	}

	public void setLiveAddress(String liveAddress) {
		this.liveAddress = liveAddress;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}
}
