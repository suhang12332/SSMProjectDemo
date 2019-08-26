package com.su.controller;

import com.github.pagehelper.PageInfo;
import com.su.entity.User;
import com.su.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import javax.validation.Valid;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/26 下午2:52
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private UserService userService;

    @Autowired
    public UserController(@Qualifier("userServiceImpl") UserService userService) {
        this.userService = userService;
    }
    /**
     * description: 跳转到登录页面
     * @return java.lang.String 返回视图
     */
    @GetMapping("/login.do")
    public String login() {
        return "login";
    }

    /**
     * description: 跳转到找回密码功能
     * @return java.lang.String 返回视图
     */
    @GetMapping("/returnPassword.do")
    public String returnPassword() {
        return "returnPassword";
    }

    /**
     * description: 登查找所有的用户信息
     *
     * @param page 页数
     * @param size 每页的条数
     * @return java.lang.String
     */
    @GetMapping("/findAll.do")
    public String findAll(@RequestParam("page") int page, @RequestParam("size") int size, Model model){
        List<User> all = userService.findAll(page, size);
        PageInfo<User> userPageInfo = new PageInfo<>(all);
        System.out.println(userPageInfo);
        model.addAttribute("user", userPageInfo);
        return "allUser";
    }

    /**
     * description: 跳转到添加用户的页面
     *
     * @param model model存放表单标签库的backing object
     * @return java.lang.String 返回视图
     */
    @GetMapping("/toAdd.do")
    public String toAdd(Model model){
        model.addAttribute("user", new User());
        return "addUser";
    }

    /**
     * description: 增加新用户
     *
     * @param user 用户对象
     * @param result jsr数据验证结果集
     * @return java.lang.String 返回视图
     */
    @PostMapping("/addUser.do")
    public String addUser(@Valid User user, BindingResult result){
        if (result.hasErrors()) {
            return "addUser";
        }
        userService.insert(user);
        return "redirect:findAll.do?page=1&size=5";
    }


    /**
     * description: 前台ajax发送请求,根据联系方式查询用户信息,判断是否存在
     *
     * @param phoneNum 联系方式
     * @return java.lang.Integer 返回查询的结果个数
     */
    @ResponseBody
    @GetMapping("/selectByPhoneNum.do")
    public Integer selectByPhoneNum(@RequestParam("phoneNum") String phoneNum) {
        List<User> users = userService.selectByPhoneNum(phoneNum);
        return users.size();
    }

    /**
     * description: 前台ajax发送请求,根据用户名查询用户信息,判断是否存在
     *
     * @param userName 用户名
     * @return java.lang.Integer 返回查询的结果个数
     */
    @ResponseBody
    @GetMapping("/selectByUserName.do")
    public Integer selectByUserName(@RequestParam("userName") String userName) {
        System.out.println(userName);
        List<User> users = userService.selectByUserName(userName);
        return users.size();
    }
}
