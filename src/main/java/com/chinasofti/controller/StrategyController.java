package com.chinasofti.controller;

import com.chinasofti.pojo.Strategy;
import com.chinasofti.pojo.Vote;
import com.chinasofti.service.StrategyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;

/**
 * Created by Administrator on 2017/8/1.
 */
@Controller
@RequestMapping("strategy")
public class StrategyController {
    @Resource
    private StrategyService strategyService;
    @RequestMapping(value = "strategy", method = RequestMethod.GET)
    public String strategy(Model model) {
        ArrayList<Strategy>timeList=strategyService.selectByType("时令游");
        ArrayList<Strategy> titleList = strategyService.selectByType("主题游");
        model.addAttribute("timeList",timeList);
        model.addAttribute("titleList",titleList);
        return "strategy/strategy";
    }

    @RequestMapping(value = "strategy_detail", method = RequestMethod.GET)
    public ModelAndView selectByTitle(Integer strategyId, ModelAndView mv) {
        Strategy strategy=strategyService.selectByPrimaryKey(strategyId);
        mv.addObject("strategy",strategy);
        Vote vote=strategyService.selectAllVote(strategyId);
        mv.addObject("vote",vote);
        mv.setViewName("strategy/strategy_detail");
        return mv;
    }
    @RequestMapping("enjoy")
    public String vote(Integer strategyId,Integer enjoy,Model model){
       strategyService.updateVote(strategyId,enjoy+1);
       model.addAttribute("strategyId",strategyId);
        return "forword:strategy/strategy_detail";
    }
}
