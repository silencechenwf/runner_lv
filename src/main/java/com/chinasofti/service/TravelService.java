package com.chinasofti.service;

import com.chinasofti.dao.Travel_partnerMapper;
import com.chinasofti.exception.TipException;
import com.chinasofti.pojo.Travel_partner;
import com.chinasofti.util.CompareTime;
import com.chinasofti.util.ConvertTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/8/1.
 */
@Service
public class TravelService {
    @Autowired
   private Travel_partnerMapper travel_partnerMapper;

    public void addTravel(Travel_partner travel_partner) {
        if (travel_partner.getTitle()==null||travel_partner.getTitle().equals("")){
            throw new TipException("发布的结伴游标题不能为空");
        }
        if(travel_partner.getPlace()==null||travel_partner.getPlace().equals("")){
            throw new TipException("目的地不能为空！");
        }
        if(travel_partner.getStartTime()==null||travel_partner.getStartTime().equals("")){
            throw new TipException("出发时间不能为空");
        }
        if (travel_partner.getReturnTime()==null||travel_partner.getReturnTime().equals("")){
            throw new TipException("返回时间不能为空");
        }
        if (travel_partner.getContact()==null||travel_partner.getContact().equals("")){
            throw new TipException("注意，联系方式不能为空！");
        }
        if (travel_partner.getContact().length()!=11){
            throw new TipException("手机号码必须是11位");
        }
        if (travel_partner.getContent()==null||travel_partner.getContent().equals("")){
            throw new TipException("发布的内容不能为空");
        }
        if (travel_partner.getPhoto()==null||travel_partner.getPhoto().equals("")){
            throw new TipException("景点照片不能为空");
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = sdf.format(new Date());
//        travel_partner.setStartTime(sdf.format(travel_partner.getStartTime()));
//        travel_partner.setReturnTime(sdf.format(travel_partner.getReturnTime()));
        System.out.println(format);
        if(CompareTime.compTwoStr(format,travel_partner.getStartTime())){
            throw new TipException("旅游开始时间已是过去，请输入将来的某一天");
        }
        travel_partner.setTime(format);
        travel_partnerMapper.insert(travel_partner);
    }

    public List<Travel_partner> searchTra(String place) {
        List<Travel_partner> travel_partnerList = travel_partnerMapper.selectByPlace(place);
        if (travel_partnerList==null){
            throw new TipException("没有符合的结伴游信息发布！");
        }
        //日期格式由数字改成日期格式
        for(Travel_partner var :travel_partnerList){
            //封装成一个工具类进行转换
            var.setStartTime(ConvertTime.convertTime(var.getStartTime()));
            var.setReturnTime(ConvertTime.convertTime(var.getReturnTime()));
//            String year=var.getStartTime().substring(0,4);
//            String month=var.getStartTime().substring(5,7);
//            String day=var.getStartTime().substring(8,10);
//            var.setStartTime(year+"年"+month+"月"+day+"日");
//            String year1=var.getReturnTime().substring(0,4);
//            String month1=var.getReturnTime().substring(5,7);
//            String day1=var.getReturnTime().substring(8,10);
//            var.setReturnTime(year1+"年"+month1+"月"+day1+"日");
        }
        return travel_partnerList;
    }

    public Travel_partner selectById(Integer travelPartnerId) {
        Travel_partner travel_partner = travel_partnerMapper.selectByPrimaryKey(travelPartnerId);
        if (travel_partner==null||travel_partner.equals("")){
            throw new TipException("刷新页面，请重新查询相关信息！");
        }
        travel_partner.setStartTime(ConvertTime.convertTime(travel_partner.getStartTime()));
        travel_partner.setReturnTime(ConvertTime.convertTime(travel_partner.getReturnTime()));
        return travel_partner;
    }

    public List<Travel_partner> selectByTime(String time) {

        List<Travel_partner> travel_partnerList=travel_partnerMapper.selectByTime(time);
        if (travel_partnerList==null||travel_partnerList.isEmpty()){
            throw new TipException("没有符合时间的结伴游信息");
        }
        return travel_partnerList;
    }

    public List<Travel_partner> selectByTimeDesc() {
        List<Travel_partner> travel_partnerList=travel_partnerMapper.selectByTimeDesc();
        if (travel_partnerList==null||travel_partnerList.isEmpty()){
            throw new TipException("没有搜索到相关结伴游帖子，请刷新重新查询！");
        }
        for (Travel_partner trav:travel_partnerList) {
            trav.setStartTime(ConvertTime.convertTime(trav.getStartTime()));
            trav.setReturnTime(ConvertTime.convertTime(trav.getReturnTime()));
        }
        return travel_partnerList;
    }

    public List<Travel_partner> selectAllDesc() {
        List<Travel_partner> travel_partnerList=travel_partnerMapper.selectAllDesc();
        if (travel_partnerList==null||travel_partnerList.isEmpty()){
            throw new TipException("没有查询到结伴游信息，重新查询！");
        }
        for (Travel_partner trav:travel_partnerList) {
            trav.setStartTime(ConvertTime.convertTime(trav.getStartTime()));
            trav.setReturnTime(ConvertTime.convertTime(trav.getReturnTime()));
        }
        return travel_partnerList;
    }

    public List<Travel_partner> selectAllByName(String userName) {
        List<Travel_partner> travellerList=travel_partnerMapper.selectAllByName(userName);
        if (travellerList==null||travellerList.isEmpty()){
            throw new TipException("没有个人发布的结伴游信息！");
        }
        for (Travel_partner trav:travellerList) {
            trav.setStartTime(ConvertTime.convertTime(trav.getStartTime()));
            trav.setReturnTime(ConvertTime.convertTime(trav.getReturnTime()));
        }
        return travellerList;
    }

    public void deleTraveller(Integer travelPartnerId) {
        travel_partnerMapper.deleteByPrimaryKey(travelPartnerId);
    }
}
