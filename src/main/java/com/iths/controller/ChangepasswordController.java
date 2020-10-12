package com.iths.controller;

import com.iths.pojo.Employee;
import com.iths.service.IEmployeeService;
import com.iths.service.Imp.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
}
