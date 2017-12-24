package com.chinasofti.service;

import com.chinasofti.dao.*;
import com.chinasofti.exception.TipException;
import com.chinasofti.pojo.*;
import com.chinasofti.pojo.Memory;
import com.chinasofti.util.Page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.chinasofti.pojo.Dynamic;

import com.chinasofti.pojo.UserInfo;


/**
 * Created by Administrator on 2017/7/31.
 */
@Service
public class UserService {
     @Resource
    private MemoryMapper memoryMapper;
    @Resource
    private UserInfoMapper userInfoMapper;
    @Resource
    private DynamicMapper dynamicMapper;
    @Resource
    private FriendMapper friendMapper;
    @Resource
    private RegisterMapper registerMapper;
    @Resource
    private Travel_partnerMapper travel_partnerMapper;
    //添加发布记忆
    public int memeroy_add(Memory memory) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sf = sdf.format(date);
        memory.setTime(sf);
        memory.setCount(0);
        int i = memoryMapper.insert(memory);
        return i;
    }

    //显示全部记忆列表
    public List<Memory> memeroy_list(String userName) {
        return memoryMapper.selectAllMemeroy(userName);
    }

    //删除某一个记忆
    public int deleteMemeroy(Integer memoryId) {
        return memoryMapper.deleteByPrimaryKey(memoryId);
    }

    public UserInfo userinfo_view(String userName) {
        UserInfo userInfo = userInfoMapper.selectByUserName(userName);
        return userInfo;
    }

    public int updateUserInfo(UserInfo userInfo) {
        int change = userInfoMapper.updateByPrimaryKeySelective(userInfo);
        return change;
    }

    public List<Dynamic> state_view(String userName) {
        List<Dynamic> dynamicList = dynamicMapper.selectByUserName(userName);
        return dynamicList;
    }

    public int insertDynamic(Dynamic dynamic) {
        int i = dynamicMapper.insertSelective(dynamic);
        return i;
    }

    public int deleteDynamic(String dynamicId) {
        int dynamicId_int = Integer.parseInt(dynamicId);
        return dynamicMapper.deleteByPrimaryKey(dynamicId_int);
    }

    public List<Dynamic> state_friend_view(String userName) {
        List<Friend> friendList=friendMapper.selectByUserNameAndState(userName,1,5);
        ArrayList<Dynamic> dynamicList = new ArrayList<Dynamic>();
        for (int i=0;i<friendList.size();i++){
            List<Dynamic> dynamicList1 = dynamicMapper.selectByUserName(friendList.get(i).getFriendName());
            for(int l=0;l<dynamicList1.size();l++){
                dynamicList.add(dynamicList1.get(l));
            }
        }
        return dynamicList;
    }

    public List<Memory> memeroy_listByName(String userName) {
        return memoryMapper.selectMemeroyByName(userName);
    }

    public int password_change(Register register) {
        int i = registerMapper.updateByPrimaryKeySelective(register);
        return i;
    }



    public List<Travel_partner> travel_partnerListByName(String friendName) {
        List<Travel_partner> travel_partners = travel_partnerMapper.selectAllByName(friendName);
        return travel_partners;
    }

    public List<UserInfo> friendListPage(Page page, Register register) {
        int pageNow = (page.getPageNum() - 1) * page.getPageSize();
        List<Friend> friendList = friendMapper.selectByUserNameAndState(register.getUserName(),pageNow,page.getPageSize());
        int totalCountByUserName = friendMapper.selectTotalCountByUserName(register.getUserName());
        page.setTotalCount(totalCountByUserName);
        ArrayList<UserInfo> userInfoArrayList = new ArrayList<UserInfo>();
        for (int i=0;i<friendList.size();i++){
            UserInfo friendInfo = userInfoMapper.selectByUserName(friendList.get(i).getFriendName());
            userInfoArrayList.add(friendInfo);
        }
        return userInfoArrayList;
    }

    public UserInfo friend_search(String friendName) {
        Friend friend=friendMapper.selectFriendByFriendName(friendName);
        UserInfo userInfo = userInfoMapper.selectByUserName(friend.getFriendName());
        return userInfo;
    }
     public List<Memory> memeroy_list1(Integer pageNum, Integer pageSize, String userName) {
        Integer dateNum=(pageNum-1)*pageSize;
        List<Memory> memoryList=memoryMapper.memeroy_list1(dateNum,pageSize,userName);
        if(memoryList==null||memoryList.equals("")){
            throw  new TipException("该搜索为空!");
        }
        return memoryList;
    }
}
