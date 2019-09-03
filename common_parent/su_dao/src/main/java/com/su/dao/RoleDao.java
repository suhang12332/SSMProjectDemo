package com.su.dao;

import com.su.dao.basedao.BaseDao;
import com.su.entity.Role;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/9/2 下午5:58
 */
public interface RoleDao extends BaseDao<Role> {
    /**
     * description: 根据用户id查询角色信息
     *
     * @param id 用户id
     * @return java.util.List<com.su.entity.Role>
     */
    @Select("select * from role where roleId in (select roleId from user_role where userId=#{id})")
    List<Role>  findRoleByUserId(@Param("id") Integer id);
}
