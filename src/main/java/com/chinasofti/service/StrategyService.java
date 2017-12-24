package com.chinasofti.service;

import com.chinasofti.dao.StrategyMapper;
import com.chinasofti.pojo.Strategy;
import com.chinasofti.pojo.Vote;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;

/**
 * Created by Administrator on 2017/8/1.
 */
@Service
public class StrategyService {
    @Resource
    private StrategyMapper strategyMapper;
    public ArrayList<Strategy> selectByType(String type) {
        return strategyMapper.selectByType(type);
    }

    public Strategy selectByPrimaryKey(Integer strategyId) {
        return strategyMapper.selectByPrimaryKey(strategyId);
    }

    public ArrayList<String> selectAllType() {
        return strategyMapper.selectAllType();
    }

    public Vote selectAllVote(Integer strategyId) {
        return strategyMapper.selectAllVote(strategyId);
    }

    public void updateVote(Integer strategyId,Integer enjoy) {
//        if(type.equals("enjoy")){
            strategyMapper.updateByEnjoy(strategyId,enjoy);
//        }else {
//            strategyMapper.updateByGone();
        }
    }
//}
