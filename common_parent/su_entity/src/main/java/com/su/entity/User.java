package com.su.entity;

import com.su.annotation.PhoneNumber;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.Data;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/26 下午6:59
 */
@Data
public class User {
    /**
     * 用户id
     */
    private Integer userId;
    /**
     * 用户姓名
     */
    @NotBlank(message = "{user.userName}")
    private String userName;
    /**
     * 用户邮箱
     */
    @NotBlank(message = "{user.userEmailNotNull}")
    @Email(message = "{user.userEmail}")
    private String userEmail;
    /**
     * 用户密码
     */
    @NotBlank(message = "{user.userPassword}")
    private String userPassword;
    /**
     * 用户电话
     */
    @PhoneNumber()
    @NotBlank(message = "{user.phoneNum}")
    private String phoneNum;
    /**
     * 用户状态 0关闭,1开启
     */
    private Integer userStatus;

    /**
     * 用户角色信息
     */
    private List<Role> role;
}
