package com.chinasofti.service;

import com.chinasofti.dao.MemoryMapper;
import com.chinasofti.exception.TipException;
import com.chinasofti.pojo.Memory;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/1.
 */
@Service
public class MemeroyService {
    @Resource
    private MemoryMapper memoryMapper;

    //点开某旅游记忆的详情存储与转发详情页面
    public Memory memory_detail(Integer memoryId) {
        if (memoryId == null || memoryId.equals("")) {
            throw new TipException("请点开某一个你想了解的旅游记忆!");
        }
        return memoryMapper.selectByPrimaryKey(memoryId);
    }

    public Map memory() {
        Map memoryMap = new HashMap();
        //查询旅游记忆类型
        List<String> memoryTypeList = memoryMapper.selectMemeroyType();
        if (memoryTypeList == null || memoryTypeList.equals("")) {
            throw new TipException("无旅游记忆!!");
        }
        for (String type : memoryTypeList) {
            //根据类型查询有关的旅游记忆,在页面展示最多四条
            List<Memory> memoryListByType = memoryMapper.selectMemeroyByType(type);
            memoryMap.put(type, memoryListByType);
        }
        return memoryMap;
    }
//查出所有的记忆类别
    public List<String> typeList() {
      List<String> typeList=memoryMapper.selectMemeroyType();
        if(typeList==null||typeList.equals("")){
            throw  new TipException("无类别展示!");
        }
        return typeList;
    }
//根据类别展现出所有的有关记忆
    public List<Memory> memoryByType(Integer pageNum,Integer pageSize,String type) {
        Integer dateNum=(pageNum-1)*pageSize;
        List<Memory> memoryList=memoryMapper.selectAllMemeroyByType(dateNum,pageSize,type);
        if(memoryList==null||memoryList.equals("")){
            throw  new TipException("无有关页面展示!");
        }
        return memoryList;
    }

    public List<Memory> memory_search(Integer pageNum,Integer pageSize,String memoryNotes) {
        Integer dateNum=(pageNum-1)*pageSize;
        List<Memory> memoryList=memoryMapper.selectAllMemeroyByNotes(dateNum,pageSize,memoryNotes);
        if(memoryList==null||memoryList.equals("")){
            throw  new TipException("该搜索为空!");
        }
        return memoryList;
    }

    public int MemoryTotalCount(String type) {
        return memoryMapper.MemoryTotalCount(type);
    }

    public List<Memory> SearchMemoryTotalCount(String k) {
            return memoryMapper.SearchMemoryTotalCount(k);
    }
}
