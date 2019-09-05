package com.su.dao;

import com.su.dao.basedao.BaseDao;
import com.su.entity.Log;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/9/5 下午1:44
 */
@Repository
@Mapper
public interface LogDao extends BaseDao<Log> {
    /**
     * description: 插入日志信息
     *
     * @param log 信息对象
     * @return int 返回操作的行数
     */
    @Override
    @Insert("insert into log (visitTime, userName, ip, url, method)values (#{visitTime,jdbcType=TIMESTAMP}, #{userName}, #{ip}, #{url}, #{method})")
    int insert(Log log);

  /**
   * description: 根据用户名查询日志信息
   *
   * @param userName 用户名
   * @param page 页数
   * @param size 每页的条数
   * @return java.util.List<com.su.entity.Log>
   */
    @Select("select * from log where userName=#{userName}")
    List<Log> findByUserName(@Param("userName") String userName,int page, int size);


    /**
     * description: 查询所有的日志信息
     *
     * @param page 页数
     * @param size 每页的条数
     * @return java.util.List<com.su.entity.Log>
     */
    @Select("select * from log")
    @Override
    List<Log> findAll(int page,int size);

    /**
     * description: 根据用户姓名删除用户的日志信息
     *
     * @param userName 用户姓名
     * @return int 返回操作的行数
     */
    @Delete("delete from log where userName=#{userName}")
    int deleteByUserName(@Param("userName") String userName);
}
