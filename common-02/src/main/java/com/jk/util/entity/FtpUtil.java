/** 
 * <pre>项目名称:common-02 
 * 文件名称:FtpUtil.java 
 * 包名:cm.jk.util.user 
 * 创建日期:2018年1月18日上午9:17:40 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */
package com.jk.util.entity;

import java.io.File;    
import java.io.FileNotFoundException;    
import java.io.FileOutputStream;    
import java.io.IOException;    
import java.io.OutputStream;    
import java.net.SocketException;    
import java.util.Properties;  
import org.apache.log4j.Logger;  
import org.apache.commons.logging.Log;  
import org.apache.commons.logging.LogFactory;  
import org.apache.commons.net.ftp.*;  
/** 
 * <pre>项目名称：common-02    
 * 类名称：FtpUtil    
 * 类描述：    
 * 创建人：底兴美 983602927@qq.com    
 * 创建时间：2018年1月18日 上午9:17:40    
 * 修改人：底兴美 983602927@qq.com  
 * 修改时间：2018年1月18日 上午9:17:40    
 * 修改备注：       
 * @version </pre>    
 */
public class FtpUtil {
	 private final static Log logger = LogFactory.getLog(FtpUtil.class);  
	  
	    /** 
	     * 获取FTPClient对象 
	     * 
	     * @param ftpHost 
	     *            FTP主机服务器 
	     * @param ftpPassword 
	     *            FTP 登录密码 
	     * @param ftpUserName 
	     *            FTP登录用户名 
	     * @param ftpPort 
	     *            FTP端口 默认为21 
	     * @return 
	     */  
	    public static FTPClient getFTPClient(String ftpHost, String ftpUserName,  
	            String ftpPassword, int ftpPort) {  
	        FTPClient ftpClient = new FTPClient();  
	        try {  
	            ftpClient = new FTPClient();  
	            ftpClient.connect(ftpHost, ftpPort);// 连接FTP服务器  
	            ftpClient.login(ftpUserName, ftpPassword);// 登陆FTP服务器  
	            if (!FTPReply.isPositiveCompletion(ftpClient.getReplyCode())) {  
	                logger.info("未连接到FTP，用户名或密码错误。");  
	                ftpClient.disconnect();  
	            } else {  
	                logger.info("FTP连接成功。");  
	            }  
	        } catch (SocketException e) {  
	            e.printStackTrace();  
	            logger.info("FTP的IP地址可能错误，请正确配置。");  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	            logger.info("FTP的端口错误,请正确配置。");  
	        }  
	        return ftpClient;  
	    }  

	    /* 
	     * 从FTP服务器下载文件 
	     *  
	     * @param ftpHost FTP IP地址 
	     *  
	     * @param ftpUserName FTP 用户名 
	     *  
	     * @param ftpPassword FTP用户名密码 
	     *  
	     * @param ftpPort FTP端口 
	     *  
	     * @param ftpPath FTP服务器中文件所在路径 格式： ftptest/aa 
	     *  
	     * @param localPath 下载到本地的位置 格式：H:/download 
	     *  
	     * @param fileName 文件名称 
	     */  
	    public static void downloadFtpFile(String ftpHost, String ftpUserName,  
	            String ftpPassword, int ftpPort, String ftpPath, String localPath,  
	            String fileName) {  
	  
	        FTPClient ftpClient = null;  
	  
	        try {  
	            ftpClient = getFTPClient(ftpHost, ftpUserName, ftpPassword, ftpPort);  
	            ftpClient.setControlEncoding("UTF-8"); // 中文支持  
	            ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);  
	            ftpClient.enterLocalPassiveMode();  
	            ftpClient.changeWorkingDirectory(ftpPath);  
	  
	            File localFile = new File(localPath + File.separatorChar + fileName);  
	            OutputStream os = new FileOutputStream(localFile);  
	            ftpClient.retrieveFile(fileName, os);  
	            os.close();  
	            ftpClient.logout();  
	  
	        } catch (FileNotFoundException e) {  
	            logger.error("没有找到" + ftpPath + "文件");  
	            e.printStackTrace();  
	        } catch (SocketException e) {  
	            logger.error("连接FTP失败.");  
	            e.printStackTrace();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	            logger.error("文件读取错误。");  
	            e.printStackTrace();  
	        }  
	  
	    }  
	  
	  
	  
	
}
