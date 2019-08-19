package com.su.service;
import com.su.entity.Orders;
import com.su.service.baseservice.BaseService;
import java.util.List;
/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/18 下午2:59
 */
public interface OrdersService extends BaseService<Orders> {
    /**
     * description: 查询所有的订单信息
     *
     * @param
     * @return java.util.List<com.su.entity.Orders>
     */
    @Override
    List<Orders> findAll();
    /**
     * description: 因为删除一个产品时候的外键因素,所以先要删除订单表中的产品id
     *
     * @param id 删除需要的productid
     * @return int 返回影响的行数
     */
    @Override
    int deleteById(Integer id);
    /**
     * description: 根据id删除订单信息
     *
     * @param id 删除的id
     * @return int 返回操作的行数
     */
    int deleteOrdersById(Integer id);

    /**
     * description: 根据订单id查询订单信息
     *
     * @param id 查询条件
     * @return com.su.entity.Orders 返回查找的数据
     */
    @Override
    Orders findById(Integer id);
    /**
     * description: 更新订单信息
     *
     * @param orders 订单对象引用
     * @return int 返回操作的行数
     */
    @Override
    int update(Orders orders);
}
