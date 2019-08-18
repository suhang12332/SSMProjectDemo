package com.su.entity;

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
    private String passengerName;
    /**
     * 游客性别
     */
    private String passengerSex;
    /**
     * 游客电话
     */
    private String passengerPhoneNumber;
    /**
     * 游客证件类型 0身份证,1护照,2军官证
     */
    private Integer credentialsType;
    /**
     * 游客证件号码
     */
    private String credentialsNum;
    /**
     * 游客类型 0成人,1儿童
     */
    private Integer passengerType;
}
