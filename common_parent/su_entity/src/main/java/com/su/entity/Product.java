package com.su.entity;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Past;

import lombok.Data;
/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description 产品信息实体
 * @date 2019/8/13 下午10:14
 */
@Data
public class Product {
    /**
     * 主键,产品编号
     */
    private Integer productId;
    /**
     * 产品名称
     */
    @NotBlank(message = "{product.productName}")
    private String productName;
    /**
     * 出发的城市
     */
    @NotBlank(message = "{product.cityName}")
    private String cityName;
    /**
     * 出发的时间
     */
    @NotNull(message = "{product.departureTime}")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date departureTime;
    /**
     * 产品价格
     */
    /**
     * Min注解 必须大于指定的最小值,这个约束是一个参数
     */
    @NotNull(message = "{product.productPrice}")
    @Min(value = 0,message = "{product.productPrice1}")
    private Double productPrice;
    /**
     * 产品描述
     */
    @NotBlank(message = "{product.productDesc}")
    private String productDesc;
    /**
     * 产品状态 0关闭,1开启
     */
    @NotNull(message = "{product.productStatus}")
    private Integer productStatus;
}
