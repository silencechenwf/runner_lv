package com.chinasofti.dao;

import com.chinasofti.pojo.Strategy;
import com.chinasofti.pojo.Vote;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface StrategyMapper {
    int deleteByPrimaryKey(Integer strategyId);

    int insert(Strategy record);

    int insertSelective(Strategy record);

    Strategy selectByPrimaryKey(Integer strategyId);

    int updateByPrimaryKeySelective(Strategy record);

    int updateByPrimaryKey(Strategy record);

    ArrayList<Strategy> selectByType(String type);

    ArrayList<String> selectAllType();

    Vote selectAllVote(Integer strategyId);

    void updateByEnjoy(@Param("strategyId") Integer strategyId,@Param("enjoy") Integer enjoy);

    void updateByGone();
}