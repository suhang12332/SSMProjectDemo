package com.su.controller;

import com.github.pagehelper.PageInfo;
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
import org.springframework.web.bind.annotation.ModelAttribute;
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
    public String toOrders(@RequestParam(value = "page",required = true) int page,@RequestParam("size") int size, Model model) {
        List<Orders> all = ordersService.findAll(page,size);
        PageInfo<Orders> ordersPageInfo = new PageInfo<>(all);
        model.addAttribute("orders", ordersPageInfo);
        return "allOrders";
    }
    /**
     * description: 根据产品id查询订单id
     *
     * @param id 产品id
     * @return java.lang.String 重定向到删除根据订单id删除中间表的方法
     */
    @GetMapping("/selectOrdersIdByProductId.do")
    public String selectOrdersIdByProductId(@RequestParam("id") Integer id) {
        //判断订单中是否有该产品,
        Orders byId = ordersService.findByProductId(id);
        if(byId!=null){
            //如果有的话,重定向到中间表,查看是否该订单有游客信息
            return "redirect:/orderstourist/deleteByOrdersIdAndDeleteOrders.do?id="+byId.getOrderId();
        }else {
            //为空,代表当前产品没有任何订单,直接重定向到删除产品信息
            return "redirect:/product/deleteProductById.do?id=" + id;
        }
    }

    /**
     * description: 因为删除产品的时候的外键原因,所以先要删除订单表中的产品表,然后才能删除该产品
     *
     * @param id 产品id
     * @return java.lang.String 重定向到删除产品的方法
     */
    @GetMapping("/deleteOrdersByProductId.do")
    public String deleteOrderProductId(@RequestParam("id") Integer id) {
        //根据id查找订单信息,因为这里面的id有可能是由中间表方法重定向过来的订单id,也有可能是因为订单中无产品信息,从而重定向过来的产品id
        Orders byId = ordersService.findById(id);
        //得到产品id
        Integer productId = byId.getProduct().getProductId();
        //根据产品id删除订单信息,(因为这里需要重定向到删除产品信息,所以这里获取产品id)
        ordersService.deleteById(productId);
        //重定向到删除产品信息,传递产品id
        return "redirect:/product/deleteProductById.do?id=" + productId;
    }
    /**
     * description: 跳转到添加订单的页面,并将orders对象设置为表单标签库的backing object
     *
     * @param model 用于存放orders对象
     * @return java.lang.String 返回视图
     */
    @GetMapping("/toAdd.do")
    public String toAdd(Model model) {
        List<Product> all = productService.findAllNoPage();
        List<Memberid> all1 = memberidService.findAllNoPage();
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
            List<Product> all = productService.findAllNoPage();
            List<Memberid> all1 = memberidService.findAllNoPage();
            model.addAttribute("product", all);
            model.addAttribute("memberid", all1);
            return "addOrders";
        }
        ordersService.insert(orders);
        return "redirect:findAllOrder.do?page=1&size=5";
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
        return "redirect:findAllOrder.do?page=1&size=5";
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
        List<Product> all = productService.findAllNoPage();
        List<Memberid> all1 = memberidService.findAllNoPage();
        model.addAttribute("product", all);
        model.addAttribute("memberid", all1);
        Orders byId = ordersService.findById(id);
        model.addAttribute("orders", byId);
        return "updateOrders";
    }
    /**
     * description: 更新订单信息
     *
     * @param orders 订单信息引用
     * @param result jsr数据验证结果集
     * @return java.lang.String
     */
    @PostMapping("/updateOrders.do")
    public String updateOrders(@Valid Orders orders, BindingResult result,Model model) {
        if (result.hasErrors()) {
            List<Product> all = productService.findAllNoPage();
            List<Memberid> all1 = memberidService.findAllNoPage();
            model.addAttribute("product", all);
            model.addAttribute("memberid", all1);
            return "updateOrders";
        }
        ordersService.update(orders);
        return "redirect:findAllOrder.do?page=1&size=5";
    }

    @GetMapping("/orderInformation.do")
    public String orderInformation(@RequestParam("id") Integer id,Model model) {
        Orders byId = ordersService.findById(id);
        model.addAttribute("ordersInformation", byId);
        return "ordersInformation";
    }

}
