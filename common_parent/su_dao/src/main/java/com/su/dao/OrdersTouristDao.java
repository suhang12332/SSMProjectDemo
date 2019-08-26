package com.su.dao;

import com.su.dao.basedao.BaseDao;
import com.su.entity.OrdersTourist;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/25 下午9:43
 */
@Repository
@Mapper
public interface OrdersTouristDao extends BaseDao<OrdersTourist> {
    /**
     * description: 因为订单表外键的原因,无法删除,先要删除外键,根据订单编号,删除中间表
     *
     * @param id 订单编号
     * @return int 返回操作的行数
     */
    @Override
    @Delete("delete from orders_tourist where orderId=#{id}")
    int deleteById(@Param("id") Integer id);
}
