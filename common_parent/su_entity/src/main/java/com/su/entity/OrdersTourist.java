package com.su.entity;

import lombok.Data;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/25 下午9:44
 */
@Data
public class OrdersTourist {
    /**
     * 无意义的主键
     */
    private Integer orderTouristId;
    /**
     * 订单id
     */
    private Integer orderId;
    /**
     * 游客id
     */
    private Integer touristId;
}
