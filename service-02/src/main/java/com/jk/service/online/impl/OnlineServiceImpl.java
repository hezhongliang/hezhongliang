package com.jk.service.online.impl;


import com.jk.service.online.OnlineService;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OnlineServiceImpl implements OnlineService {
   @Autowired
    private SessionDAO sessionDAO;
    @Override
    public boolean forceLogout(String sessionId) {
        Session session = sessionDAO.readSession(sessionId);
        session.setTimeout(0);
        return true;
    }

}
