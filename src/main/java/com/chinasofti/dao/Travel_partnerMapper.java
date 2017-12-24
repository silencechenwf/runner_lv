package com.chinasofti.dao;

import com.chinasofti.pojo.Travel_partner;

import java.util.List;

public interface Travel_partnerMapper {
    int deleteByPrimaryKey(Integer travelPartnerId);

    int insert(Travel_partner record);

    int insertSelective(Travel_partner record);

    Travel_partner selectByPrimaryKey(Integer travelPartnerId);

    int updateByPrimaryKeySelective(Travel_partner record);

    int updateByPrimaryKey(Travel_partner record);

   public List<Travel_partner> selectByPlace(String place);

   public List<Travel_partner> selectByTime(String time);

    List<Travel_partner> selectByTimeDesc();

    List<Travel_partner> selectAllDesc();

    List<Travel_partner> selectAllByName(String userName);
}