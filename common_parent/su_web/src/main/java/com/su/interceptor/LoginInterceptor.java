package com.su.interceptor;

import com.su.entity.Log;
import com.su.entity.User;
import com.su.service.LogService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Date;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created with IntelliJ IDEA
 *
 * @author su
 * @version 1.0
 * @description
 * @date 2019/8/17 下午9:53
 */
public class LoginInterceptor implements HandlerInterceptor {
    private LogService logService;
    private Log log;
    @Autowired
    public LoginInterceptor(@Qualifier("log") Log log,
                            @Qualifier("logServiceImpl") LogService logService){
        this.logService = logService;
        this.log = log;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取请求的URL
        String requestUrl = request.getRequestURI();
        //login.jsp或者登录页面请求放行,不拦截
        if (requestUrl.indexOf("/user/login.do") >= 0 || requestUrl.indexOf("/user/isLogin.do") >= 0) {
            return true;
        }
        //session不为空放行,不拦截
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            return true;
        }
        //没有登录且不是登录页面,转发到登录页面,并给出错误的信息
        request.setAttribute("msg", "还没有登录,请登录");
        request.getRequestDispatcher("/user/login.do").forward(request, response);
        return false;
    }
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
        //判断当前的session,存入操作者姓名
        User allPost = null;
        try {
            HttpSession session = request.getSession();
            allPost= (User) session.getAttribute("user");
        } catch (IllegalStateException e) {}
        if(allPost!=null){
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
        }
    }
}
