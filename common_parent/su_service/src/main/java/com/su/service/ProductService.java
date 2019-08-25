package com.su.service;

import com.su.entity.Product;
import com.su.service.baseservice.BaseService;

import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/13 下午11:33
 */
public interface ProductService extends BaseService<Product> {

    /**
     * description: 查询所有的产品不分页
     *
     * @return java.util.List<com.su.entity.Product>
     */
    @Select("select * from product")
    @ResultType(List.class)
    List<Product> findAllNoPage();
}
