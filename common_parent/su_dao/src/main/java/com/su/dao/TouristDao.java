package com.su.dao;

import com.su.dao.basedao.BaseDao;
import com.su.entity.Tourist;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/18 下午1:28
 */
@Repository
@Mapper
public interface TouristDao extends BaseDao<Tourist> {
    /**
     * description: 查询所有的游客信息
     * @return java.util.List<com.su.entity.Tourist>
     */
    @Override
    @Select("select * from tourist")
    @ResultType(List.class)
    List<Tourist> findAll();


    /**
     * description: 插入游客信息
     *
     * @param tourist 游客信息引用
     * @return int 返回操作的行数
     */
    @Override
    @Insert("insert into tourist (passengerName, passengerSex, passengerPhoneNumber, credentialsType, credentialsNum, passengerType) values (#{passengerName},#{passengerSex},#{passengerPhoneNumber},#{credentialsType},#{credentialsNum},#{passengerType})")
    int insert(Tourist tourist);


    /**
     * description: 根据id删除游客信息
     *
     * @param id 删除条件
     * @return int 返回操作的行数
     */
    @Delete("delete from tourist where passengerId=#{id}")
    @Override
    int deleteById(@Param("id") Integer id);


    /**
     * description: 根据id查询游客信息
     *
     * @param id 查找条件
     * @return com.su.entity.Tourist 返回的结果集
     */
    @Select("select * from tourist where passengerId=#{id}")
    @ResultType(Tourist.class)
    @Override
    Tourist findById(Integer id);
    /**游客信息
     * description: 更新游客信息
     *
     * @param tourist 游客信息引用
     * @return int 返回操作的行数
     */
    @Override
    @Update("update tourist set passengerName=#{passengerName},passengerSex=#{passengerSex},passengerPhoneNumber=#{passengerPhoneNumber},credentialsType=#{credentialsType},credentialsNum=#{credentialsNum},passengerType=#{passengerType} where passengerId=#{passengerId}")
    int update(Tourist tourist);

    /**
     * description: 根据查询证件号码游客信息个数
     *
     * @param credentialsNum 证件号码
     * @return int 返回查询个数
     */
    @Select("select * from tourist where credentialsNum=#{credentialsNum}")
    List<Tourist> selectTouristByCredentialsNum(@Param("credentialsNum") String credentialsNum);

    /**
     * description: 根据电话查询游客信息个数
     *
     * @param phoneNumber 电话
     * @return int 返回查询个数
     */
    @Select("select * from tourist where passengerPhoneNumber=#{phoneNumber}")
    List<Tourist> selectTouristByPhoneNumber(@Param("phoneNumber") String phoneNumber);
}