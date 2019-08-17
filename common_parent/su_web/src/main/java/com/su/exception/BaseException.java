package com.su.exception;

import org.springframework.web.bind.annotation.ExceptionHandler;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/16 下午7:03
 */
public abstract class BaseException {
    /**
     * 基于@ExceptionHandler异常处理
     */
    @ExceptionHandler(Exception.class)
    public String exception(Exception exception, HttpServletRequest request) {
        request.setAttribute("exception", exception);
        return "exception";
    }
}
