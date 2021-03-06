package com.su.dao.basedao;

import com.su.dao.ProductDao;

import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/13 下午11:21
 */
public interface BaseDao<T> {
    /**
     * description: 查询所有的信息
     *
     * @param page 页数
     * @param size 每一页的条数
     * @return java.util.List<T>
     */
    List<T> findAll(int page,int size);

    /**
     * description: 根据id查询信息
     *
     * @param id 查询条件
     * @return T 返回的结果集
     */
    T findById(Integer id);

    /**
     * description: 根据id删除信息
     *
     * @param id 删除条件
     * @return int 返回影响的行数
     */
    int deleteById(Integer id);

    /**
     * description: 插入信息
     *
     * @param t 信息对象
     * @return int 返回操作的行数
     */
    int insert(T t);

    /**
     * description: 更新信息
     *
     * @param t 信息对象
     * @return int 返回操作的行数
     */
    int update(T t);
}
