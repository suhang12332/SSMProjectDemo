package com.su.service;

import com.su.entity.Log;
import com.su.service.baseservice.BaseService;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/9/5 下午2:27
 */
public interface LogService extends BaseService<Log> {
    /**
     * description: 插入日志信息
     *
     * @param log 信息对象
     * @return int 返回操作的行数
     */
    @Override
    int insert(Log log);


    /**
     * description: 根据用户名查询日志信息
     *
     * @param userName 用户名
     * @param page 页数
     * @param size 每页的条数
     * @return java.util.List<com.su.entity.Log>
     */
    List<Log> findByUserName(String userName,int page, int size);

    /**
     * description: 查询所有的日志信息
     *
     * @param page 页数
     * @param size 每页的条数
     * @return java.util.List<com.su.entity.Log>
     */

    @Override
    List<Log> findAll(int page,int size);


    /**
     * description: 根据用户姓名删除用户的日志信息
     *
     * @param userName 用户姓名
     * @return int 返回操作的行数
     */
    int deleteByUserName(String userName);
}
