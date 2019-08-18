package com.su.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import lombok.Data;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/18 下午1:02
 */
@Data
public class Orders {
    /**
     * 订单编号id
     */
    private Integer orderId;
    /**
     * 下单时间
     */
    @NotNull(message = "{orders.orderTime}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date orderTime;
    /**
     * 出游人数
     */
    @NotNull(message = "{orders.peopleCount}")
    private Integer peopleCount;
    /**
     * 订单描述,其他信息
     */
    @NotBlank(message = "{orders.orderDesc}")
    private String orderDesc;
    /**
     * 支付方式 0支付宝,1微信,2其他
     */
    @NotNull(message = "{orders.payType}")
    private Integer payType;
    /**
     * 订单状态 0 未支付, 1 已支付
     */
    @NotNull(message = "{orders.orderStatus")
    private Integer orderStatus;
    /**
     * 产品信息
     */
    @NotNull(message = "{orders.productId}")
    private Product product;
    /**
     * 游客信息
     */
    private List<Tourist> tourists;
    /**
     * 会员信息
     */
    @NotNull(message = "{orders.memberidId}")
    private Memberid memberid;
}
