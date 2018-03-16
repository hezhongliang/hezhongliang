import org.junit.Test;

import com.jk.util.user.FtpUtil;

/** 
 * <pre>项目名称:controller-02 
 * 文件名称:test.java 
 * 包名: 
 * 创建日期:2018年1月18日上午9:11:34 
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre> 
 */

/** 
 * <pre>项目名称：controller-02    
 * 类名称：test    
 * 类描述：    
 * 创建人：底兴美 983602927@qq.com    
 * 创建时间：2018年1月18日 上午9:11:34    
 * 修改人：底兴美 983602927@qq.com  
 * 修改时间：2018年1月18日 上午9:11:34    
 * 修改备注：       
 * @version </pre>    
 */
public class test {
    @Test  
    public void run() {  
          
        String ftpHost = "localhost";  
        String ftpUserName = "root";  
        String ftpPassword = "1228";  
        int ftpPort = 21;  
        String ftpPath = "ftpdir/";  
        String localPath = "D:/Users/ftp";  
        String fileName = "time.jpg";  
        FtpUtil.downloadFtpFile(ftpHost, ftpUserName, ftpPassword, ftpPort, ftpPath, localPath, fileName);  
    }  
  
}
