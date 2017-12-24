package com.chinasofti.controller;

import com.chinasofti.pojo.Register;
import com.chinasofti.pojo.UserInfo;
import com.chinasofti.service.LoginService;
import com.chinasofti.service.UserService;
import com.chinasofti.util.JSONResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/8/1.
 */
@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private UserService userService;
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return "login/login";
    }

    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String register() {
        return "login/register";
    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public ModelAndView register(Register register) {
        String msg = loginService.register(register);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login/login");
        modelAndView.addObject("msg", msg);
        return modelAndView;
    }
    //邮件注册激活链接
    @RequestMapping("email")
    public String email(Integer registerId, Model model){
        Register register = new Register();
        register.setState(1);
        register.setRegisterId(registerId);
        int email = loginService.email(register);
        if (email==1){
            model.addAttribute("msg","验证成功,请登录");
        }else{
            model.addAttribute("msg","验证失败");
        }

        return "redirect:login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public ModelAndView loginByUserNameAndUserPass(Register register, HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        String msg;
        Register login = loginService.loginByUserNameAndUserPass(register);
        session.setAttribute("register", login);
        if (login != null) {
            if (login.getState() == 0) {
                modelAndView.setViewName("login/login");
                msg = "帐号未激活";
                modelAndView.addObject("msg", msg);
                return modelAndView;
            }
            UserInfo userInfo = userService.userinfo_view(login.getUserName());
            session.setAttribute("userInfo",userInfo);
            modelAndView.setViewName("index");
            msg = "登录成功";
        } else {
            modelAndView.setViewName("login/login");
            msg = "用户名密码错误";
        }
        modelAndView.addObject("msg", msg);
        return modelAndView;
    }

    //用户名存在校验
    @RequestMapping(value = "checkUserName", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult checkUserName(String data) {
        JSONResult jsonResult = new JSONResult();
        Register register = loginService.checkUserName(data);
        if (register != null) {
            jsonResult.setMsg("用户已存在");
            jsonResult.setSuccess(false);
        } else {
            jsonResult.setMsg("用户名可以使用");
            jsonResult.setSuccess(true);
        }
        return jsonResult;
    }

    @RequestMapping(value = "checkEmail", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult checkEmail(String data) {
        JSONResult jsonResult = new JSONResult();
        Register register = loginService.checkEmail(data);
        if (register != null) {
            jsonResult.setMsg("邮箱已使用,请重新输入");
            jsonResult.setSuccess(false);
        } else {
            jsonResult.setMsg("邮箱可以使用");
            jsonResult.setSuccess(true);
        }
        return jsonResult;
    }
}
