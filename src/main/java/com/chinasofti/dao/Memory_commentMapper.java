package com.chinasofti.dao;

import com.chinasofti.pojo.Memory_comment;

import java.util.List;

public interface Memory_commentMapper {
    int deleteByPrimaryKey(Integer memoryCommentId);

    int insert(Memory_comment record);

    int insertSelective(Memory_comment record);

    Memory_comment selectByPrimaryKey(Integer memoryCommentId);

    int updateByPrimaryKeySelective(Memory_comment record);

    int updateByPrimaryKey(Memory_comment record);

    List<Memory_comment> commentList(Integer memoryId);
}