package com.su.service.orderstouristserviceimpl;

import com.su.dao.OrdersTouristDao;
import com.su.entity.OrdersTourist;
import com.su.service.OrdersTouristService;
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
 * @date 2019/8/25 下午9:52
 */
@Service
@Transactional(rollbackFor = {Exception.class})
public class OrdersTouristServiceImpl extends BaseServiceImpl<OrdersTourist> implements OrdersTouristService {
    public OrdersTouristServiceImpl(OrdersTouristDao ordersTouristDao) {
        super(ordersTouristDao);
    }

    @Override
    public List<OrdersTourist> findAll(int page, int size) {
        return null;
    }

    @Override
    public OrdersTourist findById(Integer id) {
        return null;
    }

    @Override
    public int deleteById(Integer id) {
        return ordersTouristDao.deleteById(id);
    }

    @Override
    public int insert(OrdersTourist ordersTourist) {
        return 0;
    }

    @Override
    public int update(OrdersTourist ordersTourist) {
        return 0;
    }
}
