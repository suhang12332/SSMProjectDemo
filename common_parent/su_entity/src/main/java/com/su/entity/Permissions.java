package com.su.entity;

import lombok.Data;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/26 下午7:07
 */ 
@Data
public class Permissions {
    /**
     * 无意义的主键
     */
    private Integer permissionsId;
    /**
     * 权限名
     */
    private String permissionsName;
    /**
     * 资源路径
     */
    private String url;
}
