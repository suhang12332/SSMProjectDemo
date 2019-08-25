package com.su.service;

import com.su.entity.Tourist;
import com.su.service.baseservice.BaseService;

import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/19 下午4:03
 */
public interface TouristService extends BaseService<Tourist> {
    /**
     * description: 根据证件号码查询游客信息
     *
     * @param credentialsNum 证件号码
     * @return java.util.List<com.su.entity.Tourist>
     */
    List<Tourist> selectTouristByCredentialsNum(String credentialsNum);

    /**
     * description: 根据电话号码查询游客信息
     *
     * @param phoneNumber 电话号码
     * @return java.util.List<com.su.entity.Tourist>
     */
    List<Tourist> selectTouristByPhoneNumber(String phoneNumber);



    /**
     * description: 查询所有的游客数量,不分页
     *
     * @return java.util.List<com.su.entity.Tourist>
     */
    @Select("select * from tourist")
    @ResultType(List.class)
    List<Tourist> findAllNoPage();
}
