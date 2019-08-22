package com.su.dao;

import com.su.dao.basedao.BaseDao;
import com.su.entity.OrdersAndTourist;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/22 下午8:50
 */
public interface OrdersAndTouristDao extends BaseDao<OrdersAndTourist> {
    /**
     * description: 游客与订单之间是多对多的关系,需要一张中间表,此表就是,根据ordersid查询toursitId
     *
     * @param id
     * @return java.util.List<com.su.entity.OrdersAndTourist>
     */
    @Results(id = "findById",value = {
            @Result(property = "orderTouristId", column = "orderTouristId", id = true),
            @Result(property = "orderId",column = "orderId",javaType = Integer.class),
            @Result(property = "tourist",column = "touristId",one =@One(select = "com.su.dao.TouristDao.findById",fetchType = FetchType.EAGER))
    })
    @Select("select * from orders_tourist where orderId=#{id}")
    List<OrdersAndTourist> findByOrdersId(Integer id);
}
