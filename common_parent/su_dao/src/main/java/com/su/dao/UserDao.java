package com.su.dao;

import com.su.dao.basedao.BaseDao;
import com.su.entity.User;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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
 * @date 2019/8/26 下午8:22
 */
@Repository
@Mapper
public interface UserDao extends BaseDao<User> {
    /**
     * description: 查询所有的用户信息
     *
     * @param page 页数
     * @param size 每一页的条数
     * @return java.util.List<T>
     */
    @Override
    @Select("select * from user")
    List<User> findAll(int page, int size);

    /**
     * description: 根据id查询信息
     *
     * @param id 查询条件
     * @return T 返回的结果集
     */
    @Override
    @Select("select * from user where userId=#{id}")
    User findById(@Param("id") Integer id);

    /**
     * description: 根据id删除信息
     *
     * @param id 删除条件
     * @return int 返回影响的行数
     */
    @Override
    @Delete("delete from user where userId=#{id}")
    int deleteById(@Param("id") Integer id);

    /**
     * description: 插入信息
     *
     * @param user 信息对象
     * @return int 返回操作的行数
     */
    @Override
    @Insert("insert into user (userEmail, userName, userPassword, phoneNum, userStatus) values (#{userEmail},#{userName},#{userPassword},#{phoneNum},#{userStatus})")
    int insert(User user);

    /**
     * description: 更新用户信息
     *
     * @param user 用户对象
     * @return int 返回操作的行数
     */

    @Override
    @Update("update user set userEmail=#{userEmail},userName=#{userName},userPassword=#{userPassword},phoneNum=#{phoneNum},userStatus=#{userStatus} where userId=#{userId}")
    int update(User user);


    /**
     * description: 根据电话查询用户信息
     *
     * @param phoneNum 电话号码
     * @return java.util.List<com.su.entity.User>
     */
    @Select("select * from user where phoneNum=#{phoneNum}")
    List<User> selectByPhoneNum(@Param("phoneNum") String phoneNum);


    /**
     * description: 根据查询用户信息
     *
     * @param userName 电话号码
     * @return java.util.List<com.su.entity.User>
     */
    @Select("select * from user where userName=#{userName}")
    List<User> selectByUserName(@Param("userName") String userName);

}
