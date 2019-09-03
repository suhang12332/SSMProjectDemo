package com.su.service;

import com.su.entity.User;
import com.su.service.baseservice.BaseService;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/26 下午8:24
 */
public interface UserService extends BaseService<User> {
    /**
     * description: 查询所有的用户信息
     *
     * @param page 页数
     * @param size 每一页的条数
     * @return java.util.List<T>
     */
    @Override
    List<User> findAll(int page, int size);

    /**
     * description: 插入用户信息
     *
     * @param user 用户信息引用
     * @return int 返回操作的行数
     */
    @Override
    int insert(User user);


    /**
     * description: 根据电话查询用户信息
     *
     * @param phoneNum 电话号码
     * @return java.util.List<com.su.entity.User>
     */
    List<User> selectByPhoneNum(String phoneNum);



    /**
     * description: 根据查询用户信息
     *
     * @param userName 电话号码
     * @return java.util.List<com.su.entity.User>
     */
    List<User> selectByUserName(String userName);


    /**
     * description: 根据用户id删除用户信息
     *
     * @param id 用户id
     * @return int 操作的行数
     */
    @Override
    int deleteById(Integer id);

    /**
     * description: 根据用户id查寻用户信息
     *
     * @param id 用户id
     * @return com.su.entity.User
     */
    @Override
    User findById(Integer id);


    /**
     * description: 更新用户信息
     *
     * @param user 用户信息
     * @return int
     */
    @Override
    int update(User user);

    /**
     * description: 用户登录模块
     *
     * @param user 用户信息
     * @return int
     */
    Boolean isLogin(User user);


    User findUserByName(User user);
}
