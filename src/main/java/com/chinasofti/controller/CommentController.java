package com.chinasofti.controller;

import com.chinasofti.pojo.Memory_comment;
import com.chinasofti.pojo.Register;
import com.chinasofti.service.CommentService;
import com.chinasofti.util.JSONResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/8/2.
 */
@Controller
@RequestMapping("comment")
public class CommentController {
    @Resource
   private CommentService commentService;
    //处理对旅游记忆评论,存储
    @ResponseBody
    @RequestMapping(value = "addComment",method = RequestMethod.POST)
    public JSONResult addComment(String memoryId, String commented, String content,HttpSession session){
        JSONResult jsonResult=new JSONResult();
        try{
            Integer memoryId1= Integer.parseInt(memoryId);
            Memory_comment memory_comment=new Memory_comment();
            memory_comment.setMemoryId(memoryId1);
            memory_comment.setContent(content);
            Register register=(Register)session.getAttribute("register");
            memory_comment.setCommentator(register.getUserName());
            memory_comment.setCommented(commented);
            jsonResult.setResult(commentService.addComment(memory_comment));
        }catch (Exception e) {
            jsonResult.setMsg("出错!");
            jsonResult.setSuccess(false);
        }
        return jsonResult;
     }
 }

