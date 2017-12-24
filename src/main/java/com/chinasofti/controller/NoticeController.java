package com.chinasofti.controller;

import com.chinasofti.pojo.Friend;
import com.chinasofti.pojo.Message;
import com.chinasofti.pojo.Register;
import com.chinasofti.service.NoticeService;
import com.chinasofti.util.JSONResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import javax.xml.ws.soap.Addressing;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;

/**
 * Created by Administrator on 2017/8/1.
 */
@Controller
@RequestMapping("notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    @RequestMapping(value = "apply",method = RequestMethod.GET)
    public String apply(Model model,HttpSession session){
        Register register = (Register)session.getAttribute("register");
        ArrayList<Friend> listFriend= noticeService.selectAllNonFriend(register.getUserName());
        model.addAttribute("listFriend",listFriend);
        return "notice/apply";
    }
    @RequestMapping(value = "message",method = RequestMethod.GET)
    public String message(HttpSession session,Model model){
        Register register = (Register)session.getAttribute("register");
        List<Message> messageList=noticeService.messageViewByReceiver(register.getUserName());
        model.addAttribute("messageList",messageList);
        return "notice/message";
    }
    @RequestMapping(value = "message_send",method = RequestMethod.GET)
    public String message_send(){
        return "notice/message_send";
    }
    @RequestMapping(value = "message_send",method = RequestMethod.POST)
    @ResponseBody
    public JSONResult message_send(Message message,HttpSession session){
        Register register = (Register)session.getAttribute("register");
        JSONResult jsonResult = new JSONResult();
        message.setSender(register.getUserName());
        long currentTimeMillis = System.currentTimeMillis();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm");
        String format = sdf.format(currentTimeMillis);
        message.setTime(format);
        int i =noticeService.insertMessageSendByUserName(message);
        if(i==1){
            jsonResult.setMsg("发送成功");
        }else{
            jsonResult.setMsg("发送失败");
        }
        return jsonResult;
    }

    @RequestMapping(value = "agree",method = RequestMethod.GET)
    public String agree(String userName,String friend){
        noticeService.agreeFriend(userName,friend);
        return "index";
    }

    @RequestMapping(value = "deny",method = RequestMethod.GET)
    public String deny(String userName,String friend){
        noticeService.denyFriend(userName,friend);
        return "index";
    }
}
