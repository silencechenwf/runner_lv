package com.chinasofti.service;

import com.chinasofti.dao.*;
import com.chinasofti.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * Created by Administrator on 2017/8/1.
 */
@Service
public class LoginService {
    @Autowired
    private RegisterMapper registerMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Resource
    private JavaMailSenderImpl mailSender;

    public int email(Register register) {
        int i = registerMapper.updateByPrimaryKeySelective(register);
        return i;
    }
    @Transactional
    public String register(Register register) {
        register.setState(0);
        if (register.getEmail() != "" && register.getUserName() != "" && register.getUserPass() != "") {
            int insert = registerMapper.insert(register);
            if (insert > 0) {
//                //给个人信息表里面添加user_name
//                userInfoMapper.insertUserNameToUserInfo(register.getUserName());
                Register register1 = registerMapper.checkUserName(register.getUserName());
                MimeMessage mimeMessage = mailSender.createMimeMessage();
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, "UTF-8");
                String html = "<html><head><META http-equiv=Content-Type content='text/html; charset=UTF-8'><title>驴友网注册激活</title></head><body>欢迎使用，驴友网。<br/><a href='http://localhost:8082/login/email?registerId=" + register1.getRegisterId() + "' target='_blank'>激活链接</a><br>点击上面超链接 激活账户信息！</body><html>";
                try {
                    messageHelper.setFrom(mailSender.getUsername());
                    messageHelper.setTo(register.getEmail());
                    messageHelper.setSubject("激活账户");
                    messageHelper.setText(html, true);
                } catch (MessagingException e) {
                    e.printStackTrace();
                    System.out.println("发送失败");
                }
                // 发送邮件
                mailSender.send(mimeMessage);
                return "注册成功";
            }
            return "注册失败";
        } else {
            return "注册失败,所填数据不完整";
        }
    }

    public Register loginByUserNameAndUserPass(Register register) {
        Register login = null;
        if (register.getUserName() != "" && register.getUserPass() != "") {
            login = registerMapper.loginByUserNameAndUserPass(register);
        }
        return login;
    }

    public Register checkUserName(String userName) {
        Register register = registerMapper.checkUserName(userName);
        return register;
    }

    public Register checkEmail(String email) {
        Register register = registerMapper.checkEmail(email);
        return register;
    }
}
