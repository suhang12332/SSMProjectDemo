package com.su.dao;

import com.su.dao.basedao.BaseDao;
import com.su.entity.Orders;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Min;

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
public interface OrdersDao extends BaseDao<Orders> {
    /**
     * description: 查找所有的订单信息
     *
     * @param page 页数
     * @param size 每一页的条数
     * @return java.util.List<com.su.entity.Orders>
     */
    @Override
    @Results(id="findAll",value = {
            @Result(property = "orderId", column = "orderId", id = true, javaType = Integer.class),
            @Result(property = "orderTime", column = "orderTime", javaType = Date.class),
            @Result(property = "peopleCount", column = "peopleCount", javaType = Integer.class),
            @Result(property = "orderDesc", column = "orderDesc", javaType = String.class),
            @Result(property = "payType", column = "payType", javaType = Integer.class),
            @Result(property = "orderStatus", column = "orderStatus", javaType = Integer.class),
            @Result(property = "product",column = "productId",javaType = com.su.entity.Product.class,one=@One(select = "com.su.dao.ProductDao.findById",fetchType = FetchType.EAGER)),
            @Result(property = "memberid", column = "memberidId", javaType = com.su.entity.Memberid.class, one = @One(select = "com.su.dao.MemberidDao.findById", fetchType = FetchType.EAGER)),
            @Result(property = "tourists" ,column = "orderId",javaType = java.util.List.class,many =@Many(select = "com.su.dao.TouristDao.findTouristByOrdersId",fetchType = FetchType.EAGER))
    })
    @Select("select * from orders")
    List<Orders> findAll(int page,int size);

    /**
     * description: 因为删除一个产品时候的外键因素,所以先要删除订单表中的产品id
     *
     * @param id
     * @return int
     */
    @Override
    @Delete("delete from orders where productId=#{id}")
    int deleteById(@Param("id") Integer id);


    /**
     * description: 增加一个订单
     *
     * @param orders 订单对象
     * @return int 操作的行数
     */
    @Override
    @Insert("insert into orders (orderTime, peopleCount, orderDesc, payType, orderStatus, productId, memberidId) values (#{orderTime,jdbcType=TIMESTAMP},#{peopleCount},#{orderDesc},#{payType},#{orderStatus},#{product.productId},#{memberid.memberidId})")
    int insert(Orders orders);


    /**
     * description: 根据id删除一条订单信息
     *
     * @param id 删除条件
     * @return int 返回操作的行数
     */
    @Delete("delete from orders where orderId=#{id}")
    int deleteOrdersById(@Param("id") Integer id);


    /**
     * description: 根据订单id查询订单信息 ,@ResultMap("findAll")为调用上面的Result
     *
     * @param id 查询条件
     * @return com.su.entity.Orders 返回查找的数据
     */
    @Override
    @ResultMap("findAll")
    @Select("select * from orders where orderId=#{id}")
    @ResultType(Orders.class)
    Orders findById(Integer id);


    /**
     * description: 更新订单信息
     *
     * @param orders
     * @return int
     */
    @Override
    @Update("update orders set orderTime=#{orderTime,jdbcType=TIMESTAMP},peopleCount=#{peopleCount},orderDesc=#{orderDesc},payType=#{payType},orderStatus=#{orderStatus},productId=#{product.productId},memberidId=#{memberid.memberidId} where orderId=#{orderId}")
    int update(Orders orders);

    /**
     * description: 根据订单id查询订单信息 ,@ResultMap("findAll")为调用上面的Result
     *
     * @param id 查询条件
     * @return com.su.entity.Orders 返回查找的数据
     */
    @ResultMap("findAll")
    @Select("select * from orders where productId=#{id}")
    @ResultType(List.class)
    Orders findByProductId(Integer id);
}
