package com.iths.controller;

import com.iths.pojo.Employee;
import com.iths.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @author 黄小帅
 * @version 1.0
 * @date 2020/9/19 15:02
 * 修改密码
 */
@Controller
public class ChangepasswordController {

    @Autowired
    private  IEmployeeService employeeService;


    //跳转修改密码页
    @RequestMapping("/jumpchangepassword")
    public String jumpChangePassword(){
        return "changepassword";
    }

    @RequestMapping("/changPassword")
    public String changPassword(Employee employee){
        System.out.println(employee);
        employeeService.updateEmployeeByEmployeeid(employee);
        return "forward:/jumpchangepassword";
    }
    @RequestMapping("/dropout")
    public  String dropOut(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
}