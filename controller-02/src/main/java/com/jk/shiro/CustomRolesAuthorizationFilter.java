
package com.jk.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;


public class CustomRolesAuthorizationFilter extends AuthorizationFilter {

	/* (non-Javadoc)    
	 * @see org.apache.shiro.web.filter.AccessControlFilter#isAccessAllowed(javax.servlet.ServletRequest, javax.servlet.ServletResponse, java.lang.Object)    
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest arg0, ServletResponse arg1, Object arg2) throws Exception {
		Subject subject = getSubject(arg0, arg1);    
        String[] rolesArray = (String[]) arg2;    
        if (null == rolesArray || rolesArray.length == 0) { //没有角色限制，有权限访问
            return true;    
        } else {
        	for (int i = 0; i < rolesArray.length; i++) {
                if (subject.hasRole(rolesArray[i])) {
                	//若当前用户是rolesArray中的任何一个，则有权限访问
                    return true;
                }
            }
        }
        return false;
	}

}
