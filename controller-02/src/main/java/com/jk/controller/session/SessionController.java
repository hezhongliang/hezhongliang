package com.jk.controller.session;

import com.jk.entity.user.User;
import com.jk.entity.user.UserOnline;
import com.jk.service.online.OnlineService;
import com.jk.util.entity.UserDO;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Controller
@RequestMapping("online")
public class SessionController {

    @Autowired
    private SessionDAO sessionDAO;

    @Autowired
    private OnlineService onlineService;

    @RequestMapping("lists")
    String lists(){
        return "online/online";

    }

    /*deleteonline*/
    @ResponseBody
    @RequestMapping("forceLogout/{sessionId}")
    public Object forceLogout(@PathVariable("sessionId") String sessionId, RedirectAttributes redirectAttributes) {
        try {
            onlineService.forceLogout(sessionId);
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "2";
        }

    }


    @GetMapping("list")
    @ResponseBody
    List<UserOnline> list() {
        List<UserOnline> list = new ArrayList<>();
        Collection<Session> sessions = sessionDAO.getActiveSessions();
        for (Session session : sessions) {
            UserOnline userOnline = new UserOnline();
            if (session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY) == null) {
                continue;
            } else {
                SimplePrincipalCollection principalCollection = (SimplePrincipalCollection) session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
                UserDO userDO = (UserDO) principalCollection.getPrimaryPrincipal();
                userOnline.setUsername(userDO.getUsername());
            }
            userOnline.setId((String) session.getId());
            userOnline.setHost(session.getHost());
            userOnline.setStartTimestamp(session.getStartTimestamp());
            userOnline.setLastAccessTime(session.getLastAccessTime());
            userOnline.setTimeout(session.getTimeout());
            if(0 == session.getTimeout()){
                userOnline.setStatus("off_line");
            }
            list.add(userOnline);
        }
        return list;
    }

    private class UserResponse {
    }
}
