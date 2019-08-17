package com.su.controller;

import com.su.entity.Product;
import com.su.exception.BaseException;
import com.su.service.ProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.validation.Valid;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/14 下午10:34
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseException {
    private ProductService productService;
    @Autowired
    public ProductController(@Qualifier("productServiceImpl") ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/findAll.do")
    public String findAll(Model model) {
        List<Product> all = productService.findAll();
        model.addAttribute("all", all);
        return "allProduct";
    }
    /**
     * 进行数据验证,使用@valid 关联验证的对象,检测结果集中是否有错误
     */
    @PostMapping("/addProduct.do")
    public String addProduct(@Valid Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "addProduct";
        }
        productService.insert(product);
        System.out.println(product.getDepartureTime());
        return "redirect:findAll.do";
    }

    @GetMapping("/toAdd.do")
    public String toAdd(Model model) {
        model.addAttribute("product", new Product());
        return "addProduct";
    }

    @GetMapping("/deleteProductById.do")
    public String deleteProductById(@RequestParam("id") Integer id) {
        productService.deleteById(id);
        return "redirect:findAll.do";
    }

    @GetMapping("/updateProduct.do")
    public String updateProduct(@RequestParam("id") Integer id,Model model) {
        Product byId = productService.findById(id);
        model.addAttribute("product", byId);
        return "product";
    }
}
