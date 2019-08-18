package com.su.service.baseservice;
import com.su.dao.OrdersDao;
import com.su.dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/13 下午11:35
 */
public abstract class BaseServiceImpl<T> implements BaseService<T> {
    @Autowired
    protected ProductDao productDao;
    public BaseServiceImpl(@Qualifier("productDao") ProductDao productDao) {
        this.productDao = productDao;
    }
    @Autowired
    protected OrdersDao ordersDao;
    public BaseServiceImpl(@Qualifier("ordersDao") OrdersDao ordersDao) {
        this.ordersDao = ordersDao;
    }
}
