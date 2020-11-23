package com.iths.controller;

import com.iths.pojo.Employee;
import com.iths.service.IEmployeeService;
import com.wf.captcha.utils.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/10/8 23:25
 */
@Controller
@RequestMapping("/employee")
public class LoginController {

    @Autowired
    private IEmployeeService employeeService;


    /**
     * 验证码
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/captcha")
    public void log(HttpServletRequest request, HttpServletResponse response) throws IOException {
        CaptchaUtil.out(100,45,4,request, response);
    }

    //用户登入
    @RequestMapping("/login")
    public String login(String username, String password, String verCode, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model){

        int i = 2/0;
//验证验证码是否正确
        if (!CaptchaUtil.ver(verCode, request)) {
            CaptchaUtil.clear(request);  // 清除session中的验证码
            model.addAttribute("vercode","验证码错误！");
            return "forward:/";
        }

        Employee employee = employeeService.employeeLogin(username,password);
        System.out.println("--"+employee);
        //没有此用户
        if (employee == null) {
            System.out.println("没有此用户");
//            存入request

            model.addAttribute("tips","用户或密码错误！");
            return "forward:/";
        }else
            if (employee.getRole().equals("0" )){

                model.addAttribute("warning","此用户未通过审核！");
                return "forward:/";

        }
        //存入session，用于判断用户是否登入
        session.setAttribute("judgment",employee);
        System.out.println("成功登入");
        return "forward:/notifications/notice";
    }



}
