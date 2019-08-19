package com.su.dao;

import com.su.dao.basedao.BaseDao;
import com.su.entity.Product;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/13 下午10:28
 */
@Repository
@Mapper
public interface ProductDao extends BaseDao<Product> {
    /**
     * description: 查询所有的信息
     *
     * @return java.util.List<T>
     */
    @Override
    @Select("select * from product")
    @ResultType(List.class)
    List<Product> findAll();


    /**
     * description: 根据id查询信息
     *
     * @param id 查询条件
     * @return T 返回的结果集
     */
    @Override
    @Select("select * from product where productId=#{id}")
    @ResultType(Product.class)
    Product findById(@Param("id") Integer id);


    /**
     * description: 根据id删除信息
     *
     * @param id 删除条件
     * @return int 返回影响的行数
     */
    @Override
    @Delete("delete from product where productId=#{id}")
    int deleteById(@Param("id") Integer id);


    /**
     * description: 插入信息
     *
     * @param product 信息对象
     * @return int 返回操作的行数
     */
    @Override
    @Insert("insert into product (productId, productName, cityName, departureTime, productPrice, productDesc,productStatus) values(null,#{productName},#{cityName},#{departureTime,jdbcType=TIMESTAMP},#{productPrice},#{productDesc},#{productStatus})")
    int insert(Product product);


    /**
     * description: 更新信息
     *
     * @param product 信息对象
     * @return int 返回操作的行数
     */
    @Override
    @Update("update product set productName=#{productName},cityName=#{cityName},departureTime=#{departureTime,jdbcType=TIMESTAMP},productPrice=#{productPrice},productDesc=#{productDesc},productStatus=#{productStatus} where productId=#{productId}")
    int update(Product product);
}
