package com.su.controller;

import com.github.pagehelper.PageInfo;
import com.su.entity.Log;
import com.su.exception.BaseException;
import com.su.service.LogService;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.annotation.Resource;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/9/5 下午9:19
 */
@Controller
@RequestMapping("/log")
public class LogController extends BaseException {
    private LogService logService;

    @Autowired
    public LogController(@Qualifier("logServiceImpl") LogService logService) {
        this.logService = logService;
    }

    /**
     * description: 查询所有的日志信息
     *
     * @param page 页数
     * @param size 每一页的条数
     * @param model model域对象用来存放日志信息
     * @return java.lang.String
     */
    @GetMapping("/findAll.do")
    public String findAll(@RequestParam("page") int page, @RequestParam("size") int size, Model model) {
        List<Log> all = logService.findAll(page, size);
        PageInfo<Log> logPageInfo = new PageInfo<>(all);
        model.addAttribute("log", logPageInfo);
        return "allLog";
    }

    /**
     * description: 根据用户名删除日志信息
     *
     * @param userName 用户姓名
     * @return java.lang.String　重定向到查询所有的日志信息方法
     */
    @GetMapping("/deleteLog.do")
    public String deleteLogByUserName(@RequestParam("userName") String userName) {
        logService.deleteByUserName(userName);
        return "redirect:findAll.do?page=1&size=10";
    }
}
