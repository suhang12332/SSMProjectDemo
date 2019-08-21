package com.su.dao;

import com.su.dao.basedao.BaseDao;
import com.su.entity.Memberid;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/18 下午1:27
 */
@Repository
@Mapper
public interface MemberidDao extends BaseDao<Memberid> {
    /**
     * description: 根据id查询会员信息
     *
     * @param id 查询条件
     * @return com.su.entity.Memberid
     */
    @Override
    @Select("select * from memberid where memberidId=#{id}")
    @ResultType(Memberid.class)
    Memberid findById(@Param("id") Integer id);
    /**
     * description: 查询所有的会员信息
     * @return java.util.List<com.su.entity.Memberid>
     */
    @Override
    @Select("select * from memberid")
    List<Memberid> findAll();
}
