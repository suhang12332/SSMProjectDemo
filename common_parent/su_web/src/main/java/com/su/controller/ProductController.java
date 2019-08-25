package com.su.controller;
import com.github.pagehelper.PageInfo;
import com.su.entity.Product;
import com.su.exception.BaseException;
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
 * @date 2019/8/14 下午10:34
 */
@Controller
@RequestMapping("/product")
public class ProductController extends BaseException {
    /**
     * description: 构造方法注入productService,其实现类是ProductServiceImpl
     *
     * @param productService 要注入的引用值
     * @return 无返回值
     */
    private ProductService productService;
    @Autowired
    public ProductController(@Qualifier("productServiceImpl") ProductService productService) {
        this.productService = productService;
    }

    /**
     * description: 查找所有的产品信息
     *
     * @param model mdoel用来存放查找的产品信息
     * @return java.lang.String 返回视图
     */
    @GetMapping("/findAll.do")
    public String findAll(@RequestParam(value = "page", required = true) int page, @RequestParam(value = "size", required = true) int size, Model model) {
        List<Product> all = productService .findAll(page,size);
        //pageInfo就是一个分页的beean
        PageInfo<Product> productPageInfo = new PageInfo<>(all);
        model.addAttribute("all", productPageInfo);
        return "allProduct";
    }
    /**
     * description: 增加一个产品操作,@Valid 进行数据验证,使用@valid 关联验证的对象,检测结果集中是否有错误
     *
     * @param product 增加的产品操作对象
     * @param result 数据验证的结果集
     * @return java.lang.String 结果集中有错,返回当前视图,显示当前错误信息,没错,重定向到findAll.do方法
     */
    @PostMapping("/addProduct.do")
    public String addProduct(@Valid Product product, BindingResult result) {
        if (result.hasErrors()) {
            return "addProduct";
        }
        productService.insert(product);
        return "redirect:findAll.do?page=1&size=5";
    }
    /**
     * description: 用于将product对象设置为addProduct视图的form backing object
     *
     * @param model model 用于将对象存入到model域中
     * @return java.lang.String 返回视图
     */
    @GetMapping("/toAdd.do")
    public String toAdd(Model model) {
        model.addAttribute("product", new Product());
        return "addProduct";
    }
    /**
     * description: 根据产品id删除一个产品信息
     *
     * @param id 删除条件
     * @return java.lang.String 重定向到findAll.do方法
     */
    @GetMapping("/deleteProductById.do")
    public String deleteProductById(@RequestParam("id") Integer id) {
        productService.deleteById(id);
        return "redirect:findAll.do?page=1&size=5";
    }
    /**
     * description: 根据产品id查询产品信息,
     *
     * @param id 查询条件
     * @param model mdoel域用来存放查询结果
     * @return java.lang.String 返回视图,利用spring的表单标签库,将查询的结果显示在页面上
     */
    @GetMapping("/toUpdate.do")
    public String toUpdate(@RequestParam("id") Integer id,Model model) {
        Product byId = productService.findById(id);
        model.addAttribute("product", byId);
        return "updateProduct";
    }
    /**
     * description: 更新产品信息
     *
     * @param product 产品信息引用,
     * @param result 数据验证的结果集,如果没错误的话,重定向到findAll.do,有错误返回本页视图,显示错误信息
     * @return java.lang.String
     */
    @PostMapping("/updateProduct.do")
    public String updateProduct(@Valid Product product,BindingResult result) {
        if (result.hasErrors()) {
            return "updateProduct";
        }
        productService.update(product);
        return "redirect:findAll.do?page=1&size=5";
    }
    /**
     * description: 跳转到登录页面
     *
     * @return java.lang.String 返回视图
     */
    @GetMapping("/login.do")
    public String login(){
        return "login";
    }

}
