package com.jk.controller;

import com.jk.entity.user.R;
import com.jk.util.common.MD5Utils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @GetMapping("toLoginPage")
    String toLoginPage() {
        return "login";
    }

    @PostMapping("login")
    @ResponseBody
    R login(String username, String password,String auth,HttpSession session) {
     /*   Map<String, Object> map = new HashMap<>();
        password = MD5Utils.encrypt(username, password);
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            //获取用户登陆成功后的信息
            UserDO userResponse = (UserDO) subject.getPrincipal();
            map.put("code", 0);
            map.put("msg", "登录成功");
        } catch (AuthenticationException e) {
            map.put("code", 1);
            map.put("msg", "用户名或密码错误");
        }
        return map;*/
        //从session里面拿出来的验证码数据
        String authImage = (String) session.getAttribute("rand");
        //用户输入的验证码数据进行比对
        if (authImage.equals(auth)) {
            password = MD5Utils.encrypt(username, password);
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            Subject subject = SecurityUtils.getSubject();
            try {
                subject.login(token);
                return R.ok();
            } catch (AuthenticationException e) {
                return R.error("用户或密码错误");
            }
        }

        return R.error("验证码错误");
    }
}
