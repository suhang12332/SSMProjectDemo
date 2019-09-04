package com.su.dao;
import com.su.dao.basedao.BaseDao;
import com.su.entity.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;
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
    @Results(id="findById",value = {
            @Result(property = "userId", column = "userId", id = true, javaType = Integer.class),
            @Result(property = "userEmail", column = "userEmail", javaType = String.class),
            @Result(property = "userName", column = "userName", javaType = String.class),
            @Result(property = "userPassword", column = "userPassword", javaType = String.class),
            @Result(property = "phoneNum", column = "phoneNum", javaType = String.class),
            @Result(property = "userPassword", column = "userPassword", javaType = String.class),
            @Result(property = "userSex", column = "userSex", javaType = String.class),
            @Result(property = "userStatus", column = "userStatus", javaType = Integer.class),
            @Result(property = "role", column = "userId", javaType = List.class,many = @Many(select = "com.su.dao.RoleDao.findRoleByUserId",fetchType = FetchType.EAGER))
    })
    @Select("select * from user where userId=#{id}")
    @ResultType(User.class)
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
    @Insert("insert into user (userEmail, userName, userPassword, phoneNum, userStatus,userSex) values (#{userEmail},#{userName},#{userPassword},#{phoneNum},#{userStatus},#{userSex})")
    int insert(User user);

    /**
     * description: 更新用户信息
     *
     * @param user 用户对象
     * @return int 返回操作的行数
     */

    @Override
    @Update("update user set userEmail=#{userEmail},userName=#{userName},userPassword=#{userPassword},phoneNum=#{phoneNum},userStatus=#{userStatus},userSex=#{userSex} where userId=#{userId}")
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
     * description: 根据查询用户信息,用于检测用户名是否重复
     *
     * @param userName 电话号码
     * @return java.util.List<com.su.entity.User>
     */
    @Select("select * from user where userName=#{userName}")
    List<User> selectByUserName(@Param("userName") String userName);
    /**
     * description: 根据用户姓名查询信息 用于登录
     *
     * @param userName 用户姓名
     * @return com.su.entity.User
     */
    @Select("select * from user where userName=#{userName}")
    User selectByName (@Param("userName") String userName);


    /**
     * description: 因为外键的原因,想要删除用户,必须先要删除中间表
     *
     * @param id 用户id
     * @return int 返回操作的行数
     */
    @Delete("delete from user_role where userId=#{id}")
    int deleteUserRoleById(@Param("id") Integer id);
}
