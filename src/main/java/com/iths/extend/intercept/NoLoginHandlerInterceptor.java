package com.iths.extend.intercept;


import com.iths.pojo.Employee;
import org.springframework.stereotype.Controller;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/22 18:12
 * 判断用户是否登入
 */
public class NoLoginHandlerInterceptor implements HandlerInterceptor {
    /**
     * 预处理回调方法，实现处理器的预处理（如检查登陆），第三个参数为响应的处理器，自定义Controller
     * 返回值：true表示继续流程（如调用下一个拦截器或处理器）；false表示流程中断（如登录检查失败），不会继续调用其他的拦截器或处理器，此时我们需要通过response来产生响应；
     */
   public AntPathMatcher pathMatcher = new AntPathMatcher();
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //获取项目路径
        String contextPath =  request.getContextPath();
        //获取请求URI
       String  requestURI = request.getRequestURI();
        //判断是否是登入页面放行
        if (pathMatcher.match(contextPath+"/employee/login",requestURI)){
            return true;
        }
        //判断是否是验证码放行
        if (pathMatcher.match(contextPath+"/employee/captcha",requestURI)){
            return true;
        }
        // 获取session中用户信息,判断是否登入；
        Employee curren = (Employee) request.getSession(true).getAttribute("judgment");

        if (curren != null) {
            //已登入
            //判断路径
            if (pathMatcher.match(contextPath+"/admin/**",requestURI)){
                if (curren.getRole().equals("2")) {
                    //是管理员
                    return true;
                }else {
                    //不是管理员
                    return false;
                }
            }
            return true;
        }
            //重定向到登入页
        response.sendRedirect(contextPath+"/index.jsp");

        return false;
    }

    /**
     * 后处理回调方法，实现处理器的后处理（但在渲染视图之前），此时我们可以通过modelAndView（模型和视图对象）对模型数据进行处理或对视图进行处理，modelAndView也可能为null。
     */

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }
    /**
     * 整个请求处理完毕回调方法，即在视图渲染完毕时回调，如性能监控中我们可以在此记录结束时间并输出消耗时间，还可以进行一些资源清理，类似于try-catch-finally中的finally，但仅调用处理器执行链中
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
