package com.su.entity;

import lombok.Data;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/18 下午1:09
 */
@Data
public class Memberid {
    /**
     * 会员id 无意义的主键
     */
    private Integer memberidId;
    /**
     * 会员名称
     */
    private String memberidName;
    /**
     * 昵称
     */
    private String nickName;
    /**
     * 会员所留的电话号码
     */
    private String phoneNum;
    /**
     * 会员所留的邮箱
     */
    private String email;
}
