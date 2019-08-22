package com.su.entity;

import lombok.Data;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/22 下午8:51
 */
@Data
public class OrdersAndTourist {
    private Integer orderTouristId;
    private Integer orderId;

    private Tourist tourist;
}
