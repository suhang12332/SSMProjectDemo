package com.su.entity;

import java.util.Date;

import lombok.Data;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/26 下午7:09
 */
@Data
public class Log {
    /**
     * 日志id
     */
    private Integer logId;
    /**
     * 访问时间
     */
    private Date visitTime;
    /**
     * 操作者用户名
     */
    private String userName;
    /**
     * 访问ip
     */
    private String ip;
    /**
     * 访问url
     */
    private String url;
    /**
     * 执行时长
     */
    private Integer executionTime;
    /**
     * 执行方法
     */
    private String method;
}
