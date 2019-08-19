package com.su.service.ordersserviceimpl;

import com.su.dao.OrdersDao;
import com.su.entity.Orders;
import com.su.service.OrdersService;
import com.su.service.baseservice.BaseServiceImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/18 下午3:02
 */
@Service
@Transactional(rollbackFor = {Exception.class})
public class OrdersServiceImpl extends BaseServiceImpl<Orders> implements OrdersService {
    public OrdersServiceImpl(OrdersDao ordersDao) {
        super(ordersDao);
    }

    @Override
    public List<Orders> findAll() {
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(Integer id) {
        return ordersDao.findById(id);
    }

    @Override
    public int deleteById(Integer id) {
        return ordersDao.deleteById(id);
    }

    @Override
    public int deleteOrdersById(Integer id) {
        return ordersDao.deleteOrdersById(id);
    }

    @Override
    public int insert(Orders orders) {
        System.out.println(orders);
        return ordersDao.insert(orders);
    }

    @Override
    public int update(Orders orders) {
        return ordersDao.update(orders);
    }
}
