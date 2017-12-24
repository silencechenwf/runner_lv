package com.chinasofti.controller;

import com.chinasofti.pojo.Register;
import com.chinasofti.pojo.Travel_partner;
import com.chinasofti.service.TravelService;
import com.chinasofti.util.UUIDUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by Administrator on 2017/8/1.
 */
@Controller
@RequestMapping("traveller")
public class TravellerController {
    @Autowired
    TravelService travelService;
    //从首页点击结伴游，跳转到结伴游页面
    @RequestMapping(value = "traveller",method = RequestMethod.GET)
    public String traveller(Model model){
        try {
            List<Travel_partner> travel_partnerList =travelService.selectByTimeDesc();
            List<Travel_partner>travel_partnerList1=travelService.selectAllDesc();
            int size = travel_partnerList1.size();
            model.addAttribute("size",size);
            model.addAttribute("travel_partnerList",travel_partnerList);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg",e.getMessage());
        }
        return "traveller/traveller";
    }
    @RequestMapping(value = "traSearchMore",method = RequestMethod.GET)
    public String traSearchMore(Model model){
        try {
            List<Travel_partner> travel_partnerList = travelService.selectAllDesc();
            List<Travel_partner>travel_partnerList1=travelService.selectAllDesc();
            int size = travel_partnerList1.size();
            model.addAttribute("size",size);
            model.addAttribute("travel_partnerList",travel_partnerList);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg",e.getMessage());
        }
        return "traveller/travellerMany";
    }
//    @RequestMapping(value = "inputLogin" ,method = RequestMethod.GET)
//    public String inputLogin(){
//        return "login/loginTest";
//    }
    @RequestMapping(value = "travelAdd",method = RequestMethod.GET)
    public String travelAdd(String userName,HttpSession session){
        //session.setAttribute("userName",userName);
        return "user/travel_add";
    }
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String traveller_search(){
        return "traveller/traveller_search";
    }
    //发布结伴游信息
    @RequestMapping(value = "travelAdd",method = RequestMethod.POST)
    public String travelAdd(Travel_partner travel_partner, HttpSession session, @RequestParam("photoo")MultipartFile photo){
        try {
            String photoName= UUIDUtil.random()+new String(photo.getOriginalFilename().getBytes("iso8859-1"),"utf-8");
            FileUtils.copyInputStreamToFile(photo.getInputStream(),new File("D://"+photoName));
            travel_partner.setPhoto(photoName);
        } catch (Exception e) {
            e.printStackTrace();
        }
      //  String userName= (String) session.getAttribute("userName");
        Register register =(Register)session.getAttribute("register");
        travel_partner.setUserName(register.getUserName());
        travel_partner.setState(0);
        travelService.addTravel(travel_partner);
        return "index";
    }

    @RequestMapping(value = "inputTravel",method = RequestMethod.GET)
    public String inputTravel(){
        return "user/travel_add";
    }
   //根据时间查询的jsp页面
    @RequestMapping(value = "inputSearch",method = RequestMethod.GET)
    public String inputSearch(Model model){
        try {
            List<Travel_partner> travel_partnerList =travelService.selectByTimeDesc();
            model.addAttribute("travel_partnerList",travel_partnerList);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg",e.getMessage());
        }
        return "/traveller/traveller_search_byTime";
    }
    //根据目的地查询结伴游信息
    @RequestMapping(value = "searchTra",method = RequestMethod.POST)
    public String searchTra(String place, Model model){
        List<Travel_partner> travel_partnerList=null;
        try {
            travel_partnerList= travelService.searchTra(place);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg",e.getMessage());
        }
        model.addAttribute("travel_partnerList",travel_partnerList);
        return "/traveller/traveller_search";
    }
//展示结伴游的详情
    @RequestMapping(value = "traveller_detail",method = RequestMethod.GET)
    public String traveller_detail(Integer travelPartnerId,Model model){
        Travel_partner traveller=travelService.selectById(travelPartnerId);
        model.addAttribute("traveller",traveller);
        return "/traveller/traveller_detail";
    }
    //删除发布的旅游信息,然后跳转
    @RequestMapping(value = "deleTraveller",method = RequestMethod.GET)
    public String deleTraveller(Integer travelPartnerId){
        travelService.deleTraveller(travelPartnerId);

        return "forward:/user/travel_list";
    }
    @RequestMapping(value = "searchTraByTime",method = RequestMethod.POST)
    public String searchTraByTime(String time,Model model){
        List<Travel_partner> travel_partnerList=null;
        try {
            travel_partnerList=travelService.selectByTime(time);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg",e.getMessage());
        }
        model.addAttribute("travel_partnerList",travel_partnerList);
        return "/traveller/traveller_search";
    }

}
