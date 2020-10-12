package com.iths.controller;

import com.iths.pojo.Employee;
import com.iths.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
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

    //用户登入
    @RequestMapping("/login")
    public String login(String username,String password, HttpSession session, Model model){

        Employee employee = employeeService.employeeLogin(username,password);
        //没有此用户
        if (employee == null) {
            System.out.println("没有此用户");
//            存入request
            model.addAttribute("tips","用户或密码错误！");
            return "forward:/";
        }else {
            if (employee.getStatus() == "0"){
                System.out.println("此用户未通过审核！");
                model.addAttribute("warning","此用户未通过审核！");
                return "forward:/";
            }
        }
        //存入session，用于判断用户是否登入
        session.setAttribute("judgment",employee);
        return "forward:/notifications/notice";
    }



}
