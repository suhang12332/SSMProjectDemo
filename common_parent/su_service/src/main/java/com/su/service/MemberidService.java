package com.su.service;

import com.su.entity.Memberid;
import com.su.service.baseservice.BaseService;

import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/21 下午4:56
 */
public interface MemberidService extends BaseService<Memberid> {

    /**
     * description: 查询所有的会员信息不分页
     *
     * @return java.util.List<com.su.entity.Memberid>
     */
    @Select("select * from memberid")
    List<Memberid> findAllNoPage();
}
