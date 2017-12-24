package com.chinasofti.service;

import com.chinasofti.dao.Memory_commentMapper;
import com.chinasofti.exception.TipException;
import com.chinasofti.pojo.Memory_comment;
import com.chinasofti.util.UUIDUtil;
import jdk.nashorn.internal.ir.annotations.Reference;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/8/2.
 */
@Service
public class CommentService {
    @Resource
   private Memory_commentMapper memory_commentMapper;
    @Resource
    private CommentService commentService;
    public Object addComment(Memory_comment memory_comment) {
        if(memory_comment.getMemoryId()==null||memory_comment.getMemoryId().equals("")){
            throw new TipException("请选中自己感兴趣的旅游记忆进行详看哟!");
        }
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sf=sdf.format(date);
        memory_comment.setTime(sf);
        memory_commentMapper.insert(memory_comment);
       return commentService.commentList(memory_comment.getMemoryId());
    }

    public List<Memory_comment> commentList(Integer memoryId) {
        List<Memory_comment> commentList=memory_commentMapper.commentList(memoryId);
        if(commentList==null||commentList.equals("")){
            throw new TipException("该条旅游记忆暂无评论!");
        }
        return commentList;
    }
}
