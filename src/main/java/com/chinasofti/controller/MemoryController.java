package com.chinasofti.controller;

import com.chinasofti.pojo.Memory;
import com.chinasofti.pojo.Memory_comment;
import com.chinasofti.service.CommentService;
import com.chinasofti.service.MemeroyService;
import com.chinasofti.util.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/31.
 */
@Controller
@RequestMapping("mem")
public class MemoryController {
    @Resource
    private MemeroyService memeroyService;
    @Resource
    private CommentService commentService;
    //进入旅游记忆首页面
    @RequestMapping(value = "memory",method = RequestMethod.GET)
    public String memory(Model model){
        try{
            Map memoryMap=memeroyService.memory();
            model.addAttribute("memoryMap",memoryMap);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "memory/memory";
    }
    //点开某旅游记忆的详情存储与转发详情页面
    @RequestMapping(value = "memory_detail",method = RequestMethod.GET)
    public String memory_detail(Model model, Integer memoryId){
        try{
            Memory memory=memeroyService.memory_detail(memoryId);
            List<Memory_comment> commentList=commentService.commentList(memoryId);
            model.addAttribute("memory",memory);
            model.addAttribute("commentList",commentList);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "memory/memory_detail";
    }
    //进入查看某一类别的更多旅游记忆展示
    @RequestMapping(value = "memory_list/{pageNum}/{pageSize}",method = RequestMethod.GET)
    public String memory_list(@PathVariable Integer pageNum,@PathVariable Integer pageSize,String type, Model model){
        try{
            List<String> typeList=memeroyService.typeList();
            List<Memory> MemoryList=memeroyService.memoryByType(pageNum,pageSize,type);
            int memoryTotalCount=memeroyService.MemoryTotalCount(type);
            Page page=new Page(pageNum,pageSize,memoryTotalCount);
            int totalPage=page.getTotalPage();
            model.addAttribute("typeList",typeList);
            model.addAttribute("MemoryList",MemoryList);
            model.addAttribute("totalPage",totalPage);
            model.addAttribute("pageNum",pageNum);
            model.addAttribute("pageSize",pageSize);
            model.addAttribute("type",type);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "memory/memory_list";
    }
    //搜索旅游记忆
    @RequestMapping(value = "memory_search/{pageNum}/{pageSize}",method = RequestMethod.GET)
    public String memory_search(@PathVariable Integer pageNum,@PathVariable Integer pageSize,String k,Model model){
        try{
            List<Memory> memoryList=memeroyService.memory_search(pageNum,pageSize,k);
            List<Memory> searchMemory =memeroyService.SearchMemoryTotalCount(k);
            int memoryCount=searchMemory.size();
            Page page=new Page(pageNum,pageSize,memoryCount);
            int totalPage=page.getTotalPage();
            model.addAttribute("memoryList",memoryList);
            model.addAttribute("memoryCount",memoryCount);
            model.addAttribute("totalPage",totalPage);
            model.addAttribute("pageNum",pageNum);
            model.addAttribute("pageSize",pageSize);
            model.addAttribute("k",k);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "memory/memory_search";
    }

}
