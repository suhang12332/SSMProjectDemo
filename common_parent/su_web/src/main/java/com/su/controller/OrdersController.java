package com.su.controller;

import com.su.entity.Memberid;
import com.su.entity.Orders;
import com.su.entity.Product;
import com.su.exception.BaseException;
import com.su.service.MemberidService;
import com.su.service.OrdersService;
import com.su.service.ProductService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.validation.Valid;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/18 下午3:29
 */
@Controller
@RequestMapping("/orders")
public class OrdersController extends BaseException {
    private ProductService productService;
    private OrdersService ordersService;
    private MemberidService memberidService;
    @Autowired
    public OrdersController(@Qualifier("ordersServiceImpl") OrdersService ordersService,
                            @Qualifier("productServiceImpl") ProductService productService,
                            @Qualifier("memberidServiceImpl") MemberidService memberidService) {
        this.ordersService = ordersService;
        this.productService = productService;
        this.memberidService = memberidService;
    }
    /**
     * description: 查询所有的订单信息
     *
     * @param model model 对象,用来存放查找的数据
     * @return java.lang.String 返回到视图
     */
    @GetMapping("/findAllOrder.do")
    public String toOrders(Model model) {
        List<Orders> all = ordersService.findAll();
        model.addAttribute("orders", all);
        return "allOrders";
    }
    /**
     * description: 因为删除产品的时候的外键原因,所以先要删除订单表中的产品表,然后才能删除该产品
     *
     * @param id 产品id
     * @return java.lang.String 重定向到删除产品的方法
     */
    @GetMapping("/deleteOrdersByProductId.do")
    public String deleteOrderProductId(@RequestParam("id") Integer id) {
        ordersService.deleteById(id);
        return "redirect:/product/deleteProductById.do?id="+id;
    }
    /**
     * description: 跳转到添加订单的页面,并将orders对象设置为表单标签库的backing object
     *
     * @param model 用于存放orders对象
     * @return java.lang.String 返回视图
     */
    @GetMapping("/toAdd.do")
    public String toAdd(Model model) {
        List<Product> all = productService.findAll();
        List<Memberid> all1 = memberidService.findAll();
        model.addAttribute("product", all);
        model.addAttribute("memberid", all1);
        model.addAttribute("orders", new Orders());
        return "addOrders";
    }
    /**
     * description: 增加订单的操作
     *
     * @param orders orders对象
     * @return java.lang.String 返回到查询订单的操作的方法
     */
    @PostMapping("/addOrders.do")
    public String addOrders(@Valid Orders orders, BindingResult result,Model model) {
        if (result.hasErrors()) {
            List<Product> all = productService.findAll();
            List<Memberid> all1 = memberidService.findAll();
            model.addAttribute("product", all);
            model.addAttribute("memberid", all1);
            return "addOrders";
        }
        ordersService.insert(orders);
        return "redirect:findAllOrder.do";
    }
    /**
     * description: 根据订单id删除订单信息
     *
     * @param id 订单id
     * @return java.lang.String 返回视图
     */
    @GetMapping("/deleteOrdersById.do")
    public String deleteOrderById(@RequestParam("id") Integer id) {
        ordersService.deleteOrdersById(id);
        return "redirect:findAllOrder.do";
    }
    /**
     * description: 根据订单id查询订单的信息
     *
     * @param id 查询条件
     * @param model model域用来存放查询结果
     * @return java.lang.String
     */
    @GetMapping("/toUpdate.do")
    public String toUpdate(@RequestParam("id") Integer id,Model model) {
        Orders byId = ordersService.findById(id);
        model.addAttribute("orders", byId);
        return "updateOrders";
    }

    @PostMapping("/updateOrders.do")
    public String updateOrders(@Valid Orders orders, BindingResult result) {
        if (result.hasErrors()) {
            return "updateOrders";
        }
        ordersService.update(orders);
        return "redirect:findAllOrder.do";
    }
}
