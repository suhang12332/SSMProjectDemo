package com.su.service.baseservice;
import com.su.dao.MemberidDao;
import com.su.dao.OrdersDao;
import com.su.dao.ProductDao;
import com.su.dao.TouristDao;
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
    /**
     * description: 构造方法注入productDao,指定其实现类的对象是productDao
     * @return
     */
    @Autowired
    protected ProductDao productDao;
    public BaseServiceImpl(@Qualifier("productDao") ProductDao productDao) {
        this.productDao = productDao;
    }
    /**
     * description: 构造方法注入ordersDao.指定其实现类的对象是ordersDao
     * @return
     */
    @Autowired
    protected OrdersDao ordersDao;
    public BaseServiceImpl(@Qualifier("ordersDao") OrdersDao ordersDao) {
        this.ordersDao = ordersDao;
    }

    /**
     * description: 构造方法注入touristDao.指定其实现类的对象是touristDao
     *
     * @return
     */
    @Autowired
    protected TouristDao touristDao;
    public BaseServiceImpl(@Qualifier("touristDao") TouristDao touristDao) {
        this.touristDao = touristDao;
    }
    /**
     * description: 构造方法注入memberidDao.指定其实现类的对象是memberidDao
     *
     * @return
     */
    @Autowired
    protected MemberidDao memberidDao;
    public BaseServiceImpl(@Qualifier("memberidDao") MemberidDao memberidDao) {
        this.memberidDao = memberidDao;
    }
}
