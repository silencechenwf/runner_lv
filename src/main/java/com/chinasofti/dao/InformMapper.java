package com.chinasofti.dao;

import com.chinasofti.pojo.Inform;

public interface InformMapper {
    int deleteByPrimaryKey(Integer informId);

    int insert(Inform record);

    int insertSelective(Inform record);

    Inform selectByPrimaryKey(Integer informId);

    int updateByPrimaryKeySelective(Inform record);

    int updateByPrimaryKey(Inform record);
}