package com.su.entity;

import com.su.annotation.PhoneNumber;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Data;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/18 下午1:08
 */
@Data
public class Tourist {
    /**
     * 游客id
     */
    private Integer passengerId;
    /**
     * 游客姓名
     */
    @NotBlank(message = "{tourist.passengerName}")
    private String passengerName;
    /**
     * 游客性别
     */
    @NotBlank(message = "{tourist.passengerSex}")
    private String passengerSex;
    /**
     * 游客电话
     */
    @PhoneNumber()
    @NotBlank(message = "{tourist.passengerPhoneNumber}")
    private String passengerPhoneNumber;
    /**
     * 游客证件类型 0身份证,1护照,2军官证
     */
    @NotNull(message = "{tourist.credentialsType")
    private Integer credentialsType;
    /**
     * 游客证件号码
     */
    @NotBlank(message = "{tourist.credentialsNum}")
    private String credentialsNum;
    /**
     * 游客类型 0成人,1儿童
     */
    @NotNull(message = "{tourist.passengerType}")
    private Integer passengerType;
}
