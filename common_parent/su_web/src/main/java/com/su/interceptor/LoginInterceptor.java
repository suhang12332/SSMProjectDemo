//package com.su.interceptor;
//
//import org.springframework.web.servlet.HandlerInterceptor;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// * Created with IntelliJ IDEA
// *
// * @author su
// * @version 1.0
// * @description
// * @date 2019/8/17 下午9:53
// */
//public class LoginInterceptor implements HandlerInterceptor {
//    @Override
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        //获取请求的URL
//        String requestUrl = request.getRequestURI();
//        //login.jsp或者登录页面请求放行,不拦截
//        if (requestUrl.indexOf("/toLogin") >= 0 || requestUrl.indexOf("/login") >= 0) {
//            return true;
//        }
//        //session不为空放行,不拦截
//        HttpSession session = request.getSession();
//        User allPost = (User) session.getAttribute("user");
//        if (allPost != null) {
//            return true;
//        }
//        //没有登录且不是登录页面,转发到登录页面,并给出错误的信息
//        request.setAttribute("msg", "还没有登录,请登录");
//        request.getRequestDispatcher("WEB-INF/views/login.jsp").forward(request, response);
//        return false;
//    }
//}
