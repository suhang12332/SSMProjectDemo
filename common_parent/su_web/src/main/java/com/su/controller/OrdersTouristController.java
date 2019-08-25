package com.su.controller;

import com.su.exception.BaseException;
import com.su.service.OrdersTouristService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/25 下午10:00
 */
@Controller
@RequestMapping("/orderstourist")
public class OrdersTouristController extends BaseException {
    private OrdersTouristService ordersTouristService;
    @Autowired
    public OrdersTouristController(@Qualifier("ordersTouristServiceImpl") OrdersTouristService ordersTouristService) {
        this.ordersTouristService = ordersTouristService;
    }
    /**
     * description: 根据订单表id删除中间表的信息
     *
     * @param id 订单表id
     * @return java.lang.String 重定向到订单表,删除订单表信息
     */
    @GetMapping("/deleteByOrdersId.do")
    public String deleteByOrdersId(@RequestParam("id") Integer id) {
        ordersTouristService.deleteById(id);
        return "redirect:/orders/deleteOrdersById.do?id="+id;
    }

    /**
     * description: 根据订单表id删除中间表的信息
     *
     * @param id 订单表id
     * @return java.lang.String 重定向到订单表,删除订单表信息,然后重定向到产品表,删除产品
     */
    @GetMapping("/deleteByOrdersIdAndDeleteOrders.do")
    public String deleteByOrdersIdAndDeleteOrders(@RequestParam("id") Integer id) {
        //执行删除方法,根据订单id删除中间表的信息
        ordersTouristService.deleteById(id);
        //重定向到删除订单信息
        return "redirect:/orders/deleteOrdersByProductId.do?id="+id;
    }
}
