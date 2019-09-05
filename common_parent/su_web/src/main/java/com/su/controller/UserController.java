package com.su.controller;

import com.github.pagehelper.PageInfo;
import com.su.entity.Log;
import com.su.entity.User;
import com.su.exception.BaseException;
import com.su.service.LogService;
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

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
public class UserController extends BaseException {
    private UserService userService;
    private LogService logService;
    private Log log;

    @Autowired
    public UserController(@Qualifier("userServiceImpl") UserService userService,
                          @Qualifier("logServiceImpl") LogService logService,
                          @Qualifier("log") Log log) {
        this.userService = userService;
        this.logService = logService;
        this.log = log;
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
        List<User> users = userService.selectByUserName(userName);
        return users.size();
    }
    /**
     * description: 根据用户id删除用户
     *
     * @param id 用户id
     * @return java.lang.String 重定向到查询所有的用户
     */
    @GetMapping("/deleteById.do")
    public String deleteById(@RequestParam("id") int id){
        userService.deleteUserRoleById(id);
        userService.deleteById(id);
        return "redirect:findAll.do?page=1&size=5";
    }

    /**
     * description: 跳转到更新用户页面
     *
     * @param id 用户id
     * @param model mdoel域存放用户的信息,用于显示在页面上
     * @return java.lang.String
     */
    @GetMapping("/toUpdateUser.do")
    public String toUpdateUser(@RequestParam("id") int id,Model model) {
        User byId = userService.findById(id);
        model.addAttribute("user", byId);
        return "updateUser";
    }

    /**
     * description: 更新用户信息
     *
     * @param user 用户信息
     * @param result 结果集
     * @return java.lang.String
     */
    @PostMapping("/updateUser.do")
    public String updateUser(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "updateUser";
        }
        int update = userService.update(user);
        return "redirect:findAll.do?page=1&size=5";
    }
    /**
     * description: 用户详细信息
     *
     * @param id 用户id
     * @param model model域存放结果集
     * @return java.lang.String
     */
    @GetMapping("/userInformation.do")
    public String userInformation(@RequestParam("id") Integer id, Model model,@RequestParam("page") int page, @RequestParam("size") int size) {
        User byId = userService.findById(id);
        List<Log> byUserName = logService.findByUserName(byId.getUserName(), page, size);
        PageInfo<Log> userPageInfo = new PageInfo<>(byUserName);
        model.addAttribute("log", userPageInfo);
        model.addAttribute("user", byId);
        return "userInformation";
    }

    /**
     * description: 跳转到登录页面
     *
     * @return java.lang.String 返回视图
     */
    @GetMapping("/login.do")
    public String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }
    /**
     * description: 注销登录
     * @param session 用户session
     * @return java.lang.String 重定向到用户登录页面
     */
    @GetMapping("/logout.do")
    public String logOut(HttpSession session,HttpServletRequest request) {
        User allPost = (User) session.getAttribute("user");
        log.setUserName(allPost.getUserName());
        //设置日期
        log.setVisitTime(new Date());
        //存入ip
        log.setIp(request.getRemoteAddr());
        //存入路径
        log.setUrl(request.getRequestURI());
        //存入方法
        log.setMethod(request.getMethod());
        logService.insert(log);
        session.invalidate();
        return "redirect:login.do";
    }
    /**
     * description: 用于判断用户是否登录
     * @param user
     * @return java.lang.String
     */
    @PostMapping("/isLogin.do")
    public String isLogin(User user, HttpSession session, HttpServletRequest request) {
        Boolean login = userService.isLogin(user);
        if (login) {
            session.setAttribute("user",userService.findUserByName(user));
            return "index";
        }
        return "redirect:login.do";
    }
    /**
     * description: 跳转到主页面
     *
     * @return java.lang.String
     */
    @GetMapping("/index.do")
    public String index(){
        return "index";
    }

}
