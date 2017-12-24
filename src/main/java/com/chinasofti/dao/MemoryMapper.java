package com.chinasofti.dao;

import com.chinasofti.pojo.Memory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MemoryMapper {
    int deleteByPrimaryKey(Integer memoryId);

    public int insert(Memory record);

    int insertSelective(Memory record);

    Memory selectByPrimaryKey(Integer memoryId);

    int updateByPrimaryKeySelective(Memory record);

    int updateByPrimaryKey(Memory record);

    public List<Memory> selectAllMemeroy(@Param("userName") String userName);
    //查询旅游记忆
    public List selectMemeroyType();
    //根据旅游类型查询有关记录
    public List selectMemeroyByType(Object type);

    public List<Memory> selectAllMemeroyByType(@Param("dateNum")Integer dateNum,@Param("pageSize")Integer pageSize,@Param("type")String type);

    public List<Memory> selectAllMemeroyByNotes(@Param("dateNum")Integer dateNum,@Param("pageSize")Integer pageSize,@Param("memoryNotes") String memoryNotes);

    List<Memory> selectMemeroyByName(String userName);

    public int MemoryTotalCount(String type);

    public List<Memory> SearchMemoryTotalCount(@Param("memoryNotes") String memoryNotes);

   public List<Memory> memeroy_list1(@Param("dateNum")Integer dateNum,@Param("pageSize")Integer pageSize,@Param("userName") String userName);
}