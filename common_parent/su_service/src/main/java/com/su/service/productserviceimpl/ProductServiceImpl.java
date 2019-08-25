package com.su.service.productserviceimpl;

import com.github.pagehelper.PageHelper;
import com.su.dao.ProductDao;
import com.su.entity.Product;
import com.su.service.ProductService;
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
 * @date 2019/8/13 下午11:38
 */
@Service
@Transactional(rollbackFor = {Exception.class})
public class ProductServiceImpl extends BaseServiceImpl<Product> implements ProductService {


    public ProductServiceImpl(ProductDao productDao) {
        super(productDao);
    }

    @Override
    public List<Product> findAll(int page, int size) {
        //参数pageMum是页码数,pageSize是每页显示的条数
        PageHelper.startPage(page, size);
        return productDao.findAll(page, size);
    }

    @Override
    public Product findById(Integer id) {
        return productDao.findById(id);
    }

    @Override
    public int deleteById(Integer id) {
        return productDao.deleteById(id);
    }

    @Override
    public int insert(Product product) {
        return productDao.insert(product);
    }

    @Override
    public int update(Product product) {
        return productDao.update(product);
    }

    @Override
    public List<Product> findAllNoPage() {
        return productDao.findAllNoPage();
    }
}
