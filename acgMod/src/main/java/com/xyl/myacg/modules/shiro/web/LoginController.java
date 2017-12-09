package com.xyl.myacg.modules.shiro.web;

import com.xyl.myacg.modules.shiro.user.entity.User;
import com.xyl.myacg.modules.shiro.user.service.IUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by yyq on 2017/12/1.
 */
@Controller
public class LoginController {
    /***
     * 跳转到登录页面
     *
     * @return
     */
    @RequestMapping(value = "toLogin")
    public String toLogin() {
        // 跳转到/page/login.jsp页面
        return "shiro/login";
    }


    @RequestMapping(value = "login")
    public ModelAndView Login(User user) {
        ModelAndView mav = new ModelAndView();
        List<User> list= userService.findList(user);
        if (list.get(0) == null) {
            mav.setViewName("shiro/login");
            mav.addObject("msg", "用户不存在");
            return mav;
        }
        if (!list.get(0).getPassword().equals(user.getPassword())) {
            mav.setViewName("shiro/login");
            mav.addObject("msg", "账号密码错误");
            return mav;
        }
        SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());
        // 登录后存放进shiro token
        UsernamePasswordToken token = new UsernamePasswordToken(list.get(0).getUserName(), list.get(0).getPassword());
        Subject subject = SecurityUtils.getSubject();
        subject.login(token);
        // 登录成功后会跳转到successUrl配置的链接，不用管下面返回的链接。
        mav.setViewName("redirect:/");
        return mav;
    }

    // 处理用户业务类
    @Autowired
    private IUserService userService;
}
