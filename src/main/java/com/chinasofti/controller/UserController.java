package com.chinasofti.controller;

import com.chinasofti.pojo.*;
import com.chinasofti.service.UserService;
import com.chinasofti.util.Page;
import com.chinasofti.util.UUIDUtil;
import org.apache.commons.io.FileUtils;
import com.chinasofti.pojo.Dynamic;
import com.chinasofti.pojo.Register;
import com.chinasofti.pojo.Travel_partner;
import com.chinasofti.pojo.UserInfo;
import com.chinasofti.service.TravelService;
import com.chinasofti.util.JSONResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

/**
 * Created by Administrator on 2017/7/31.
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;
    @Autowired
    private TravelService travelService;

    //进入首页
    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    //进入发布记忆界面
    @RequestMapping(value = "memeroy_add", method = RequestMethod.GET)
    public String memeroy_add() {
        return "user/memeroy_add";
    }

    //进入全部记忆展示界面
//    @RequestMapping(value = "memeroy_list",method = RequestMethod.GET)
//    public String memeroy_list(){
//        return  "forward:memeroy_list";
//    }
    //处理添加发布记忆
    @RequestMapping(value = "memeroy_add", method = RequestMethod.POST)
    public String memeroy_add(Memory memory, @RequestParam("userPhoto") MultipartFile photo, Model model, HttpServletRequest request, HttpSession session) {
        try {
            String photoName = UUIDUtil.random() + photo.getOriginalFilename();
            FileUtils.copyInputStreamToFile(photo.getInputStream(), new File("D://nginx-1.12.1//nginx-1.12.1//html//" + photoName));
            memory.setPhoto(photoName);
            Register register = (Register) session.getAttribute("register");
            memory.setUserName(register.getUserName());
            int i = userService.memeroy_add(memory);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:memeroy_list/1/4";
    }

     //查询全部记忆
    @RequestMapping(value = "memeroy_list/{pageNum}/{pageSize}", method = RequestMethod.GET)
    public String memeroy_list(@PathVariable Integer pageNum,@PathVariable Integer pageSize,Model model,HttpSession session) {
        try {
            Register register = (Register) session.getAttribute("register");
            String userName=register.getUserName();
            List<Memory> memoryList =userService.memeroy_list(userName);
            int memoryCount=memoryList.size();
            Page page=new Page(pageNum,pageSize,memoryCount);
            int totalPage=page.getTotalPage();
            List<Memory> memoryList1 = userService.memeroy_list1(pageNum,pageSize,userName);
            model.addAttribute("memoryList1", memoryList1);
            model.addAttribute("memoryCount",memoryCount);
            model.addAttribute("totalPage",totalPage);
            model.addAttribute("pageNum",pageNum);
            model.addAttribute("pageSize",pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/memeroy_list";
    }

    //删除某一个记忆
    @RequestMapping(value = "deleteMemeroy", method = RequestMethod.GET)
    public String deleteMemeroy(Integer memoryId) {
        try {
            userService.deleteMemeroy(memoryId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:memeroy_list/1/4";
    }

    @RequestMapping(value = "acccount_detail", method = RequestMethod.GET)
    public String account_detail() {
        return "user/acccount_detail";
    }

    @RequestMapping(value = "message", method = RequestMethod.GET)
    public String message() {
        return "notice/message";
    }

    @RequestMapping(value = "apply", method = RequestMethod.GET)
    public String apply() {
        return "notice/apply";
    }

    @RequestMapping(value = "message_send", method = RequestMethod.GET)
    public String message_send() {
        return "notice/message_send";
    }



    @RequestMapping(value = "user_basic", method = RequestMethod.GET)
    public String user_basic(String friendName, Model model, HttpSession session) {
        session.setAttribute("friendName", friendName);
        UserInfo userInfo = userService.userinfo_view(friendName);
        model.addAttribute("userInfo", userInfo);
        return "friend/user_basic";
    }

    @RequestMapping(value = "user_memory", method = RequestMethod.GET)
    public String user_memory(Model model, HttpSession session) {
        String friendName = (String) session.getAttribute("friendName");
        if (friendName != null) {
            List<Memory> memoryInfo = userService.memeroy_listByName(friendName);
            model.addAttribute("memoryInfo", memoryInfo);
            return "friend/user_memory";
        } else {
            return "login/login";
        }
    }

    @RequestMapping(value = "user_partner", method = RequestMethod.GET)
    public String user_partner(Model model, HttpSession session) {
        String friendName = (String) session.getAttribute("friendName");
        if (friendName != null) {
            List<Travel_partner> travel_partnerInfo = userService.travel_partnerListByName(friendName);
            model.addAttribute("travel_partnerInfo", travel_partnerInfo);
            return "friend/user_partner";
        } else {
            return "login/login";
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @RequestMapping(value = "travel_add", method = RequestMethod.GET)
    public String travel_add() {
        return "user/travel_add";
    }

    @RequestMapping(value = "travel_list", method = RequestMethod.GET)
    public String travel_list(HttpSession session, Model model) {
        Register register = (Register) session.getAttribute("register");
        String userName = register.getUserName();
        try {
            List<Travel_partner> travellerList = travelService.selectAllByName(userName);
            model.addAttribute("travellerList", travellerList);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("msg", e.getMessage());
        }
        return "user/travel_list";
    }


    @RequestMapping(value = "password_change", method = RequestMethod.GET)
    public String password_change() {
        return "user/password_change";
    }

    @RequestMapping(value = "img_change", method = RequestMethod.GET)
    public String img_change() {

        return "user/img_change";
    }

    @RequestMapping(value = "userInfo_view", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult userInfo_view(HttpSession session) {
        JSONResult jsonResult = new JSONResult();
        Register register = (Register) session.getAttribute("register");
        UserInfo userInfo = userService.userinfo_view(register.getUserName());
        session.setAttribute("userInfo", userInfo);
        jsonResult.setResult(userInfo);
        jsonResult.setSuccess(true);
        return jsonResult;
    }

    @RequestMapping(value = "userInfo_change", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult userInfo_change(UserInfo userInfo, HttpSession session) {
        JSONResult jsonResult = new JSONResult();
        UserInfo user = (UserInfo) session.getAttribute("userInfo");
        userInfo.setUserName(user.getUserName());
        userInfo.setUserId(user.getUserId());
        int change = userService.updateUserInfo(userInfo);
        if (change == 1) {
            session.setAttribute("userInfo",userInfo);
            jsonResult.setResult(userInfo);
            jsonResult.setSuccess(true);
            jsonResult.setMsg("修改成功");
        }
        return jsonResult;
    }
    @RequestMapping(value = "state", method = RequestMethod.GET)
    public ModelAndView state(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        Register register = (Register) session.getAttribute("register");
        if (register != null) {
            List<Dynamic> dynamicList = userService.state_view(register.getUserName());
            modelAndView.addObject("dynamicList", dynamicList);
            modelAndView.setViewName("user/state");
        } else {
            modelAndView.setViewName("login/login");
        }
        return modelAndView;
    }

    @RequestMapping(value = "state_friend", method = RequestMethod.GET)
    public String state_friend(HttpSession session, Model model) {
        Register register = (Register) session.getAttribute("register");
        if (register != null) {
            List<Dynamic> list = userService.state_friend_view(register.getUserName());
            model.addAttribute("friend_dynamicList", list);
            return "user/state_friend";
        } else {
            return "login/login";
        }
    }

    @RequestMapping(value = "state_send", method = RequestMethod.POST)
    public String state_send(Dynamic dynamic, HttpSession session, Model model) {
        Register register = (Register) session.getAttribute("register");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = simpleDateFormat.format(System.currentTimeMillis());
        dynamic.setUserName(register.getUserName());
        dynamic.setTime(format);
        int change = userService.insertDynamic(dynamic);
        if (change == 1) {
            model.addAttribute("msn", "发布成功");
        }
        return "redirect:state";
    }

    @RequestMapping(value = "deleteState", method = RequestMethod.GET)
    public String deleteState(String dynamicId, Model model) {
        int change = userService.deleteDynamic(dynamicId);
        if (change == 1) {
            model.addAttribute("msn", "删除成功");
        }
        return "redirect:state";
    }

    @RequestMapping(value = "password_change", method = RequestMethod.POST)
    public ModelAndView password_change(String oldpassword, String newpassword, HttpSession session) {
        Register register = (Register) session.getAttribute("register");
        ModelAndView modelAndView = new ModelAndView();
        if (register.getUserPass().equals(oldpassword)) {
            register.setUserPass(newpassword);
            int i = userService.password_change(register);
            if (i == 1) {
                modelAndView.addObject("msg", "修改成功");
                modelAndView.setViewName("login/login");
                return modelAndView;
            } else {
                modelAndView.addObject("msg", "修改失败,请重试");
            }
        } else {
            modelAndView.addObject("msg", "密码不正确,请重试");
        }
        modelAndView.setViewName("user/password_change");
        return modelAndView;
    }

    @RequestMapping(value = "img_change", method = RequestMethod.POST)
    public ModelAndView img_change(HttpSession session, @RequestParam("photo") MultipartFile photo) {
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        ModelAndView modelAndView = new ModelAndView();
        try {
            String photoName = UUIDUtil.random() + new String(photo.getOriginalFilename().getBytes("iso8859-1"), "utf-8");
            FileUtils.copyInputStreamToFile(photo.getInputStream(), new File("D://" + photoName));
            userInfo.setPhoto(photoName);
            int i = userService.updateUserInfo(userInfo);
            if (i == 1) {
                session.setAttribute("userInfo", userInfo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        modelAndView.setViewName("user/img_change");
        return modelAndView;
    }

    @RequestMapping("friend/{pageNum}/{pageSize}")
    public String friendList(@PathVariable Integer pageNum, @PathVariable Integer pageSize, HttpSession session, Model model) {
        Page page = new Page(pageNum, pageSize);
        Register register = (Register) session.getAttribute("register");
        if (register!=null){
        List<UserInfo> userInfoList = userService.friendListPage(page, register);
        model.addAttribute("friendInfoList", userInfoList);
        model.addAttribute("page", page);
        return "user/friend";
        }else{
            return "login/login";
        }
    }

    @RequestMapping("friend_search")
    public String friend_search(String friendName, Model model) {
        if (friendName != "") {
            UserInfo userInfo = userService.friend_search(friendName);
            model.addAttribute("friendInfo", userInfo);
            return "user/friend_search";
        } else {
            return "forward:friend/1/4";
        }
    }
}

