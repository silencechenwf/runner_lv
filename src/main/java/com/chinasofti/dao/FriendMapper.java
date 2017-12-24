package com.chinasofti.dao;

import com.chinasofti.pojo.Friend;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

import java.util.List;

public interface FriendMapper {
    int deleteByPrimaryKey(Integer friendId);

    int insert(Friend record);

    int insertSelective(Friend record);

    Friend selectByPrimaryKey(Integer friendId);

    int updateByPrimaryKeySelective(Friend record);

    int updateByPrimaryKey(Friend record);

    List<Friend> selectByUserNameAndState(@Param("userName") String userName,@Param("pageNum")Integer pageNum,@Param("pageSize")Integer pageSize);

    int selectTotalCountByUserName(String userName);

    ArrayList<Friend> selectAllNonFriend(String userName);

    void agreeFriend(@Param("userName") String userName,@Param("friend") String friend);

    void denyFriend(@Param("userName") String userName,@Param("friend") String friend);

    Friend selectFriendByFriendName(String friendName);
}