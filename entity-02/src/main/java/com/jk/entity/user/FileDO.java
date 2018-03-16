/** 
 * <pre>项目名称:entity-02 
 * 文件名称:FileDO.java 
 * 包名:com.jk.entity.user 
 * 创建日期:2018年1月19日下午5:21:01 
 * Copyright (c) 2018, lxm_man@163.com All Rights Reserved.</pre> 
 */  
package com.jk.entity.user;

import java.util.Date;

/** 
 * <pre>项目名称：entity-02    
 * 类名称：FileDO    
 * 类描述：    
 * 创建人：刘业旺
 * 创建时间：2018年1月19日 下午5:21:01    
 * 修改人：刘业旺
 * 修改时间：2018年1月19日 下午5:21:01    
 * 修改备注：       
 * @version </pre>    
 */
public class FileDO {
	  private Long id;
	    // 文件类型
	    private Integer type;
	    // URL地址
	    private String url;
	    // 创建时间
	    private Date createDate;


	    public FileDO() {
	        super();
	    }


	    public FileDO(Integer type, String url, Date createDate) {
	        super();
	        this.type = type;
	        this.url = url;
	        this.createDate = createDate;
	    }


	    /**
	     * 设置：
	     */
	    public void setId(Long id) {
	        this.id = id;
	    }

	    /**
	     * 获取：
	     */
	    public Long getId() {
	        return id;
	    }

	    /**
	     * 设置：文件类型
	     */
	    public void setType(Integer type) {
	        this.type = type;
	    }

	    /**
	     * 获取：文件类型
	     */
	    public Integer getType() {
	        return type;
	    }

	    /**
	     * 设置：URL地址
	     */
	    public void setUrl(String url) {
	        this.url = url;
	    }

	    /**
	     * 获取：URL地址
	     */
	    public String getUrl() {
	        return url;
	    }

	    /**
	     * 设置：创建时间
	     */
	    public void setCreateDate(Date createDate) {
	        this.createDate = createDate;
	    }

	    /**
	     * 获取：创建时间
	     */
	    public Date getCreateDate() {
	        return createDate;
	    }

	    @Override
	    public String toString() {
	        return "FileDO{" +
	                "id=" + id +
	                ", type=" + type +
	                ", url='" + url + '\'' +
	                ", createDate=" + createDate +
	                '}';
	    }
}
