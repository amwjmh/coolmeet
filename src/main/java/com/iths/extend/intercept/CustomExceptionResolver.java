package com.iths.extend.intercept;

import org.omg.CORBA.SystemException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/11/23 12:52
 * 异常处理器
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {


    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
//        在命令行打印异常信息在程序中出错的位置及原因
        e.printStackTrace();

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("505");
        return modelAndView;
    }
}
