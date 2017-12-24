package com.chinasofti.service;

import com.chinasofti.dao.FriendMapper;
import com.chinasofti.dao.MessageMapper;
import com.chinasofti.pojo.Friend;
import com.chinasofti.pojo.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/8/3.
 */
@Service
public class NoticeService {
    @Autowired
    private FriendMapper friendMapper;
    @Resource
    private MessageMapper messageMapper;
    public ArrayList<Friend> selectAllNonFriend(String userName) {
        return friendMapper.selectAllNonFriend(userName);
    }

    public void agreeFriend(String userName,String friend) {
        friendMapper.agreeFriend(userName,friend);
    }

    public void denyFriend(String userName, String friend) {
        friendMapper.denyFriend(userName,friend);
    }

    public List<Message> messageViewByReceiver(String receiver) {
        List<Message> messageList=messageMapper.selectByReceiver(receiver);
        return messageList;
    }



    public int insertMessageSendByUserName(Message message) {
        int i = messageMapper.insertSelective(message);
        return i;
    }
}
