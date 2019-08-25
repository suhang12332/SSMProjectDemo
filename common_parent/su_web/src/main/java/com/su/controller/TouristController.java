package com.su.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.su.entity.Tourist;
import com.su.exception.BaseException;
import com.su.service.TouristService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

import javax.validation.Valid;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/19 下午4:55
 */
@Controller
@RequestMapping("/tourist")
public class TouristController extends BaseException {
    /**
     * description: 构造方法注入tourService,指定其实现类的对象是touristServiceImpl
     *
     */
    private TouristService touristService;
    @Autowired
    public TouristController(@Qualifier("touristServiceImpl") TouristService touristService) {
        this.touristService = touristService;
    }
    /**
     * description: 查找所有的游客信息
     *
     * @param model model域用来存放查找结果
     * @return java.lang.String
     */
    @GetMapping("/findAllTourist.do")
    public String findAll(@RequestParam(value = "page",required = true) int page,@RequestParam("size") int size,Model model) {
        List<Tourist> all = touristService.findAll(page,size);
        PageInfo<Tourist> touristPageInfo = new PageInfo<>(all);
        model.addAttribute("tourist", touristPageInfo);
        return "allTourist";
    }
    /**
     * description: 跳转到增加游客信息的页面
     *
     * @param model mdoel用来设置视图的backing object
     * @return java.lang.String
     */
    @GetMapping("/toAdd.do")
    public String toAdd(Model model) {
        model.addAttribute("tourist", new Tourist());
        return "addTourist";
    }
    /**
     * description: 增加游客信息
     *
     * @param tourist 游客信息引用
     * @return java.lang.String 重定向到查询所有游客信息方法
     */
    @PostMapping("/addTourist.do")
    public String addTourist(@Valid Tourist tourist, BindingResult result) {
        if (result.hasErrors()) {
            return "addTourist";
        }
        touristService.insert(tourist);
        return "redirect:findAllTourist.do?page=1&size=5";
    }
    /**
     * description: 根据游客id删除游客信息
     *
     * @param id 删除条件
     * @return java.lang.String 重定向到查询所有游客信息方法
     */
    @GetMapping("/deleteTouristById.do")
    public String deleteTouristById(@RequestParam("id") Integer id) {
        touristService.deleteById(id);
        return "redirect:findAllTourist.do?page=1&size=5";
    }
    /**
     * description: 根据id查询有游客信息
     *
     * @param id 查询条件
     * @param model 将查寻的结果放在model域中
     * @return java.lang.String 返回视图
     */
    @GetMapping("/toUpdate.do")
    public String toUpdate(@RequestParam("id") Integer id, Model model) {
        Tourist byId = touristService.findById(id);
        model.addAttribute("tourist", byId);
        return "updateTourist";
    }
    /**
     * description: 更新游客信息
     *
     * @param tourist 游客信息引用
     * @param result 数据验证的结果集,如果没错误的话,重定向到findAllTourist.do,有错误返回本页视图,显示错误信息
     * @return java.lang.String
     */
    @PostMapping("/updateTourist.do")
    public String updateTourist(@Valid Tourist tourist, BindingResult result) {
        if (result.hasErrors()) {
            return "updateTourist";
        }
        touristService.update(tourist);
        return "redirect:findAllTourist.do?page=1&size=5";
    }
    /**
     * description: 接受前台的ajax传来的请求,根据游客证件号码查询游客信息
     *
     * @param credentialsNum 证件号码
     * @return java.lang.Integer
     */
    @ResponseBody
    @GetMapping("/judeTouristCredentialsNum.do")
    public int selectTouristByCredentialsNum(@RequestParam("credentialsNum") String credentialsNum) {
        List<Tourist> tourists = touristService.selectTouristByCredentialsNum(credentialsNum);
        return tourists.size();
    }
    /**
     * description: 接受前台的ajax传来的请求,根据游客联系方式查询游客信息
     *
     * @param phoneNumber 电话号码
     * @return java.lang.Integer
     */
    @ResponseBody
    @GetMapping("/judeTouristPhoneNumber.do")
    public Integer selectTouristByPhoneNumber(@RequestParam("phoneNumber") String phoneNumber) {
        List<Tourist> tourists = touristService.selectTouristByPhoneNumber(phoneNumber);
        return tourists.size();
    }

}
